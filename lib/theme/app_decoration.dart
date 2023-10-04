import 'package:flutter/material.dart';
import 'package:cal4/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get gradientBlue90096Blue900 => BoxDecoration(
        // borderRadius: BorderRadiusDirectional.only(topStart: Radius.zero,topEnd: Radius.zero,bottomStart: Radius.circular(19),bottomEnd: Radius.circular(19)),
        // borderRadius: BorderRadius.circular(19),
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0.0,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            ColorConstant.blue90096,
            ColorConstant.blue900,
          ],
        ),
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: ColorConstant.blueGray1000c,
        border: Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray700b2 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.blueGray700B2,
          width: getHorizontalSize(
            2,
          ),
        ),
      );
  static BoxDecoration get txtFillBlue90002 => BoxDecoration(
        color: ColorConstant.blue90002,
      );
  static BoxDecoration get outlineBlack9001 => BoxDecoration(
        color: ColorConstant.blueGray100,
        border: Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillIndigo500 => BoxDecoration(
        color: ColorConstant.indigo500,
      );
  static BoxDecoration get txtOutlineBlack9003f => BoxDecoration();
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get gradientBluegray100Bluegray10000 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0.97,
          ),
          end: Alignment(
            0.5,
            -0.15,
          ),
          colors: [
            ColorConstant.blueGray100,
            ColorConstant.blueGray10000,
          ],
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder26 = BorderRadius.circular(
    getHorizontalSize(
      26,
    ),
  );

  static BorderRadius roundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5,
    ),
  );

  static BorderRadius roundedBorder13 = BorderRadius.circular(
    getHorizontalSize(
      13,
    ),
  );

  static BorderRadius txtRoundedBorder13 = BorderRadius.circular(
    getHorizontalSize(
      13,
    ),
  );

  static BorderRadius roundedBorder9 = BorderRadius.circular(
    getHorizontalSize(
      9,
    ),
  );

  static BorderRadius roundedBorder19 = BorderRadius.only(
      topLeft: Radius.zero,
      topRight: Radius.zero,
      bottomLeft: Radius.circular(19),
      bottomRight: Radius.circular(19));
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
