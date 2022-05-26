import 'dart:async';

import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/cart/cart_view_model.dart';
import 'package:beans_instapay/presentation/home/overlay/loader.dart';
import 'package:beans_instapay/presentation/home/overlay/loader_detail.dart';
import 'package:beans_instapay/presentation/home/product/product_view_model.dart';
import 'package:beans_instapay/presentation/home/product/widget/custom_drop_down.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/constant.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
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
  late FToast fToast;

  late Widget toast;

  _removeToast() {
    fToast.removeCustomToast();
  }

  _showToast() {
    _removeToast();

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
    );
  }

  List<String> normalItemsCount = ['1', '2', '3', '5', '10'];
  List<String> beansItemsCount = ['1', '2'];
  List<String> beansType = ['원두 상태(홀빈)', '분쇄(드립용)'];
  var selectDropDownValue = '1';
  var selectBeansDropDownValue = '원두 상태(홀빈)';
  CustomDropDown? dropDown;
  CustomDropDown? beansDropDown;
  CustomDropDown? beansTypeDropDown;
  bool isBeans = false;
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    fToast = FToast();
    fToast.init(globalKey.currentState!.context);

    toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
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
                  '장바구니에 상품이 추가되었습니다.',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        _removeToast();
                        removeOverlay('');
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

    isBeans = (widget.info.categories[0] == 'BEANS');
    dropDown = CustomDropDown(
      initValue: selectDropDownValue,
      items: normalItemsCount,
      type: DropDownValueType.int,
      name: 'normal',
    );
    beansDropDown = CustomDropDown(
      initValue: selectDropDownValue,
      items: beansItemsCount,
      type: DropDownValueType.int,
      name: 'beans',
    );
    beansTypeDropDown = CustomDropDown(
      initValue: selectBeansDropDownValue,
      items: beansType,
      type: DropDownValueType.string,
      name: 'beans type',
    );
    Future.microtask(() {
      final viewModel = context.read<ProductViewModel>();
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(tapped: (type) {
          removeOverlay(type);
        });
      });
    });
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

    return GestureDetector(
      onTap: () {
        removeOverlay('');
      },
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: width,
              height: height,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
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
                                    removeOverlay('');
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
                                  Row(
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
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: fontSize1,
                                                    color: priceGrey,
                                                  ),
                                                ),
                                                Text(
                                                  currencyFormat(totalPrice),
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: fontSize2,
                                                    color: secondaryGrey,
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
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 15,
                                                      color: priceGrey,
                                                    ),
                                                  ),
                                                  Text(
                                                    currencyFormat(
                                                        widget.info.price),
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 15,
                                                      color: secondaryGrey,
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
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 15,
                                                      color: priceGrey,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        currencyFormat(dcPrice),
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 15,
                                                          color: secondaryGrey,
                                                        ),
                                                      ),
                                                      Text(
                                                        '($dcRate% 할인)',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 13,
                                                          color: secondaryGrey,
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
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 15,
                                                      color: priceGrey,
                                                    ),
                                                  ),
                                                  Text(
                                                    currencyFormat(shippingFee),
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 15,
                                                      color: secondaryGrey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            (isBeans)
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: beansDropDown!,
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: dropDown!,
                                                  ),
                                            if (isBeans)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: beansTypeDropDown!,
                                              )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        children: [
                                          getQrImage(state.selectedProductCount,
                                              beansType),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Theme(
                                              data: ThemeData(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                              ),
                                              child: OnHoverDetect(
                                                builder: (isHovered) {
                                                  final color = (isHovered)
                                                      ? Colors.black
                                                      : selectColor;
                                                  return ElevatedButton(
                                                    onPressed: () {
                                                      if (!isBeans) {
                                                        cartViewModel.addCart(
                                                            CartInfo(
                                                                productInfo:
                                                                    widget.info,
                                                                count: state
                                                                    .selectedProductCount));
                                                      } else {
                                                        final type =
                                                            (state.selectedProductType ==
                                                                    '원두 상태(홀빈)')
                                                                ? BeanType.Whole
                                                                : BeanType.Drip;
                                                        cartViewModel.addCart(
                                                          CartInfo(
                                                            productInfo:
                                                                widget.info,
                                                            count: state
                                                                .selectedProductCount,
                                                            beanType: type,
                                                          ),
                                                        );
                                                      }
                                                      _showToast();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10.0,
                                                          vertical: 15.0),
                                                      primary: color,
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      elevation: 0,
                                                    ),
                                                    child: Text(
                                                      '장바구니 담기',
                                                      style:
                                                          GoogleFonts.notoSans(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
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
                                      Text(widget.info.description),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Divider(
                                      color: priceGrey,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Divider(
                                      color: priceGrey,
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
      ),
    );
  }

  void removeOverlay(String type) {
    switch (type) {
      case '':
        if (dropDown?.removeOverlay != null) {
          dropDown?.removeOverlay!();
        }
        if (beansDropDown?.removeOverlay != null) {
          beansDropDown?.removeOverlay!();
        }
        if (beansTypeDropDown?.removeOverlay != null) {
          beansTypeDropDown?.removeOverlay!();
        }
        break;
      case 'normal':
        if (beansDropDown?.removeOverlay != null) {
          beansDropDown?.removeOverlay!();
        }
        if (beansTypeDropDown?.removeOverlay != null) {
          beansTypeDropDown?.removeOverlay!();
        }
        break;
      case 'beans':
        if (dropDown?.removeOverlay != null) {
          dropDown?.removeOverlay!();
        }
        if (beansTypeDropDown?.removeOverlay != null) {
          beansTypeDropDown?.removeOverlay!();
        }
        break;
      case 'beans type':
        if (dropDown?.removeOverlay != null) {
          dropDown?.removeOverlay!();
        }
        if (beansDropDown?.removeOverlay != null) {
          beansDropDown?.removeOverlay!();
        }
        break;
    }
  }

  Widget getQrImage(int count, String beansType) {
    final double width = (Responsive.isPage1(context)) ? 130 : 180;
    final double height = (Responsive.isPage1(context)) ? 130 : 180;

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
        return Image(
          image: AssetImage(widget.info.qrImage_3),
          fit: BoxFit.cover,
          width: width,
          height: height,
        );
      case 5:
        return Image(
          image: AssetImage(widget.info.qrImage_5),
          fit: BoxFit.cover,
          width: width,
          height: height,
        );
      case 10:
        return Image(
          image: AssetImage(widget.info.qrImage_10),
          fit: BoxFit.cover,
          width: width,
          height: height,
        );
      default:
        return const Text('Image가 없습니다.');
    }
  }

  String currencyFormat(int price) {
    var format = NumberFormat('###,###,### 원');
    return format.format(price);
  }
}
