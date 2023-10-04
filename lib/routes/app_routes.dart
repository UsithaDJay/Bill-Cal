import 'package:flutter/material.dart';
import 'package:cal4/screens/homePage.dart';
import 'package:cal4/Widgets/ceb_bill_widget.dart';
import 'package:cal4/Widgets/leco_bill_widget.dart';
import 'package:cal4/Widgets/water_bill_widget.dart';

class AppRoutes {
  static const String homePage = '/homePage';
  static const String cebBillWidget = '/ceb_Bill_widget';
  static const String lecoBillWidget = '/leco_Bill_widget';
  static const String waterBillWidget = '/water_bill_widget';

  Map<String, WidgetBuilder> routes = {
    homePage: (context) => const MyHomePage(),
    cebBillWidget: (context) => const CebBillWidget(),
    lecoBillWidget: (context) => const LecoBillWidget(),
    waterBillWidget: (context) => const WaterBillWidget(),
  };
}
