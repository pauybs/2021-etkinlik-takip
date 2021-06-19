import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/product/widget/bottomNavigation/bottom_navigation.dart';
import 'package:fluttermvvmtemplate/view/home/view/home_view.dart';
import 'package:fluttermvvmtemplate/view/onboarding/view/onboarding_view.dart';
import 'package:fluttermvvmtemplate/view/profile/view/profile_view.dart';
import 'package:fluttermvvmtemplate/view/send_feed_view/view/send_feed_view.dart';
import 'package:provider/provider.dart';
import 'package:fluttermvvmtemplate/view/sign_in/view/sign_in_view.dart';
import 'package:fluttermvvmtemplate/view/sign_up/view/sign_up_view.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.prefrencesInit();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ...ApplicationProvider.instance!.dependItems,
      ...ApplicationProvider.instance!.uiChangesItems
    ],
    child: EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageManager.instance!.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      // home: OnBoardingPage(),
      home: BottomNavigation(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
