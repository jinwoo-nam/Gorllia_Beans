import 'package:beans_instapay/presentation/home/contact/contact_page.dart';
import 'package:beans_instapay/presentation/home/footer/footer_page.dart';
import 'package:beans_instapay/presentation/home/main/main_page.dart';
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
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: mainPageHeight,
                minHeight: mainPageHeight,
              ),
              child: const MainPage(),
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
