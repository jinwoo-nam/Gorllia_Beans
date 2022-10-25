import 'package:beans_instapay/presentation/cart/cart_view_model.dart';
import 'package:beans_instapay/presentation/cart/widget/cart_info_list.dart';
import 'package:beans_instapay/presentation/components/app_bar_widget.dart';
import 'package:beans_instapay/presentation/components/drawer_widget.dart';
import 'package:beans_instapay/presentation/home/contact/contact_page.dart';
import 'package:beans_instapay/presentation/home/footer/footer_page.dart';
import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:beans_instapay/util/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../responsive/responsive.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../../ui/color.dart';

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
  final mainController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();
    final viewModel = context.watch<CartViewModel>();
    final state = viewModel.state;
    final itemCount = state.cartInfo.length;
    double mainWidth = 500;
    double summaryPadding = 50;
    double fontSize = 18;
    int index = -1;

    int sumOfProduct = viewModel.getSumOfProduct();
    int shipmentFee = sumOfProduct < 20000 ? 2000 : 0;
    int totalPrice = sumOfProduct + shipmentFee;

    if (Responsive.isPage1(context)) {
      bodyPadding = 32;
      mainWidth = 500;
      fontSize = 18;
      summaryPadding = 50;
    } else if (Responsive.isPage2(context) || Responsive.isPage3(context)) {
      bodyPadding = 32;
      mainWidth = 650;
      fontSize = 20;
      summaryPadding = 60;
    } else if (Responsive.isPage4(context)) {
      bodyPadding = 50;
      mainWidth = 750;
      fontSize = 22;
      summaryPadding = 65;
    } else if (Responsive.isPage5(context)) {
      bodyPadding = 200 * ((MediaQuery.of(context).size.width - 1200) / 720);
      mainWidth = 850;
      fontSize = 24;
      summaryPadding = 65;
    }

    double appBarHeight = 70;
    double widthTemp = (MediaQuery.of(context).size.width > 1200)
        ? 150 * ((MediaQuery.of(context).size.width - 1200) / 720)
        : 0;
    double categoryWidth = 150 + widthTemp;

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
          child: AppBarWidget(
            itemCount: itemCount,
            changeHoverState: changeHoverState,
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: mainController,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: SizedBox(
                        width: mainWidth,
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
                                physics: const NeverScrollableScrollPhysics(),
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
                                    padding: EdgeInsets.only(
                                      top: 25.0,
                                      bottom: 25,
                                      left: summaryPadding,
                                      right: 15,
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
                                                color: const Color(0xffaaaaaa),
                                                fontSize: fontSize,
                                              ),
                                            ),
                                            Text(
                                              currencyFormat(sumOfProduct),
                                              style: GoogleFonts.notoSans(
                                                color: const Color(0xff666666),
                                                fontSize: fontSize,
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
                                                color: const Color(0xffaaaaaa),
                                                fontSize: fontSize,
                                              ),
                                            ),
                                            Text(
                                              currencyFormat(shipmentFee),
                                              style: GoogleFonts.notoSans(
                                                color: const Color(0xff666666),
                                                fontSize: fontSize,
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
                                                color: const Color(0xffaaaaaa),
                                                fontSize: fontSize,
                                              ),
                                            ),
                                            Text(
                                              currencyFormat(totalPrice),
                                              style: GoogleFonts.notoSans(
                                                color: const Color(0xff666666),
                                                fontSize: fontSize,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (kIsWeb)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Column(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                                  child: Text(
                                                    '인스타페이 앱으로 QR코드를 찍어서 결제해 주세요',
                                                  ),
                                                ),
                                                if (state.qrAddress.isNotEmpty)
                                                  InkWell(
                                                    onTap: () {
                                                      launchURL(
                                                          state.qrAddress);
                                                    },
                                                    child: Image.network(
                                                      state.qrCode,
                                                      width: 180,
                                                      height: 180,
                                                    ),
                                                  ),
                                                // Container(
                                                //   width: 120,
                                                //   height: 120,
                                                //   decoration: BoxDecoration(
                                                //     border: Border.all(),
                                                //   ),
                                                //   child: const Center(
                                                //     child: Text('QR'),
                                                //   ),
                                                // ),
                                                // Padding(
                                                //   padding: const EdgeInsets
                                                //           .symmetric(
                                                //       vertical: 16.0),
                                                //   child: OnHoverDetect(
                                                //     builder: (isHovered) {
                                                //       final color = isHovered
                                                //           ? Colors.black
                                                //           : selectColor;
                                                //       return InkWell(
                                                //         onTap: () async {
                                                //           final result = await viewModel
                                                //               .saveCartInfoToFireStore(
                                                //                   state
                                                //                       .cartInfo);
                                                //
                                                //           showDialog<String>(
                                                //             context: context,
                                                //             builder: (BuildContext
                                                //                     context) =>
                                                //                 AlertDialog(
                                                //               title: const Text(
                                                //                   '저장 완료'),
                                                //               content:
                                                //                   const Text(
                                                //                       '서버에 저장되었습니다.'),
                                                //               actions: <Widget>[
                                                //                 TextButton(
                                                //                   onPressed: () =>
                                                //                       Navigator.pop(
                                                //                           context,
                                                //                           'OK'),
                                                //                   child:
                                                //                       const Text(
                                                //                           'OK'),
                                                //                 ),
                                                //               ],
                                                //             ),
                                                //           );
                                                //         },
                                                //         child: Container(
                                                //           width: 150,
                                                //           padding:
                                                //               const EdgeInsets
                                                //                   .all(16),
                                                //           color: color,
                                                //           child: Center(
                                                //             child: Text(
                                                //               '결제',
                                                //               style: GoogleFonts
                                                //                   .notoSans(
                                                //                 color: Colors
                                                //                     .white,
                                                //                 fontSize: 15,
                                                //               ),
                                                //             ),
                                                //           ),
                                                //         ),
                                                //       );
                                                //     },
                                                //   ),
                                                // ),
                                              ],
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
                      maxHeight:
                          homeViewModel.getCalcContactPageHeight(context),
                      minHeight:
                          homeViewModel.getCalcContactPageHeight(context),
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
            if (hoverState)
              Positioned(
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
                                  final color =
                                      (isHovered) ? selectColor : Colors.black;
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
                                Navigator.pushNamed(context, '/detail/dripbag');
                              },
                              child: OnHoverDetect(
                                builder: (isHovered) {
                                  final color =
                                      (isHovered) ? selectColor : Colors.black;
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
                                  final color =
                                      (isHovered) ? selectColor : Colors.black;
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

  String currencyFormat(int price) {
    var format = NumberFormat('###,###,### 원');
    return format.format(price);
  }
}
