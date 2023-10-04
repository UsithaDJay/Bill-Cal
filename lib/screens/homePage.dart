import 'dart:async';
import 'package:cal4/core/app_export.dart';
import 'package:flutter/material.dart';

import '/widgets/ceb_bill_widget.dart';
import '/widgets/leco_bill_widget.dart';
import '/widgets/water_bill_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(96, 179, 18, 18),
      child: Image.asset('assets/img_1.png',
          height: MediaQuery.of(context).size.height, fit: BoxFit.cover),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int tabsCount = 3;

    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(getVerticalSize(100)),
          child: AppBar(
            backgroundColor: ColorConstant.blue90096,
            // elevation: 0,
            flexibleSpace:
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              TabBar(
                labelPadding: const EdgeInsets.only(
                  top: 8.0,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 15,
                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)),
                    color: Color.fromARGB(255, 240, 248, 250)),
                tabs: [
                  Tab(
                    child: CustomImageView(
                      imagePath: ImageConstant.imgCeblogoa2efcadfd1seeklogo,
                      alignment: Alignment.center,
                      placeHolder: ImageConstant.imageNotFound,
                    ),
                  ),
                  Tab(
                    child: CustomImageView(
                      imagePath: ImageConstant.imgDownloadremovebgpreview,
                      alignment: Alignment.center,
                      placeHolder: ImageConstant.imageNotFound,
                    ),
                  ),
                  Tab(
                    child: CustomImageView(
                      imagePath: ImageConstant.imgNwsdblogo1,
                      alignment: Alignment.center,
                      placeHolder: ImageConstant.imageNotFound,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstant.background2),
                  fit: BoxFit.fill)),
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              Navigator(
                key: UniqueKey(),
                initialRoute: AppRoutes.cebBillWidget,
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case AppRoutes.cebBillWidget:
                      return MaterialPageRoute(
                          builder: (context) => const CebBillWidget());
                    default:
                      return MaterialPageRoute(
                          builder: (context) => const CebBillWidget());
                  }
                },
              ),
              Navigator(
                key: UniqueKey(),
                initialRoute: AppRoutes.lecoBillWidget,
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case AppRoutes.lecoBillWidget:
                      return MaterialPageRoute(
                          builder: (context) => const LecoBillWidget());
                    default:
                      return MaterialPageRoute(
                          builder: (context) => const LecoBillWidget());
                  }
                },
              ),
              Navigator(
                key: UniqueKey(),
                initialRoute: AppRoutes.waterBillWidget,
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case AppRoutes.waterBillWidget:
                      return MaterialPageRoute(
                          builder: (context) => const WaterBillWidget());
                    default:
                      return MaterialPageRoute(
                          builder: (context) => const WaterBillWidget());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
