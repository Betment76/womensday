import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womensday/core/theme/sakura_colors.dart';

/// Тема приложения в гамме сакуры.
class AppTheme {
  static ThemeData createLightTheme() {
    final TextTheme textTheme = Typography.blackMountainView;
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: SakuraColors.sakura,
      brightness: Brightness.light,
      primary: SakuraColors.sakura,
      onPrimary: Colors.white,
      secondary: SakuraColors.blossom,
      onSecondary: SakuraColors.branch,
      surface: SakuraColors.cream,
      onSurface: SakuraColors.branch,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: SakuraColors.cream,
      textTheme: textTheme.apply(
        bodyColor: SakuraColors.branch,
        displayColor: SakuraColors.branch,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: SakuraColors.branch,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: SakuraColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: SakuraColors.card,
        indicatorColor: SakuraColors.petal,
        labelTextStyle: WidgetStateProperty.all(
          textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: SakuraColors.branch,
          ),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      splashFactory: InkRipple.splashFactory,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: SakuraColors.sakura,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: SakuraColors.deepBlossom,
          minimumSize: const Size.fromHeight(52),
          side: const BorderSide(color: SakuraColors.blossom),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
