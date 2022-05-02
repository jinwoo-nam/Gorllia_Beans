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
  final pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double calcMainHeight, calcProductHeight;
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
      calcProductHeight = (MediaQuery.of(context).size.width/2);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(),
        onPressed: () {},
        child: const Icon(Icons.keyboard_arrow_up_sharp),
        backgroundColor: selectColor.withOpacity(0.6),
      ),
      body: SafeArea(
        child: ListView(
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
              constraints: const BoxConstraints(
                maxHeight: productPageHeight,
                minHeight: productPageHeight,
              ),
              child: const StickCoffeePage(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: productPageHeight,
                minHeight: productPageHeight,
              ),
              child: const CoffeeBeansPage(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: contactPageHeight,
                minHeight: contactPageHeight,
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
    );
  }
}
