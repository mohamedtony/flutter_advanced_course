import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/routing/app_router.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocAPP extends StatelessWidget {
  final AppRouter appRouter;

  const DocAPP({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        theme: ThemeData(primaryColor: ColorsManager.mainBlue),
        initialRoute: Routes.onBoardingScreen,
        
      ),
      // builder: (context, child) {
      //   return MaterialApp(
      //     debugShowCheckedModeBanner: false,
      //     onGenerateRoute: appRouter.generateRoute,
      //     home: const OnBoardingScreen(),
      //   );
      // },
    );
  }
}
