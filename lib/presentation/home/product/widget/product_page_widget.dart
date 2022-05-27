import 'package:beans_instapay/domain/model/product_page_info.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_list_widget.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ProductPageWidget extends StatefulWidget {
  final ProductPageInfo pageInfo;
  final CarouselController scrollController;

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
            if (widget.pageInfo.title == '드립백')
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Text(
                        '장바구니로 이동 ',
                        style: GoogleFonts.notoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.circleArrowRight,
                      ),
                    ),
                  ],
                ),
              ),
            if (Responsive.isPage1(context) ||
                Responsive.isPage2(context) ||
                Responsive.isPage3(context))
              getTitleSubtitle(context),
            if (Responsive.isPage1(context) ||
                Responsive.isPage2(context) ||
                Responsive.isPage3(context))
              getImageComment(context, widget.pageInfo),
            if (Responsive.isPage4(context) || Responsive.isPage5(context))
              getImageComment(context, widget.pageInfo),
            if (Responsive.isPage1(context) ||
                Responsive.isPage2(context) ||
                Responsive.isPage3(context))
              ProductList(widget: widget),
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

  Widget getImageComment(BuildContext context, ProductPageInfo info) {
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
          SeeCollection(
            info: info,
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
              SeeCollection(
                info: info,
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
                  child: SeeCollection(
                    info: info,
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
                      child: SeeCollection(
                        info: info,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: ProductList(
                  widget: widget,
                ),
              ),
            ],
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
                      child: SeeCollection(
                        info: info,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 + 200,
                child: ProductList(
                  widget: widget,
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}

class SeeCollection extends StatelessWidget {
  final ProductPageInfo info;

  const SeeCollection({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (info.title) {
          case '드립백':
            Navigator.pushNamed(context, '/detail/dripbag');
            break;
          case '원두스틱 커피':
            Navigator.pushNamed(context, '/detail/stick');
            break;
          case '커피 원두':
            Navigator.pushNamed(context, '/detail/beans');
            break;
        }
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
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductPageWidget widget;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    double page5Width = 450 + ((MediaQuery.of(context).size.width - 1200) / 9);
    double page3Width = 450 + ((MediaQuery.of(context).size.width - 730) / 5);
    double viewPortFraction = 0.33;
    double sideButtonPadding = 85;
    if (Responsive.isPage1(context)) {
      sideButtonPadding = 70 + ((MediaQuery.of(context).size.width - 350) / 10);
    } else if (Responsive.isPage2(context)) {
      sideButtonPadding = 70 + ((MediaQuery.of(context).size.width - 350) / 10);
    } else if (Responsive.isPage3(context)) {
      sideButtonPadding = 70 + ((MediaQuery.of(context).size.width - 350) / 10);
    } else if (Responsive.isPage4(context)) {
      sideButtonPadding = 40 + ((MediaQuery.of(context).size.width - 400) / 10);
    } else if (Responsive.isPage5(context)) {
      sideButtonPadding = 40 + ((MediaQuery.of(context).size.width - 400) / 15);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            CarouselSlider(
              carouselController: widget.widget.scrollController,
              options: CarouselOptions(
                  height: (Responsive.isPage5(context))
                      ? page5Width
                      : (Responsive.isPage3(context))
                          ? page3Width
                          : (Responsive.isPage1(context))
                              ? 380
                              : 450,
                  enlargeCenterPage: false,
                  viewportFraction: viewPortFraction,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: widget.widget.pageInfo.productInfo
                  .map(
                    (item) => Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: ProductListWidget(productInfo: item)),
                    ),
                  )
                  .toList(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: sideButtonPadding),
                child: InkWell(
                  onTap: () {
                    widget.widget.scrollController.nextPage();
                  },
                  child: OnHoverDetect(builder: (isHovered) {
                    final color = (isHovered) ? selectColor : Colors.white;

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
                padding: EdgeInsets.only(top: sideButtonPadding),
                child: InkWell(
                  onTap: () {
                    widget.widget.scrollController.previousPage();
                  },
                  child: OnHoverDetect(builder: (isHovered) {
                    final color = (isHovered) ? selectColor : Colors.white;

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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              widget.widget.pageInfo.productInfo.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () =>
                  widget.widget.scrollController.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
