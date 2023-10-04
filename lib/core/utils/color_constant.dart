import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color indigo200B8 = fromHex('#b8879ee1');

  static Color blue900 = fromHex('#0727cd');

  static Color gray400 = fromHex('#b7bac2');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color blueGray400 = fromHex('#888888');

  static Color blueGray10000 = fromHex('#00d9d9d9');

  static Color pink900 = fromHex('#711031');

  static Color indigo20000 = fromHex('#00879ee1');

  static Color black9003f = fromHex('#3f000000');

  static Color gray50 = fromHex('#f9f9f9');

  static Color gray100 = fromHex('#f5f5f5');

  static Color blueGray700B2 = fromHex('#b2484a6e');

  static Color indigo200 = fromHex('#879ee1');

  static Color black900 = fromHex('#000000');

  static Color blueGray1000c = fromHex('#0cd9d9d9');

  static Color blue90002 = fromHex('#0828ce');

  static Color blue90001 = fromHex('#0d2cce');

  static Color blueGray90001 = fromHex('#313043');

  static Color blueGray900 = fromHex('#313144');

  static Color blue90096 = fromHex('#960727cd');

  static Color whiteA700 = fromHex('#ffffff');

  static Color blue90000 = fromHex('#000d2cce');

  static Color indigo500 = fromHex('#314bd4');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
