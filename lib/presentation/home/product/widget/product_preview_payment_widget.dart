import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/cart/cart_view_model.dart';
import 'package:beans_instapay/presentation/home/overlay/loader.dart';
import 'package:beans_instapay/presentation/home/overlay/loader_detail.dart';
import 'package:beans_instapay/presentation/home/product/product_event.dart';
import 'package:beans_instapay/presentation/home/product/product_view_model.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/constant.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../ui/color.dart';

class ProductPreviewPaymentWidget extends StatefulWidget {
  final ProductInfo info;

  const ProductPreviewPaymentWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  State<ProductPreviewPaymentWidget> createState() =>
      _ProductPreviewPaymentWidgetState();
}

class _ProductPreviewPaymentWidgetState
    extends State<ProductPreviewPaymentWidget> {
  bool isAddCart = false;
  bool isUpperText = false;
  late FToast fToast;

  late Widget toast, toastWarn;

  _removeToast() {
    fToast.removeCustomToast();
  }

  _showToast(bool countOverflow) {
    _removeToast();

    fToast.showToast(
      child: countOverflow ? toastWarn : toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
    );
  }

  bool isBeans = false;

  @override
  void initState() {
    fToast = FToast();
    fToast.init(globalKey.currentState!.context);

    toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: selectColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check),
          const SizedBox(
            width: 12.0,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '장바구니에 상품이 추가되었습니다. +1',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        _removeToast();
                        Loader.appLoader.hideLoader();
                        LoaderDetail.appLoader.hideLoader();
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Text(
                        '장바구니로 이동 ',
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.circleArrowRight,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    toastWarn = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: selectColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning_amber_outlined),
          const SizedBox(
            width: 12.0,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '상품을 10개 이상 담을 수 없습니다.',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        _removeToast();
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Text(
                        '장바구니로 이동 ',
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.circleArrowRight,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    isBeans = (widget.info.categories[0] == 'BEANS');

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = (context).watch<ProductViewModel>();
    final state = viewModel.state;
    final cartViewModel = (context).watch<CartViewModel>();

    double dcRate = widget.info.dcRate;
    if (isBeans && state.selectedProductCount != 1) {
      dcRate = 30.0;
    }

    final int dcPrice = (widget.info.price * ((100 - dcRate) / 100)).ceil();
    final shippingFee = (dcPrice * state.selectedProductCount < 20000)
        ? widget.info.shippingFee
        : 0;
    final totalPrice = (dcPrice * state.selectedProductCount) + shippingFee;
    final String beansType = state.selectedProductType;
    final double width = (Responsive.isPage1(context)) ? 400 : 600;
    final double height = (Responsive.isPage1(context)) ? 600 : 700;

    final double fontSize1 = (Responsive.isPage1(context)) ? 15 : 17;
    final double fontSize2 = (Responsive.isPage1(context)) ? 16 : 21;

    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            width: width,
            height: height,
            child: SingleChildScrollView(
              //physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: selectColor,
                              child: InkWell(
                                child: const Icon(
                                  Icons.close_outlined,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                onTap: () {
                                  _removeToast();
                                  Loader.appLoader.hideLoader();
                                  LoaderDetail.appLoader.hideLoader();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 55.0,
                              bottom: 32,
                              right: 32,
                              left: 32,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.info.name,
                                    style: GoogleFonts.notoSans(
                                      fontSize: 21,
                                      height: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Responsive.isPage1(context)
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '결제 금액',
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: fontSize1,
                                                      color: const Color(
                                                          0xffaaaaaa),
                                                    ),
                                                  ),
                                                  Text(
                                                    currencyFormat(totalPrice),
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: fontSize2,
                                                      color: const Color(
                                                          0xff666666),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Divider(
                                                color: priceGrey,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '정가',
                                                      style:
                                                          GoogleFonts.notoSans(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xffaaaaaa),
                                                      ),
                                                    ),
                                                    Text(
                                                      currencyFormat(
                                                          widget.info.price),
                                                      style:
                                                          GoogleFonts.notoSans(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff666666),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '할인가',
                                                      style:
                                                          GoogleFonts.notoSans(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xffaaaaaa),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          currencyFormat(
                                                              dcPrice),
                                                          style: GoogleFonts
                                                              .notoSans(
                                                            fontSize: 15,
                                                            color: const Color(
                                                                0xff666666),
                                                          ),
                                                        ),
                                                        Text(
                                                          '($dcRate% 할인)',
                                                          style: GoogleFonts
                                                              .notoSans(
                                                            fontSize: 13,
                                                            color: const Color(
                                                                0xff666666),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '배송비',
                                                      style:
                                                          GoogleFonts.notoSans(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xffaaaaaa),
                                                      ),
                                                    ),
                                                    Text(
                                                      currencyFormat(
                                                          shippingFee),
                                                      style:
                                                          GoogleFonts.notoSans(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff666666),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Padding(
                                              //   padding: const EdgeInsets.symmetric(
                                              //       vertical: 8.0),
                                              //   child: DropdownSearch(
                                              //     items: const [
                                              //       1,
                                              //       2,
                                              //       3,
                                              //       4,
                                              //       5,
                                              //       6,
                                              //       7,
                                              //       8,
                                              //       9,
                                              //       10
                                              //     ],
                                              //     menuHeight: (27.0 * 5) +
                                              //         (21 * (5 - 1)) +
                                              //         20,
                                              //     selectedItem: 1,
                                              //     onChanged: (val) {
                                              //       viewModel.onEvent(ProductEvent
                                              //           .selectProductCount(
                                              //               val as int));
                                              //     },
                                              //     dropdownSearchTextAlign:
                                              //         TextAlign.center,
                                              //   ),
                                              // ),
                                              if (isBeans)
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: DropdownSearch(
                                                    items: const [
                                                      '원두(홀빈)',
                                                      '분쇄(드립용)'
                                                    ],
                                                    menuHeight: (27.0 * 2) +
                                                        (21 * (2 - 1)) +
                                                        20,
                                                    selectedItem: '원두(홀빈)',
                                                    onChanged: (val) {
                                                      viewModel.onEvent(ProductEvent
                                                          .selectProductValue(
                                                              val as String));
                                                    },
                                                    dropdownSearchTextAlign:
                                                        TextAlign.center,
                                                  ),
                                                )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Column(
                                            children: [
                                              Column(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8.0),
                                                    child: Text(
                                                      '인스타페이 앱으로 QR코드를 찍어서 결제해 주세요',
                                                    ),
                                                  ),
                                                  getQrImage(
                                                      state
                                                          .selectedProductCount,
                                                      beansType),
                                                ],
                                              ),
                                              Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: Theme(
                                                      data: ThemeData(
                                                        splashColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                      ),
                                                      child: OnHoverDetect(
                                                        builder: (isHovered) {
                                                          final color =
                                                              (isHovered)
                                                                  ? Colors.black
                                                                  : selectColor;
                                                          bool countOverflow;
                                                          return ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                isAddCart =
                                                                    true;
                                                                //isUpperText = true;
                                                              });
                                                              if (!isBeans) {
                                                                countOverflow = await cartViewModel.addCart(CartInfo(
                                                                    productInfo:
                                                                        widget
                                                                            .info,
                                                                    count: state
                                                                        .selectedProductCount));
                                                              } else {
                                                                final type = (state.selectedProductType ==
                                                                        '원두(홀빈)')
                                                                    ? BeanType
                                                                        .Whole
                                                                    : BeanType
                                                                        .Drip;
                                                                countOverflow =
                                                                    await cartViewModel
                                                                        .addCart(
                                                                  CartInfo(
                                                                    productInfo:
                                                                        widget
                                                                            .info,
                                                                    count: state
                                                                        .selectedProductCount,
                                                                    beanType:
                                                                        type,
                                                                  ),
                                                                );
                                                              }
                                                              _showToast(
                                                                  countOverflow);
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0,
                                                                  vertical:
                                                                      15.0),
                                                              backgroundColor:
                                                                  color,
                                                              splashFactory:
                                                                  NoSplash
                                                                      .splashFactory,
                                                              elevation: 0,
                                                              shape:
                                                                  const RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .zero,
                                                              ),
                                                            ),
                                                            child: Text(
                                                              '장바구니 담기',
                                                              style: GoogleFonts
                                                                  .notoSans(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  // Positioned(
                                                  //   right: -30,
                                                  //   top: -10,
                                                  //   child: DefaultTextStyle(
                                                  //     style: const TextStyle(
                                                  //       fontSize: 40.0,
                                                  //     ),
                                                  //     child: AnimatedTextKit(
                                                  //       totalRepeatCount: 1,
                                                  //       animatedTexts: [
                                                  //         ScaleAnimatedText('+1'),
                                                  //       ],
                                                  //     ),
                                                  //   ),
                                                  // ),

                                                  AnimatedPositioned(
                                                    duration: const Duration(
                                                      milliseconds: 300,
                                                    ),
                                                    onEnd: () {
                                                      setState(() {
                                                        isAddCart = false;
                                                        //isUpperText = false;
                                                      });
                                                    },
                                                    top: isAddCart ? -50 : -10,
                                                    right: -20,
                                                    child: AnimatedOpacity(
                                                      opacity:
                                                          isAddCart ? 1 : 0,
                                                      duration: const Duration(
                                                          milliseconds: 100),
                                                      child: const Text(
                                                        '+1',
                                                        style: TextStyle(
                                                            backgroundColor:
                                                                Colors.amber,
                                                            fontSize: 30,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '결제 금액',
                                                      style:
                                                          GoogleFonts.notoSans(
                                                        fontSize: fontSize1,
                                                        color: const Color(
                                                            0xffaaaaaa),
                                                      ),
                                                    ),
                                                    Text(
                                                      currencyFormat(
                                                          totalPrice),
                                                      style:
                                                          GoogleFonts.notoSans(
                                                        fontSize: fontSize2,
                                                        color: const Color(
                                                            0xff666666),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                  color: priceGrey,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '정가',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 15,
                                                          color: const Color(
                                                              0xffaaaaaa),
                                                        ),
                                                      ),
                                                      Text(
                                                        currencyFormat(
                                                            widget.info.price),
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 15,
                                                          color: const Color(
                                                              0xff666666),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '할인가',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 15,
                                                          color: const Color(
                                                              0xffaaaaaa),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            currencyFormat(
                                                                dcPrice),
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              fontSize: 15,
                                                              color: const Color(
                                                                  0xff666666),
                                                            ),
                                                          ),
                                                          Text(
                                                            '($dcRate% 할인)',
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              fontSize: 13,
                                                              color: const Color(
                                                                  0xff666666),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '배송비',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 15,
                                                          color: const Color(
                                                              0xffaaaaaa),
                                                        ),
                                                      ),
                                                      Text(
                                                        currencyFormat(
                                                            shippingFee),
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 15,
                                                          color: const Color(
                                                              0xff666666),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding: const EdgeInsets.symmetric(
                                                //       vertical: 8.0),
                                                //   child: DropdownSearch(
                                                //     items: const [
                                                //       1,
                                                //       2,
                                                //       3,
                                                //       4,
                                                //       5,
                                                //       6,
                                                //       7,
                                                //       8,
                                                //       9,
                                                //       10
                                                //     ],
                                                //     menuHeight: (27.0 * 5) +
                                                //         (21 * (5 - 1)) +
                                                //         20,
                                                //     selectedItem: 1,
                                                //     onChanged: (val) {
                                                //       viewModel.onEvent(ProductEvent
                                                //           .selectProductCount(
                                                //               val as int));
                                                //     },
                                                //     dropdownSearchTextAlign:
                                                //         TextAlign.center,
                                                //   ),
                                                // ),
                                                if (isBeans)
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: DropdownSearch(
                                                      items: const [
                                                        '원두(홀빈)',
                                                        '분쇄(드립용)'
                                                      ],
                                                      menuHeight: (27.0 * 2) +
                                                          (21 * (2 - 1)) +
                                                          20,
                                                      selectedItem: '원두(홀빈)',
                                                      onChanged: (val) {
                                                        viewModel.onEvent(ProductEvent
                                                            .selectProductValue(
                                                                val as String));
                                                      },
                                                      dropdownSearchTextAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            children: [
                                              Column(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8.0),
                                                    child: Text(
                                                      '인스타페이 앱으로 QR코드를 찍어서 결제해 주세요',
                                                    ),
                                                  ),
                                                  getQrImage(
                                                      state
                                                          .selectedProductCount,
                                                      beansType),
                                                ],
                                              ),
                                              Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: Theme(
                                                      data: ThemeData(
                                                        splashColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                      ),
                                                      child: OnHoverDetect(
                                                        builder: (isHovered) {
                                                          final color =
                                                              (isHovered)
                                                                  ? Colors.black
                                                                  : selectColor;
                                                          bool countOverflow;
                                                          return ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                isAddCart =
                                                                    true;
                                                                //isUpperText = true;
                                                              });
                                                              if (!isBeans) {
                                                                countOverflow = await cartViewModel.addCart(CartInfo(
                                                                    productInfo:
                                                                        widget
                                                                            .info,
                                                                    count: state
                                                                        .selectedProductCount));
                                                              } else {
                                                                final type = (state.selectedProductType ==
                                                                        '원두(홀빈)')
                                                                    ? BeanType
                                                                        .Whole
                                                                    : BeanType
                                                                        .Drip;
                                                                countOverflow =
                                                                    await cartViewModel
                                                                        .addCart(
                                                                  CartInfo(
                                                                    productInfo:
                                                                        widget
                                                                            .info,
                                                                    count: state
                                                                        .selectedProductCount,
                                                                    beanType:
                                                                        type,
                                                                  ),
                                                                );
                                                              }
                                                              _showToast(
                                                                  countOverflow);
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0,
                                                                  vertical:
                                                                      15.0),
                                                              backgroundColor:
                                                                  color,
                                                              splashFactory:
                                                                  NoSplash
                                                                      .splashFactory,
                                                              elevation: 0,
                                                              shape:
                                                                  const RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .zero,
                                                              ),
                                                            ),
                                                            child: Text(
                                                              '장바구니 담기',
                                                              style: GoogleFonts
                                                                  .notoSans(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  // Positioned(
                                                  //   right: -30,
                                                  //   top: -10,
                                                  //   child: DefaultTextStyle(
                                                  //     style: const TextStyle(
                                                  //       fontSize: 40.0,
                                                  //     ),
                                                  //     child: AnimatedTextKit(
                                                  //       totalRepeatCount: 1,
                                                  //       animatedTexts: [
                                                  //         ScaleAnimatedText('+1'),
                                                  //       ],
                                                  //     ),
                                                  //   ),
                                                  // ),

                                                  AnimatedPositioned(
                                                    duration: const Duration(
                                                      milliseconds: 300,
                                                    ),
                                                    onEnd: () {
                                                      setState(() {
                                                        isAddCart = false;
                                                        //isUpperText = false;
                                                      });
                                                    },
                                                    top: isAddCart ? -50 : -10,
                                                    right: -20,
                                                    child: AnimatedOpacity(
                                                      opacity:
                                                          isAddCart ? 1 : 0,
                                                      duration: const Duration(
                                                          milliseconds: 100),
                                                      child: const Text(
                                                        '+1',
                                                        style: TextStyle(
                                                            backgroundColor:
                                                                Colors.amber,
                                                            fontSize: 30,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.info.description,
                                      style: GoogleFonts.notoSans(),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Divider(
                                    color: Color(0xffe7e7e7),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.tags,
                                        color: secondaryGrey,
                                        size: 15,
                                      ),
                                    ),
                                    const Text(
                                      'CATEGORIES: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ...widget.info.categories
                                        .map((e) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              child: Text(e),
                                            )),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Divider(
                                    color: Color(0xffe7e7e7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getQrImage(int count, String beansType) {
    // final double width = (Responsive.isPage1(context)) ? 130 : 180;
    // final double height = (Responsive.isPage1(context)) ? 130 : 180;

    const double width = 180;
    const double height = 180;
    switch (count) {
      case 1:
        if (beansType == '분쇄(드립용)') {
          return Image(
            image: AssetImage(widget.info.dripQrImage_1!),
            fit: BoxFit.cover,
            width: width,
            height: height,
          );
        } else {
          return Image(
            image: AssetImage(widget.info.qrImage_1),
            fit: BoxFit.cover,
            width: width,
            height: height,
          );
        }
      case 2:
        if (beansType == '분쇄(드립용)') {
          return Image(
            image: AssetImage(widget.info.dripQrImage_2!),
            fit: BoxFit.cover,
            width: width,
            height: height,
          );
        } else {
          return Image(
            image: AssetImage(widget.info.qrImage_2),
            fit: BoxFit.cover,
            width: width,
            height: height,
          );
        }
      case 3:
        if (widget.info.qrImage_3 == '') {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: const Center(
                child: Text('QR'),
              ),
            ),
          );
        } else {
          return Image(
            image: AssetImage(widget.info.qrImage_3),
            fit: BoxFit.cover,
            width: width,
            height: height,
          );
        }

      case 5:
        if (widget.info.qrImage_5 == '') {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: const Center(
                child: Text('QR'),
              ),
            ),
          );
        } else {
          return Image(
            image: AssetImage(widget.info.qrImage_5),
            fit: BoxFit.cover,
            width: width,
            height: height,
          );
        }

      case 10:
        if (widget.info.qrImage_10 == '') {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: const Center(
                child: Text('QR'),
              ),
            ),
          );
        } else {
          return Image(
            image: AssetImage(widget.info.qrImage_10),
            fit: BoxFit.cover,
            width: width,
            height: height,
          );
        }

      default:
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: const Center(
              child: Text('QR'),
            ),
          ),
        );
    }
  }

  String currencyFormat(int price) {
    var format = NumberFormat('###,###,### 원');
    return format.format(price);
  }
}
