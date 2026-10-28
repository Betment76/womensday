import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/constants/app_links.dart';
import 'package:womensday/core/constants/legal_documents.dart';
import 'package:womensday/core/extensions/legal_document_l10n.dart';
import 'package:womensday/l10n/app_localizations.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/presentation/widgets/clickable_logo_widget.dart';
import 'package:womensday/presentation/widgets/developer_contact_card.dart';
import 'package:womensday/presentation/widgets/sakura_background.dart';
import 'package:womensday/presentation/widgets/section_card.dart';

/// Справка о фазах цикла и юридические документы.
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool _isPhasesExpanded = false;
  bool _isLegalExpanded = false;
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    unawaited(_executeLoadVersion());
  }

  Future<void> _executeLoadVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    if (!mounted) {
      return;
    }
    setState(() => _appVersion = '${info.version} (${info.buildNumber})');
  }

  /// Юрдокументы: один документ — карточка-ссылка (googleplay), несколько —
  /// одна раскрывающаяся кнопка со списком (rustore).
  Widget _executeBuildLegalCard(AppLocalizations l10n) {
    final List<LegalDocument> documents = LegalDocuments.all;
    if (documents.length == 1) {
      final LegalDocument document = documents.first;
      return SectionCard(
        padding: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => context.push('/legal', extra: document),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: <Widget>[
                const Icon(Icons.article_outlined, color: SakuraColors.sakura),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    document.localizedTitle(l10n),
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                const Icon(Icons.chevron_right, color: SakuraColors.sakura),
              ],
            ),
          ),
        ),
      );
    }
    return SectionCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () => setState(() => _isLegalExpanded = !_isLegalExpanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      l10n.legalSectionTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Icon(
                    _isLegalExpanded ? Icons.expand_less : Icons.expand_more,
                    color: SakuraColors.sakura,
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: AppConstants.animationDuration,
            curve: AppConstants.animationCurve,
            alignment: Alignment.topCenter,
            child: _isLegalExpanded
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
                    child: Column(
                      children: <Widget>[
                        for (final LegalDocument document in documents)
                          InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () =>
                                context.push('/legal', extra: document),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.article_outlined,
                                    color: SakuraColors.sakura,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      document.localizedTitle(l10n),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: SakuraColors.sakura,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }

  /// Карточка «Все приложения МойСофт»: rustore — сайт, googleplay — каталог.
  Widget _executeBuildMoiSoftAppsCard(AppLocalizations l10n) {
    return SectionCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => unawaited(_executeOpenMoiSoftApps()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Row(
            children: <Widget>[
              const Icon(Icons.grid_view_rounded, color: SakuraColors.sakura),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.allMoiSoftApps,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              const Icon(Icons.chevron_right, color: SakuraColors.sakura),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _executeOpenMoiSoftApps() async {
    try {
      await launchUrl(
        Uri.parse(AppLinks.moiSoftApps),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      // Браузер недоступен — карточка не критична.
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return SakuraBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(l10n.aboutTitle)),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                children: [
                  SectionCard(
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            setState(() {
                              _isPhasesExpanded = !_isPhasesExpanded;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    l10n.aboutPhasesTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Icon(
                                  _isPhasesExpanded
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  color: SakuraColors.sakura,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_isPhasesExpanded)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(l10n.aboutPhasesBody1),
                                const SizedBox(height: 10),
                                Text(l10n.aboutPhasesBody2),
                                const SizedBox(height: 10),
                                Text(l10n.aboutPhasesBody3),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _executeBuildLegalCard(l10n),
                  const SizedBox(height: 12),
                  _executeBuildMoiSoftAppsCard(l10n),
                  const SizedBox(height: 12),
                  const DeveloperContactCard(),
                  if (_appVersion.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        '${l10n.versionLabel} $_appVersion',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: SakuraColors.wood,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SafeArea(top: false, child: ClickableLogoWidget()),
          ],
        ),
      ),
    );
  }
}
