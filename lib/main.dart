import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/navigation/routes.dart';
import 'package:maindmate/core/services/connectivity_service.dart';
import 'package:maindmate/core/services/responsive.dart';
import 'package:maindmate/core/services/store_service.dart';
import 'package:maindmate/core/services/user_session_service.dart';
import 'package:maindmate/core/theme/app_theme.dart';
import 'package:maindmate/features/main_bottom_navigation_bar/controller/main_bottom_navigation_binding.dart';

StoreService storeService = StoreService();
late String? targetRout;
late AppTheme appTheme;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await AppTheme.initialize();
  Get.put(ConnectivityService());
  final userSessionService =
      await Get.putAsync(() => UserSessionService().init());

  // Initialize MainBottomNavigationBinding
  MainBottomNavigationBinding().dependencies();
  bool token = await storeService.isContainKey('token');
  bool isRememberMeActive =
      await storeService.isContainKey('isRemmberMeActive');

  if (token && isRememberMeActive) {
    await userSessionService.getUserType();
    targetRout = userSessionService.isEmailVerified.value
        ? '/MainBottomNavigationBarWidget'
        : '/VerifyEmailScreen';
  } else {
    targetRout = "/";
  }

  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar')],
      path:
          'assets/localization', // <-- change the path of the translation files
      fallbackLocale: const Locale('ar'),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = AppTheme.themeMode;
  @override
  void initState() {
    _themeMode = AppTheme.themeMode;

    super.initState();
  }

  void updateThemeMode() {
    setState(() {
      _themeMode = AppTheme.themeMode;
    });
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        AppTheme.saveThemeMode(mode);
      });
  @override
  Widget build(BuildContext context) {
    appTheme = AppTheme.of(context);
    initSizes(context);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, j) => GetMaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          brightness: Brightness.light,
          scrollbarTheme: const ScrollbarThemeData(),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scrollbarTheme: const ScrollbarThemeData(),
        ),
        themeMode: _themeMode,
        debugShowCheckedModeBanner: false,
        getPages: appRoutes(),
        // initialRoute: '/MainBottomNavigationBarWidget',
        initialRoute: targetRout,
      ),
    );
  }
}
