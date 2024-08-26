import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visionproject/Routes/routes.dart';
import 'package:visionproject/resource/images.dart';
import 'package:visionproject/shared/classes/theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Delay before navigating to the next screen
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, AppRoutes.signup),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppTheme.backgroundColor,
      systemNavigationBarColor: AppTheme.backgroundColor,
    ));

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppTheme.primaryColor,
              radius: 55.r,
              child: Image.asset(
                Images.logo,
                fit: BoxFit.fill,
                width: 70.w,
                height: 60.h,
              ),
            )
                .animate()
                .fade()
                .slideY(duration: 1000.ms, begin: 2, curve: Curves.easeInOut),
            40.verticalSpace,
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
