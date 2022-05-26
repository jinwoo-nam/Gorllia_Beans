import 'dart:async';

import 'package:beans_instapay/presentation/home/contact/contact_page.dart';
import 'package:beans_instapay/presentation/home/footer/footer_page.dart';
import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/presentation/home/main/main_page.dart';
import 'package:beans_instapay/presentation/home/product/coffee_beans_page.dart';
import 'package:beans_instapay/presentation/home/product/dripbag_page.dart';
import 'package:beans_instapay/presentation/home/product/stick_coffee_page.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    Future.microtask(() {
      final viewModel = context.read<HomeViewModel>();

      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(moveToDripBag: () {
          scrollController.animateTo(
            viewModel.getCalcMainHeight(context),
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        }, moveToCoffeeBeans: () {
          scrollController.animateTo(
            viewModel.getCalcMainHeight(context) +
                (viewModel.getCalcProductHeight(context) * 2),
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

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
                  maxHeight: viewModel.getCalcMainHeight(context),
                  minHeight: viewModel.getCalcMainHeight(context),
                ),
                child: const MainPage(),
              ),
              Container(
                color: Colors.white,
                height: 60,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: viewModel.getCalcProductHeight(context),
                  minHeight: viewModel.getCalcProductHeight(context),
                ),
                child: const DripBagPage(),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: viewModel.getCalcProductHeight(context),
                  minHeight: viewModel.getCalcProductHeight(context),
                ),
                child: const StickCoffeePage(),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: viewModel.getCalcProductHeight(context),
                  minHeight: viewModel.getCalcProductHeight(context),
                ),
                child: const CoffeeBeansPage(),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: viewModel.getCalcContactPageHeight(context),
                  minHeight: viewModel.getCalcContactPageHeight(context),
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
