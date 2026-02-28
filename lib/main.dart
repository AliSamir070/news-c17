import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:news_c17/core/DI/di.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/core/resources/app_theme.dart';
import 'package:news_c17/core/resources/routes_manager.dart';
import 'package:news_c17/data/model/sources_response/Source.dart';
import 'package:news_c17/data/model/sources_response/Sources_response.dart';
import 'package:news_c17/hive_registrar.g.dart';
import 'package:news_c17/ui/home/screen/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ApiManager.init();
  configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapters();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'News App',
          routes:{
            RoutesManager.home:(_)=>HomeScreen()
          },
          theme: AppTheme.lightTheme,
          initialRoute: RoutesManager.home,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

