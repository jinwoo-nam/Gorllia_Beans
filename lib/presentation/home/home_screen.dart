import 'package:beans_instapay/presentation/home/contact/contact_page.dart';
import 'package:beans_instapay/presentation/home/footer/footer_page.dart';
import 'package:beans_instapay/presentation/home/main/main_page.dart';
import 'package:beans_instapay/presentation/home/product/coffee_beans_page.dart';
import 'package:beans_instapay/presentation/home/product/dripbag_page.dart';
import 'package:beans_instapay/presentation/home/product/stick_coffee_page.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double calcMainHeight, calcProductHeight, calcContactPageHeight;
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

    if (Responsive.isPage1(context)) {
      calcProductHeight = productPageHeight;
    } else if (Responsive.isPage2(context)) {
      calcProductHeight = productPageHeight + 80;
    } else if (Responsive.isPage3(context)) {
      calcProductHeight = productPageHeight + 200;
    } else if (Responsive.isPage4(context)) {
      calcProductHeight = productPageHeight - 400;
    } else {
      calcProductHeight = (MediaQuery.of(context).size.width / 2);
    }

    if (Responsive.isPage1(context) ||
        Responsive.isPage2(context) ||
        Responsive.isPage3(context)) {
      calcContactPageHeight = contactPageHeight;
    } else if (Responsive.isPage4(context)) {
      calcContactPageHeight = contactPageHeight - 250;
    } else {
      calcContactPageHeight = contactPageHeight - 350;
    }

    return Scaffold(
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          shape: const RoundedRectangleBorder(),
          onPressed: () {
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
            );
          },
          child: const Icon(Icons.keyboard_arrow_up_sharp),
          backgroundColor: selectColor.withOpacity(0.6),
        ),
      ),
      body: SafeArea(
        child: NotificationListener(
          onNotification: (event) {
            if (event is UserScrollNotification) {
              if (scrollController.offset != 0) {
                setState(() {});
              } else {
                setState(() {});
              }
            }
            return false;
          },
          child: ListView(
            controller: scrollController,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: calcMainHeight,
                  minHeight: calcMainHeight,
                ),
                child: const MainPage(),
              ),
              Container(
                color: Colors.white,
                height: 60,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: calcProductHeight,
                  minHeight: calcProductHeight,
                ),
                child: const DripBagPage(),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: calcProductHeight,
                  minHeight: calcProductHeight,
                ),
                child: const StickCoffeePage(),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: calcProductHeight,
                  minHeight: calcProductHeight,
                ),
                child: const CoffeeBeansPage(),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: calcContactPageHeight,
                  minHeight: calcContactPageHeight,
                ),
                child: const ContactPage(),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 120),
                child: const FooterPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
