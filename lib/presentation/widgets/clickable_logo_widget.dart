import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:womensday/core/theme/sakura_colors.dart';

/// Кликабельный логотип МойСофт.
class ClickableLogoWidget extends StatelessWidget {
  const ClickableLogoWidget({
    super.key,
    this.logoAsset = 'assets/icons/logoms1.png',
    this.url = 'https://мойсофт.рф',
    this.height = 40,
    this.copyrightText = '© 2025–2026\nВсе права защищены',
  });

  final String logoAsset;
  final String url;
  final double height;
  final String? copyrightText;

  @override
  Widget build(BuildContext context) {
    final int cacheHeight = (height * MediaQuery.devicePixelRatioOf(context))
        .round()
        .clamp(40, 160);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: executeOpenUrl,
            child: Image.asset(
              logoAsset,
              height: height,
              fit: BoxFit.contain,
              cacheHeight: cacheHeight,
              filterQuality: FilterQuality.low,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                    return SizedBox(height: height);
                  },
            ),
          ),
          if (copyrightText != null && copyrightText!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              copyrightText!,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: SakuraColors.wood),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> executeOpenUrl() async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {}
  }
}
