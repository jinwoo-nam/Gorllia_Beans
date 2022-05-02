import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget page1;
  final Widget page2;
  final Widget page3;
  final Widget page4;
  final Widget page5;

  const Responsive({
    Key? key,
    required this.page1,
    required this.page2,
    required this.page3,
    required this.page4,
    required this.page5,
  }) : super(key: key);

  static bool isPage1(BuildContext context) =>
      MediaQuery.of(context).size.width < 580;

  static bool isPage2(BuildContext context) =>
      MediaQuery.of(context).size.width < 770 &&
      MediaQuery.of(context).size.width >= 580;

  static bool isPage3(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 730;

  static bool isPage4(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 1000;

  static bool isPage5(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1200) {
      return page5;
    } else if (_size.width >= 1000) {
      return page4;
    } else if (_size.width >= 770) {
      return page3;
    } else if (_size.width >= 580) {
      return page2;
    } else {
      return page1;
    }
  }
}
