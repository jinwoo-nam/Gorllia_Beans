import 'dart:async';

import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/home/overlay/loader.dart';
import 'package:beans_instapay/presentation/home/overlay/loader_detail.dart';
import 'package:beans_instapay/presentation/home/product/product_view_model.dart';
import 'package:beans_instapay/presentation/home/product/widget/custom_drop_down.dart';
import 'package:flutter/material.dart';
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
              width: 600,
              height: 700,
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
                                                    fontSize: 17,
                                                    color: priceGrey,
                                                  ),
                                                ),
                                                Text(
                                                  currencyFormat(totalPrice),
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 21,
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
                                      getQrImage(state.selectedProductCount,
                                          beansType),
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
    switch (count) {
      case 1:
        if (beansType == '분쇄(드립용)') {
          return Image(
            image: AssetImage(widget.info.dripQrImage_1!),
            fit: BoxFit.cover,
            width: 180,
            height: 180,
          );
        } else {
          return Image(
            image: AssetImage(widget.info.qrImage_1),
            fit: BoxFit.cover,
            width: 180,
            height: 180,
          );
        }
      case 2:
        if (beansType == '분쇄(드립용)') {
          return Image(
            image: AssetImage(widget.info.dripQrImage_2!),
            fit: BoxFit.cover,
            width: 180,
            height: 180,
          );
        } else {
          return Image(
            image: AssetImage(widget.info.qrImage_2),
            fit: BoxFit.cover,
            width: 180,
            height: 180,
          );
        }
      case 3:
        return Image(
          image: AssetImage(widget.info.qrImage_3),
          fit: BoxFit.cover,
          width: 180,
          height: 180,
        );
      case 5:
        return Image(
          image: AssetImage(widget.info.qrImage_5),
          fit: BoxFit.cover,
          width: 180,
          height: 180,
        );
      case 10:
        return Image(
          image: AssetImage(widget.info.qrImage_10),
          fit: BoxFit.cover,
          width: 180,
          height: 180,
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
