import 'dart:async';

import 'package:beans_instapay/presentation/home/home_event.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel with ChangeNotifier {
  double calcMainHeight = mainPageHeight;
  double calcProductHeight = productPageHeight;
  double calcContactPageHeight = contactPageHeight;

  double getCalcMainHeight(BuildContext context) {
    if (Responsive.isPage1(context)) {
      calcMainHeight = mainPageHeight;
    } else if (Responsive.isPage2(context)) {
      calcMainHeight = mainPageHeight + 80;
    } else if (Responsive.isPage3(context)) {
      calcMainHeight = mainPageHeight + 200;
    } else if (Responsive.isPage4(context)) {
      calcMainHeight = mainPageHeight + 300;
    } else {
      calcMainHeight = mainPageHeight + 350;
    }
    return calcMainHeight;
  }

  double getCalcProductHeight(BuildContext context) {
    if (Responsive.isPage1(context)) {
      calcProductHeight = productPageHeight - 80;
    } else if (Responsive.isPage2(context)) {
      calcProductHeight = productPageHeight - 80;
    } else if (Responsive.isPage3(context)) {
      calcProductHeight = productPageHeight;
    } else if (Responsive.isPage4(context)) {
      calcProductHeight = productPageHeight - 600;
    } else {
      calcProductHeight = (MediaQuery.of(context).size.width / 2) > 600
          ? 600
          : (MediaQuery.of(context).size.width / 2);
      //calcProductHeight = productPageHeight-600;
    }
    return calcProductHeight;
  }

  double getCalcContactPageHeight(BuildContext context) {
    if (Responsive.isPage1(context) ||
        Responsive.isPage2(context) ||
        Responsive.isPage3(context)) {
      calcContactPageHeight = contactPageHeight;
    } else if (Responsive.isPage4(context)) {
      calcContactPageHeight = contactPageHeight - 250;
    } else {
      calcContactPageHeight = contactPageHeight - 350;
    }

    return calcContactPageHeight;
  }

  final _eventController = StreamController<HomeEvent>.broadcast();

  Stream<HomeEvent> get eventStream => _eventController.stream;

  void onEvent(HomeEvent event) {
    event.when(
      moveToDripBag: _moveToDripBag,
      moveToCoffeeBeans: _moveToCoffeeBeans,
    );
  }

  void _moveToDripBag() async {
    notifyListeners();
    _eventController.add(const HomeEvent.moveToDripBag());
  }

  void _moveToCoffeeBeans() async {
    notifyListeners();
    _eventController.add(const HomeEvent.moveToCoffeeBeans());
  }

  void launchURL(Uri query) async {
    if (!await launchUrl(query)) throw 'Could not launch $query';
  }
}
