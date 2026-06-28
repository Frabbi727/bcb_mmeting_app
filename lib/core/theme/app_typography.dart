import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  // Material 3 Typography Scale Font Sizes
  static const double displayLargeSize = 57.0;
  static const double displayMediumSize = 45.0;
  static const double displaySmallSize = 36.0;

  static const double headlineLargeSize = 32.0;
  static const double headlineMediumSize = 28.0;
  static const double headlineSmallSize = 24.0;

  static const double titleLargeSize = 22.0;
  static const double titleMediumSize = 16.0;
  static const double titleSmallSize = 14.0;

  static const double bodyLargeSize = 16.0;
  static const double bodyMediumSize = 14.0;
  static const double bodySmallSize = 12.0;

  static const double labelLargeSize = 14.0;
  static const double labelMediumSize = 12.0;
  static const double labelSmallSize = 11.0;

  // Font Weights
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightBold = FontWeight.w700;

  // Font Styles / TextStyles Constants (Material 3 standard keys)
  static const TextStyle displayLarge = TextStyle(
    fontSize: displayLargeSize,
    fontWeight: weightRegular,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: displayMediumSize,
    fontWeight: weightRegular,
    letterSpacing: 0.0,
    height: 1.16,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: displaySmallSize,
    fontWeight: weightRegular,
    letterSpacing: 0.0,
    height: 1.22,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: headlineLargeSize,
    fontWeight: weightRegular,
    letterSpacing: 0.0,
    height: 1.25,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: headlineMediumSize,
    fontWeight: weightRegular,
    letterSpacing: 0.0,
    height: 1.29,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: headlineSmallSize,
    fontWeight: weightRegular,
    letterSpacing: 0.0,
    height: 1.33,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: titleLargeSize,
    fontWeight: weightRegular,
    letterSpacing: 0.0,
    height: 1.27,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: titleMediumSize,
    fontWeight: weightMedium,
    letterSpacing: 0.15,
    height: 1.50,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: titleSmallSize,
    fontWeight: weightMedium,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: bodyLargeSize,
    fontWeight: weightRegular,
    letterSpacing: 0.5,
    height: 1.50,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: bodyMediumSize,
    fontWeight: weightRegular,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: bodySmallSize,
    fontWeight: weightRegular,
    letterSpacing: 0.4,
    height: 1.33,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: labelLargeSize,
    fontWeight: weightMedium,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: labelMediumSize,
    fontWeight: weightMedium,
    letterSpacing: 0.5,
    height: 1.33,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: labelSmallSize,
    fontWeight: weightMedium,
    letterSpacing: 0.5,
    height: 1.45,
  );
}
