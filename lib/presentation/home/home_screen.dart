import 'dart:async';

import 'package:beans_instapay/presentation/cart/cart_view_model.dart';
import 'package:beans_instapay/presentation/components/app_bar_widget.dart';
import 'package:beans_instapay/presentation/components/drawer_widget.dart';
import 'package:beans_instapay/presentation/home/contact/contact_page.dart';
import 'package:beans_instapay/presentation/home/footer/footer_page.dart';
import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/presentation/home/main/main_page.dart';
import 'package:beans_instapay/presentation/home/product/coffee_beans_page.dart';
import 'package:beans_instapay/presentation/home/product/dripbag_page.dart';
import 'package:beans_instapay/presentation/home/product/stick_coffee_page.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
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
  bool hoverState = false;
  double scrollOffset = 0;

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

    final cartViewModel = context.watch<CartViewModel>();
    final state = cartViewModel.state;
    final itemCount = state.cartInfo.length;
    double appBarHeight = 70;
    double widthTemp = (MediaQuery.of(context).size.width > 1200)
        ? 150 * ((MediaQuery.of(context).size.width - 1200) / 720)
        : 0;
    double categoryWidth = 130 + widthTemp;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        scrollOffset = scrollController.offset;
        if (scrollOffset < 150) {
          if (hoverState) {
            changeHoverState();
          }
        }
      },
    );

    if (Responsive.isPage1(context) ||
        Responsive.isPage2(context) ||
        Responsive.isPage3(context)) {
      if (hoverState) {
        changeHoverState();
      }
    }

    return GestureDetector(
      onTap: () {
        if (hoverState == true) {
          changeHoverState();
        }
      },
      child: Scaffold(
        drawer: DrawerWidget(
          itemCount: itemCount,
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: Visibility(
            visible: scrollOffset > 150,
            child: AppBarWidget(
              itemCount: itemCount,
              changeHoverState: changeHoverState,
            ),
          ),
        ),
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
        body: Stack(
          children: [
            SafeArea(
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
                      height: Responsive.isPage5(context) ? 150 : 60,
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
            if (hoverState)
              Visibility(
                visible: scrollOffset > 150,
                child: Positioned(
                  right: categoryWidth,
                  top: 2,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 280,
                      height: 180,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/detail/beans');
                                },
                                child: OnHoverDetect(
                                  builder: (isHovered) {
                                    final color = (isHovered)
                                        ? selectColor
                                        : Colors.black;
                                    return Text(
                                      'Coffee Beans',
                                      style: TextStyle(color: color),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/detail/dripbag');
                                },
                                child: OnHoverDetect(
                                  builder: (isHovered) {
                                    final color = (isHovered)
                                        ? selectColor
                                        : Colors.black;
                                    return Text(
                                      'Fedora Dripbag',
                                      style: TextStyle(color: color),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/detail/stick');
                                },
                                child: OnHoverDetect(
                                  builder: (isHovered) {
                                    final color = (isHovered)
                                        ? selectColor
                                        : Colors.black;
                                    return Text(
                                      'Stick Coffee',
                                      style: TextStyle(color: color),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void changeHoverState() {
    setState(() {
      hoverState = !hoverState;
    });
  }
}
