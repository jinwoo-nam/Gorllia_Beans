import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/home/overlay/loader.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
  List<String> items = ['1', '2', '3', '5', '10'];
  var selectDropDownValue = '1';

  @override
  Widget build(BuildContext context) {
    final int dcPrice =
        (widget.info.price * ((100 - widget.info.dcRate) / 100)) as int;
    final shippingFee = widget.info.shippingFee;
    final totalPrice = dcPrice + shippingFee;

    return Container(
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
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: const Icon(Icons.close_outlined),
                                onPressed: () {
                                  Loader.appLoader.hideLoader();
                                },
                              ),
                            ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '정가',
                                              style: GoogleFonts.notoSans(
                                                fontSize: 15,
                                                color: priceGrey,
                                              ),
                                            ),
                                            Text(
                                              currencyFormat(widget.info.price),
                                              style: GoogleFonts.notoSans(
                                                fontSize: 15,
                                                color: secondaryGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 15,
                                                    color: secondaryGrey,
                                                  ),
                                                ),
                                                Text(
                                                  '(${widget.info.dcRate}% 할인)',
                                                  style: GoogleFonts.notoSans(
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                      DropdownButton(
                                        isExpanded: true,
                                        value: selectDropDownValue,
                                        items: items.map(
                                          (value) {
                                            return DropdownMenuItem(
                                                child: SizedBox(
                                                  width: 300,
                                                  child: Text(
                                                    value,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                value: value);
                                          },
                                        ).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectDropDownValue = value as String;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Image(
                                  image: AssetImage(widget.info.qrImage_1),
                                  fit: BoxFit.cover,
                                  width: 180,
                                  height: 180,
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
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(
                                color: priceGrey,
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
                                ...widget.info.categories.map((e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Text(e),
                                    )),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(
                                color: priceGrey,
                              ),
                            ),
                          ],
                        ),
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

  String currencyFormat(int price) {
    var format = NumberFormat('###,###,### 원');
    return format.format(price);
  }
}
