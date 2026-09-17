import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:womensday/core/constants/legal_documents.dart';
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

  @override
  Widget build(BuildContext context) {
    return SakuraBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: const Text('О приложении')),
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
                                    'Как считаются фазы',
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
                          const Padding(
                            padding: EdgeInsets.fromLTRB(18, 0, 18, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Цикл строится по вашим отметкам: подряд идущие дни месячных — один цикл. Средняя длина цикла и длительность месячных считаются по последним 6 циклам. Если истории ещё мало, берутся значения из настроек.',
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Овуляция: длина цикла минус 14 дней от начала текущего цикла. Фертильное окно: 5 дней до овуляции и 1 день после. Прогноз следующих месячных: начало последнего цикла плюс средняя длина.',
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Месячные, фолликулярная фаза, фертильное окно, овуляция, лютеиновая фаза и задержка — ориентир, а не медицинский диагноз. Приложение не заменяет консультацию врача и не является средством контрацепции. Данные остаются только на этом устройстве.',
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Юридические документы',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ФЗ-152, политика, соглашение и оферта',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: SakuraColors.wood),
                  ),
                  const SizedBox(height: 12),
                  ...LegalDocuments.all.map(
                    (LegalDocument document) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SectionCard(
                        padding: EdgeInsets.zero,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () => context.push('/legal', extra: document),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.article_outlined,
                                  color: SakuraColors.sakura,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    document.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: SakuraColors.sakura,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const DeveloperContactCard(),
                  if (_appVersion.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        'Версия $_appVersion',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: SakuraColors.wood,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SafeArea(
              top: false,
              child: ClickableLogoWidget(
                url: 'https://www.rustore.ru/catalog/developer/2pxggevr',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
