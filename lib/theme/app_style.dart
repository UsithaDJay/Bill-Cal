import 'package:flutter/material.dart';
import 'package:cal4/core/app_export.dart';

class AppStyle {
  static TextStyle txtPoppinsMedium12 = TextStyle(
    color: ColorConstant.blueGray900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsRegular24 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular16 = TextStyle(
    color: ColorConstant.blueGray400,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtGlegooBold24 = TextStyle(
    color: ColorConstant.blue90001,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Glegoo',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtGlegooBold24Pink900 = TextStyle(
    color: ColorConstant.pink900,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Glegoo',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtRobotoRegular20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );
}
