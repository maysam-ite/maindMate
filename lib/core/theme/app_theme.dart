// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class AppTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void toggleThemeMode() {
    final isDarkMode = _prefs?.getBool(kThemeModeKey) ?? false;
    saveThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static AppTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color primaryBtnText;
  late Color lineColor;
  late Color white70;

  TextStyle get text10 => typography.text10;
  TextStyle get text12 => typography.text12;
  TextStyle get text14 => typography.text14;
  TextStyle get text16 => typography.text16;
  TextStyle get text18 => typography.text18;
  TextStyle get text24 => typography.text24;
  TextStyle get text26 => typography.text26;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends AppTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF615BA4);
  late Color secondary = const Color(0xFF36AFC5);
  late Color tertiary = const Color(0xFF003158);
  late Color alternate = const Color(0xFFF19642);
  late Color primaryBackground = const Color(0xFFFFFFFF);

  late Color primaryText = const Color(0xFF0D121D);
  late Color secondaryText = const Color(0xFF57636C);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF616161);
  late Color accent2 = const Color(0xFF757575);
  late Color accent3 = const Color(0xFFE0E0E0);
  late Color accent4 = const Color(0xFFEEEEEE);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
  late Color white70 = Color(0xB3FFFFFF);
}

abstract class Typography {
  TextStyle get text10;
  TextStyle get text12;
  TextStyle get text14;
  TextStyle get text16;
  TextStyle get text18;
  TextStyle get text24;
  TextStyle get text26;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final AppTheme theme;

  TextStyle get text10 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0.sp,
      );
  TextStyle get text12 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0.sp,
      );
  TextStyle get text14 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0.sp,
      );
  TextStyle get text16 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0.sp,
      );
  TextStyle get text18 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0.sp,
      );
  TextStyle get text24 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0.sp,
      );
  TextStyle get text26 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 26.0.sp,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final AppTheme theme;

  TextStyle get text10 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
  TextStyle get text12 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  TextStyle get text14 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      );
  TextStyle get text16 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  TextStyle get text18 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  TextStyle get text24 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  TextStyle get text26 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 26.0,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final AppTheme theme;

  TextStyle get text10 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
  TextStyle get text12 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  TextStyle get text14 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      );
  TextStyle get text16 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  TextStyle get text18 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  TextStyle get text24 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  TextStyle get text26 => TextStyle(
        fontFamily: 'NeoSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 26.0,
      );
}

class DarkModeTheme extends AppTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF225862);
  late Color secondary = const Color(0xFFFFBB0D);
  late Color tertiary = const Color(0xFF4741FF);
  late Color alternate = const Color(0xFFF19642);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);
  late Color primaryBackground = const Color(0xFF121926);
  late Color secondaryBackground = const Color(0xFF0D121D);
  late Color accent1 = const Color(0xFFEEEEEE);
  late Color accent2 = const Color(0xFFE0E0E0);
  late Color accent3 = const Color(0xFF757575);
  late Color accent4 = const Color(0xFF616161);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF212C36);
  late Color white70 = Color(0xB3FFFFFF);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      copyWith(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        height: lineHeight,
      );
}
