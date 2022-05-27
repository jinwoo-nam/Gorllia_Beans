import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../ui/color.dart';

class CartInfoList extends StatefulWidget {
  final CartInfo cartInfo;
  final int index;
  final Function(int index, CartInfo cart) onChanged;
  final Function(int index) onDelete;

  const CartInfoList({
    Key? key,
    required this.cartInfo,
    required this.index,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<CartInfoList> createState() => _CartInfoListState();
}

class _CartInfoListState extends State<CartInfoList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final type =
        (widget.cartInfo.beanType == BeanType.Whole) ? '원두상태(홀빈)' : '분쇄(드립용)';

    final int dcPrice = (widget.cartInfo.productInfo.price *
            ((100 - widget.cartInfo.productInfo.dcRate) / 100))
        .ceil();

    double imageHeight = 90;
    double fontSize1 = 15;
    double fontSize2 = 14;
    double titleWidth = 250;
    double iconSize = 23;
    if (Responsive.isPage1(context)) {
      imageHeight = 90;
      fontSize1 = 15;
      fontSize2 = 14;
      titleWidth = 250;
      iconSize = 23;
    } else if (Responsive.isPage2(context)) {
      imageHeight = 120;
      fontSize1 = 17;
      fontSize2 = 16;
      titleWidth = 300;
      iconSize = 27;
    } else if (Responsive.isPage3(context)) {
      imageHeight = 150;
      fontSize1 = 20;
      fontSize2 = 18;
      titleWidth = 350;
      iconSize = 32;
    } else if (Responsive.isPage4or5(context)) {
      imageHeight = 200;
      fontSize1 = 20;
      fontSize2 = 18;
      titleWidth = 450;
      iconSize = 32;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  widget.onDelete(widget.index);
                },
                child: FaIcon(
                  FontAwesomeIcons.circleMinus,
                  color: selectColor,
                  size: iconSize,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image(
                image: AssetImage(widget.cartInfo.productInfo.imageUrl),
                height: imageHeight,
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: titleWidth,
                    child: Text(
                      widget.cartInfo.productInfo.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          currencyFormat(widget.cartInfo.productInfo.price),
                          style: GoogleFonts.notoSans(
                            fontSize: fontSize2,
                            decoration: TextDecoration.lineThrough,
                            color: fontColorGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          currencyFormat(dcPrice),
                          style: GoogleFonts.notoSans(
                            fontSize: fontSize2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!widget.cartInfo.productInfo.isBean)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: 160,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownSearch(
                          items: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                          selectedItem: widget.cartInfo.count,
                          menuHeight: (27.0 * 5) + (21 * (5 - 1)) + 20,
                          onChanged: (val) {
                            widget.onChanged(
                              widget.index,
                              CartInfo(
                                productInfo: widget.cartInfo.productInfo,
                                count: val as int,
                              ),
                            );
                          },
                          dropdownSearchTextAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  if (widget.cartInfo.productInfo.isBean)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            width: 160,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownSearch(
                              items: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                              menuHeight: (27.0 * 5) + (21 * (5 - 1)) + 20,
                              selectedItem: widget.cartInfo.count,
                              onChanged: (val) {
                                widget.onChanged(
                                  widget.index,
                                  CartInfo(
                                    productInfo: widget.cartInfo.productInfo,
                                    count: val as int,
                                  ),
                                );
                              },
                              dropdownSearchTextAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            width: 160,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownSearch(
                              items: const ['원두상태(홀빈)', '분쇄(드립용)'],
                              menuHeight: (27.0 * 2) + (21 * (2 - 1)) + 20,
                              selectedItem: type,
                              onChanged: (val) {
                                BeanType beanType = (val == '원두상태(홀빈)')
                                    ? BeanType.Whole
                                    : BeanType.Drip;
                                widget.onChanged(
                                  widget.index,
                                  CartInfo(
                                    productInfo: widget.cartInfo.productInfo,
                                    count: widget.cartInfo.count,
                                    beanType: beanType,
                                  ),
                                );
                              },
                              dropdownSearchTextAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }

  String currencyFormat(int price) {
    var format = NumberFormat('###,###,### 원');
    return format.format(price);
  }
}
