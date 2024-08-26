import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visionproject/Routes/routes.dart';
import 'package:visionproject/shared/classes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'My App',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                textStyle: AppTheme.buttonText,
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 61, 74, 78),
                textStyle: AppTheme.buttonText,
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primaryColor,
                textStyle: AppTheme.buttonText,
              ),
            ),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(
                  primary: AppTheme.primaryColor,
                  secondary: AppTheme.accentColor,
                  surface: AppTheme.backgroundColor,
                )
                .copyWith(surface: Colors.white),
          ),
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.define(),
        );
      },
    );
  }
}
