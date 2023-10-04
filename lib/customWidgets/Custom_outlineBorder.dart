import 'package:flutter/material.dart';

class CustomOutlineInputBorder extends OutlineInputBorder {
  final Color borderColor;

  CustomOutlineInputBorder({
    this.borderColor = const Color.fromARGB(255, 73, 74, 111), // Change the border color here
    BorderSide borderSide = const BorderSide(),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    double gapPadding = 4.0,
  }) : super(
          borderSide: borderSide.copyWith(color: borderColor),
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
}