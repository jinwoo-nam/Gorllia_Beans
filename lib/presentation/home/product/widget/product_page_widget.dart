import 'package:beans_instapay/domain/model/product_page_info.dart';
import 'package:beans_instapay/presentation/home/product/detail/product_detail_page.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_list_widget.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ProductPageWidget extends StatefulWidget {
  final ProductPageInfo pageInfo;
  final ScrollController scrollController;

  const ProductPageWidget({
    Key? key,
    required this.pageInfo,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isPage1(context) ||
                Responsive.isPage2(context) ||
                Responsive.isPage3(context))
              getTitleSubtitle(context),
            if (Responsive.isPage1(context) ||
                Responsive.isPage2(context) ||
                Responsive.isPage3(context))
              getImageComment(context),
            if (Responsive.isPage4(context) || Responsive.isPage5(context))
              getImageComment(context),
            const SizedBox(
              height: 50,
            ),
            if (Responsive.isPage1(context) ||
                Responsive.isPage2(context) ||
                Responsive.isPage3(context))
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      controller: widget.scrollController,
                      scrollDirection: Axis.horizontal,
                      children: widget.pageInfo.productInfo
                          .map(
                            (e) => ProductListWidget(productInfo: e),
                          )
                          .toList(),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: InkWell(
                          onTap: () {
                            double offset =
                                widget.scrollController.offset + 200;
                            if (offset >
                                widget.scrollController.position
                                    .maxScrollExtent) {
                              offset = widget
                                  .scrollController.position.maxScrollExtent;
                            }

                            widget.scrollController.animateTo(
                              offset,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          },
                          child: OnHoverDetect(builder: (isHovered) {
                            final color =
                                (isHovered) ? selectColor : Colors.white;

                            return Container(
                              width: 40,
                              height: 70,
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.8),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                ),
                              ),
                              child: const Icon(Icons.arrow_right),
                            );
                          }),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: InkWell(
                          onTap: () {
                            double offset =
                                widget.scrollController.offset - 200;
                            if (offset < 0) {
                              offset = 0;
                            }
                            widget.scrollController.animateTo(
                              offset,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          },
                          child: OnHoverDetect(builder: (isHovered) {
                            final color =
                                (isHovered) ? selectColor : Colors.white;

                            return Container(
                              width: 40,
                              height: 70,
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.8),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomRight: Radius.circular(100),
                                ),
                              ),
                              child: const Icon(Icons.arrow_left),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget getTitleSubtitle(BuildContext context) {
    if (Responsive.isPage1(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.pageInfo.title,
            style: GoogleFonts.notoSans(
              fontSize: 25,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.pageInfo.subtitle,
            style: GoogleFonts.notoSans(
              fontSize: 30,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                width: 80,
                height: 3,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    } else if (Responsive.isPage2(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.pageInfo.title,
            style: GoogleFonts.notoSans(
              fontSize: 25,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.pageInfo.subtitle,
            style: GoogleFonts.notoSans(
              fontSize: 30,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                width: 80,
                height: 3,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    } else if (Responsive.isPage3(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.pageInfo.title,
            style: GoogleFonts.notoSans(
              fontSize: 25,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.pageInfo.subtitle,
            style: GoogleFonts.notoSans(
              fontSize: 30,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                width: 80,
                height: 3,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    } else if (Responsive.isPage4(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.pageInfo.title,
            style: GoogleFonts.notoSans(
              fontSize: 45,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.pageInfo.subtitle,
            style: GoogleFonts.notoSans(
              fontSize: 30,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                width: 80,
                height: 3,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.pageInfo.title,
            style: GoogleFonts.notoSans(
              fontSize: 65,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.pageInfo.subtitle,
            style: GoogleFonts.notoSans(
              fontSize: 40,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                width: 80,
                height: 3,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget getImageComment(BuildContext context) {
    if (Responsive.isPage1(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Image(
              image: AssetImage(widget.pageInfo.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 5,
            ),
            child: Text(
              widget.pageInfo.comment,
              style: GoogleFonts.notoSans(
                color: secondaryGrey.withOpacity(0.7),
                fontSize: 22,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailPage(),
                ),
              );
            },
            child: OnHoverDetect(
              builder: (isHovered) {
                final color = (isHovered) ? selectColor : Colors.black;

                return Container(
                  padding: const EdgeInsets.only(bottom: 1),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: color,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    'SEE COLLECTION',
                    style: GoogleFonts.notoSans(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else if (Responsive.isPage2(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Image(
              image: AssetImage(widget.pageInfo.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 5,
                ),
                child: Text(
                  widget.pageInfo.comment,
                  style: GoogleFonts.notoSans(
                    color: secondaryGrey.withOpacity(0.7),
                    fontSize: 22,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailPage(),
                    ),
                  );
                },
                child: OnHoverDetect(
                  builder: (isHovered) {
                    final color = (isHovered) ? selectColor : Colors.black;

                    return Container(
                      padding: const EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: color,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'SEE COLLECTION',
                        style: GoogleFonts.notoSans(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      );
    } else if (Responsive.isPage3(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(widget.pageInfo.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        widget.pageInfo.comment,
                        style: GoogleFonts.notoSans(
                          color: secondaryGrey.withOpacity(0.7),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Transform.rotate(
                  angle: math.pi / 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDetailPage(),
                        ),
                      );
                    },
                    child: OnHoverDetect(builder: (isHovered) {
                      final color = (isHovered) ? selectColor : Colors.black;

                      return Container(
                        padding: const EdgeInsets.only(bottom: 1),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: color, width: 2),
                          ),
                        ),
                        child: Text(
                          'SEE COLLECTION',
                          style: GoogleFonts.notoSans(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
    } else if (Responsive.isPage4(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 80.0,
                      left: 100,
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(widget.pageInfo.imageUrl),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            widget.pageInfo.comment,
                            style: GoogleFonts.notoSans(
                              color: secondaryGrey.withOpacity(0.7),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  getTitleSubtitle(context),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 3,
                    top: 150,
                    child: Transform.rotate(
                      angle: math.pi / 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailPage(),
                            ),
                          );
                        },
                        child: OnHoverDetect(
                          builder: (isHovered) {
                            final color =
                                (isHovered) ? selectColor : Colors.black;

                            return Container(
                              padding: const EdgeInsets.only(bottom: 1),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: color,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Text(
                                'SEE COLLECTION',
                                style: GoogleFonts.notoSans(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 500,
                child: Stack(
                  children: [
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: widget.pageInfo.productInfo
                          .map(
                            (e) => ProductListWidget(productInfo: e),
                          )
                          .toList(),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: Container(
                          width: 40,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                            ),
                          ),
                          child: const Icon(Icons.arrow_right),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: Container(
                          width: 40,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                          child: const Icon(Icons.arrow_left),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const SizedBox(
                    width: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 80.0,
                      left: 100,
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(widget.pageInfo.imageUrl),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            widget.pageInfo.comment,
                            style: GoogleFonts.notoSans(
                              color: secondaryGrey.withOpacity(0.7),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  getTitleSubtitle(context),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 3,
                    top: 150,
                    child: Transform.rotate(
                      angle: math.pi / 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailPage(),
                            ),
                          );
                        },
                        child: OnHoverDetect(
                          builder: (isHovered) {
                            final color =
                                (isHovered) ? selectColor : Colors.black;

                            return Container(
                              padding: const EdgeInsets.only(bottom: 1),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: color,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Text(
                                'SEE COLLECTION',
                                style: GoogleFonts.notoSans(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 + 160,
                height: MediaQuery.of(context).size.width / 3 + 50,
                child: Stack(
                  children: [
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: widget.pageInfo.productInfo
                          .map(
                            (e) => ProductListWidget(productInfo: e),
                          )
                          .toList(),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: Container(
                          width: 40,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                            ),
                          ),
                          child: const Icon(Icons.arrow_right),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: Container(
                          width: 40,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                          child: const Icon(Icons.arrow_left),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
    }
  }
}
