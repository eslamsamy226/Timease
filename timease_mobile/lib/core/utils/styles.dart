import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';

abstract class Styles {
  static const textStyleFullButton =
      TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400);
  static const textStyleSpaceButton = TextStyle(
    color: kPrimaryColor,
    fontSize: 18,
  );
  static const customRowTextStyle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w700, color: kPrimaryColor);

  static const textStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
  );

  static const textStyle42 = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.w800,
  );

  static const textStyle15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}