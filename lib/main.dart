import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/news/view/widget/news_item_details.dart';
import 'package:newapp/home/view/screeen/Home_Screen.dart';
import 'package:newapp/news/view_modle/news_view_modles.dart';
import 'package:newapp/settings/view/widget/setting_provider.dart';
import 'package:newapp/shared/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return BlocProvider(
      create: (_) => NewsViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routName: (_) => const HomeScreen(),
          NewsItemDetails.routeName: (_) => const NewsItemDetails(),
        },
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale:settingProvider.locale,
      ),
    );
  }
}
