import 'package:beans_instapay/presentation/cart/cart_view_model.dart';
import 'package:beans_instapay/presentation/cart/widget/cart_info_list.dart';
import 'package:beans_instapay/presentation/home/contact/contact_page.dart';
import 'package:beans_instapay/presentation/home/footer/footer_page.dart';
import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../responsive/responsive.dart';
import 'package:provider/provider.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../ui/color.dart';

const String homePageUrl = 'https://www.instapay.kr/';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double bodyPadding = 16;

  bool hoverState = false;

  bool isCategoryClick = false;

  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();
    final viewModel = context.watch<CartViewModel>();
    final state = viewModel.state;
    final itemCount = state.cartInfo.length;
    int index = -1;

    int sumOfProduct = viewModel.getSumOfProduct();
    int shipmentFee = sumOfProduct < 20000 ? 2000 : 0;
    int totalPrice = sumOfProduct + shipmentFee;

    if (Responsive.isPage1(context)) {
      bodyPadding = 32;
    } else if (Responsive.isPage2(context) || Responsive.isPage3(context)) {
      bodyPadding = 32;
    } else if (Responsive.isPage4(context)) {
      bodyPadding = 50;
    } else if (Responsive.isPage5(context)) {
      bodyPadding = 200 * ((MediaQuery.of(context).size.width - 1200) / 720);
    }

    // final homeViewModel = context.watch<HomeViewModel>();
    final double lastAppbarWidth =
        150 * ((MediaQuery.of(context).size.width - 1200) / 720);
    double appBarHeight = 70;
    // double categoryWidth = 50;
    // if (Responsive.isPage5(context)) {
    //   categoryWidth += lastAppbarWidth;
    // }

    return GestureDetector(
      onTap: () {
        if (hoverState == true) {
          changeHoverState();
        }
      },
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              OnHoverDetect(
                builder: (isHovered) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    mouseCursor: SystemMouseCursors.click,
                    title: const Text(
                      'HOME',
                      style: TextStyle(
                        color: secondaryGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              const Divider(
                height: 1,
                color: fontColorGrey,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isCategoryClick = !isCategoryClick;
                  });
                },
                mouseCursor: SystemMouseCursors.click,
                title: const Text(
                  'CATEGORY',
                  style: TextStyle(
                    color: secondaryGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_down),
              ),
              const Divider(
                height: 1,
                color: fontColorGrey,
              ),
              if (isCategoryClick)
                Column(
                  children: [
                    ListTile(
                      tileColor: Colors.grey.withOpacity(0.5),
                      mouseCursor: SystemMouseCursors.click,
                      onTap: () {
                        Navigator.pushNamed(context, '/detail/beans');
                      },
                      title: const Text(
                        'COFFEE BEANS',
                        style: TextStyle(
                          color: secondaryGrey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: fontColorGrey,
                    ),
                    ListTile(
                      tileColor: Colors.grey.withOpacity(0.5),
                      mouseCursor: SystemMouseCursors.click,
                      onTap: () {
                        Navigator.pushNamed(context, '/detail/dripbag');
                      },
                      title: const Text(
                        'FEDORA DRIPBAG',
                        style: TextStyle(
                          color: secondaryGrey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: fontColorGrey,
                    ),
                    ListTile(
                      tileColor: Colors.grey.withOpacity(0.5),
                      mouseCursor: SystemMouseCursors.click,
                      onTap: () {
                        Navigator.pushNamed(context, '/detail/stick');
                      },
                      title: const Text(
                        'STICK COFFEE',
                        style: TextStyle(
                          color: secondaryGrey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: fontColorGrey,
                    ),
                  ],
                ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
                mouseCursor: SystemMouseCursors.click,
                title: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        'CART',
                        style: TextStyle(
                          color: secondaryGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: secondaryGrey.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Text('$itemCount'),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: fontColorGrey,
              ),
              ListTile(
                onTap: () {
                  final uri = Uri.parse(homePageUrl);
                  launchURL(uri);
                },
                mouseCursor: SystemMouseCursors.click,
                title: const Text(
                  'INSTAPAY',
                  style: TextStyle(
                    color: secondaryGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: fontColorGrey,
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            //toolbarHeight: 90,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Image(
                image: AssetImage('img/GB_widelogo_brown.png'),
                fit: BoxFit.cover,
                width: 190,
              ),
            ),
            actions: [
              if (Responsive.isPage1(context) ||
                  Responsive.isPage2(context) ||
                  Responsive.isPage3(context))
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                  ),
                ),
              if (Responsive.isPage4(context) || Responsive.isPage5(context))
                Padding(
                  padding: const EdgeInsets.only(right: 70.0),
                  child: Row(
                    children: [
                      OnHoverDetect(
                        builder: (isHovered) {
                          final color = isHovered ? selectColor : Colors.black;
                          return TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Text(
                              'HOME',
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      OnHoverDetect(
                        builder: (isHovered) {
                          final color = isHovered ? selectColor : Colors.black;
                          return TextButton(
                            onPressed: () {
                              changeHoverState();
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'CATEGORY',
                                  style: TextStyle(
                                    color: color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: color,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      OnHoverDetect(
                        builder: (isHovered) {
                          final color = isHovered ? selectColor : Colors.black;
                          return TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'CART',
                                    style: TextStyle(
                                      color: color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: secondaryGrey.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '$itemCount',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      OnHoverDetect(
                        builder: (isHovered) {
                          final color = isHovered ? selectColor : Colors.black;
                          return TextButton(
                            onPressed: () {
                              final uri = Uri.parse(homePageUrl);
                              launchURL(uri);
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Text(
                              'INSTAPAY',
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                      if (Responsive.isPage5(context))
                        SizedBox(
                          width: lastAppbarWidth,
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: SizedBox(
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            '장바구니',
                            style: GoogleFonts.notoSans(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (state.cartInfo.isEmpty)
                          Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 400,
                                minHeight: 400,
                              ),
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 40.0,
                                      bottom: 20,
                                    ),
                                    child: Text(
                                      '장바구니에 담긴 상품이 없습니다.',
                                    ),
                                  ),
                                  Text(
                                    '상품을 담아주세요.',
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          ListView(
                            shrinkWrap: true,
                            children: [
                              ...state.cartInfo.map((cart) {
                                index += 1;
                                return CartInfoList(
                                  cartInfo: cart,
                                  index: index,
                                  onChanged: viewModel.updateCart,
                                  onDelete: viewModel.deleteCart,
                                );
                              }).toList(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 25.0,
                                  horizontal: 100,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '합계 : ',
                                          style: GoogleFonts.notoSans(
                                            color: fontColorGrey,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          currencyFormat(sumOfProduct),
                                          style: GoogleFonts.notoSans(
                                            color: fontColorGrey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '배송비 : ',
                                          style: GoogleFonts.notoSans(
                                            color: fontColorGrey,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          currencyFormat(shipmentFee),
                                          style: GoogleFonts.notoSans(
                                            color: fontColorGrey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '결제 금액 : ',
                                          style: GoogleFonts.notoSans(
                                            color: fontColorGrey,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          currencyFormat(totalPrice),
                                          style: GoogleFonts.notoSans(
                                            color: fontColorGrey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (kIsWeb)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Container(
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                          ),
                                          child: const Center(
                                            child: Text('QR'),
                                          ),
                                        ),
                                      ),
                                    if (!kIsWeb)
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0),
                                          child: Container(
                                            width: 90,
                                            height: 55,
                                            color: selectColor,
                                            child: Center(
                                              child: Text(
                                                '결제하기',
                                                style: GoogleFonts.notoSans(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: homeViewModel.getCalcContactPageHeight(context),
                  minHeight: homeViewModel.getCalcContactPageHeight(context),
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

  void changeHoverState() {
    setState(() {
      hoverState = !hoverState;
    });
  }

  String currencyFormat(int price) {
    var format = NumberFormat('###,###,### 원');
    return format.format(price);
  }

  void launchURL(Uri query) async {
    if (!await launchUrl(query)) throw 'Could not launch $query';
  }
}
