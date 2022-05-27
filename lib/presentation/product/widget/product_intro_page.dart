import 'dart:async';

import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/cart/cart_view_model.dart';
import 'package:beans_instapay/presentation/components/app_bar_widget.dart';
import 'package:beans_instapay/presentation/components/drawer_widget.dart';
import 'package:beans_instapay/presentation/home/contact/contact_page.dart';
import 'package:beans_instapay/presentation/home/footer/footer_page.dart';
import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/presentation/product/widget/intro_drop_down.dart';
import 'package:beans_instapay/presentation/product/widget/product_intro_state.dart';
import 'package:beans_instapay/presentation/product/widget/product_intro_view_model.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/constant.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductIntroPage extends StatefulWidget {
  final ProductInfo info;

  const ProductIntroPage({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  State<ProductIntroPage> createState() => _ProductIntroPageState();
}

class _ProductIntroPageState extends State<ProductIntroPage> {
  List<String> normalItemsCount = ['1', '2', '3', '5', '10'];
  List<String> beansItemsCount = ['1', '2'];
  List<String> beansType = ['원두 상태(홀빈)', '분쇄(드립용)'];
  var selectDropDownValue = '1';
  var selectBeansDropDownValue = '원두 상태(홀빈)';
  IntroDropDown? dropDown;
  IntroDropDown? beansDropDown;
  IntroDropDown? beansTypeDropDown;
  bool isBeans = false;
  StreamSubscription? _streamSubscription;

  double bodyPadding = 16;
  bool hoverState = false;
  bool isCategoryClick = false;
  final controller = ScrollController();

  bool buyBtnShow = false;

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
    dropDown = IntroDropDown(
      initValue: selectDropDownValue,
      items: normalItemsCount,
      type: DropDownValueType.int,
      name: 'normal',
    );
    beansDropDown = IntroDropDown(
      initValue: selectDropDownValue,
      items: beansItemsCount,
      type: DropDownValueType.int,
      name: 'beans',
    );
    beansTypeDropDown = IntroDropDown(
      initValue: selectBeansDropDownValue,
      items: beansType,
      type: DropDownValueType.string,
      name: 'beans type',
    );

    Future.microtask(() {
      final viewModel = context.read<ProductIntroViewModel>();
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
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final introViewModel = (context).watch<ProductIntroViewModel>();
    final homeViewModel = context.watch<HomeViewModel>();
    final cartViewModel = context.watch<CartViewModel>();
    final itemCount = cartViewModel.state.cartInfo.length;

    final state = introViewModel.state;

    final int dcPrice =
        (widget.info.price * ((100 - widget.info.dcRate) / 100)).ceil();

    final shippingFee = (dcPrice * state.selectedProductCount < 20000)
        ? widget.info.shippingFee
        : 0;
    final totalPrice = (dcPrice * state.selectedProductCount) + shippingFee;

    if (Responsive.isPage1(context)) {
      bodyPadding = 32;
    } else if (Responsive.isPage2(context) || Responsive.isPage3(context)) {
      bodyPadding = 32;
    } else if (Responsive.isPage4(context)) {
      bodyPadding = 50;
    } else if (Responsive.isPage5(context)) {
      bodyPadding = 350 * ((MediaQuery.of(context).size.width - 1200) / 720);
    }

    final double lastAppbarWidth =
        150 * ((MediaQuery.of(context).size.width - 1200) / 720);
    double appBarHeight = 70;
    double categoryWidth = 150;
    if (Responsive.isPage5(context)) {
      categoryWidth += lastAppbarWidth;
    }
    final category = widget.info.categories[0];
    String title = '';
    switch (category) {
      case 'DRIPBAG':
        title = 'Fedora Dripbag';
        break;
      case 'STICK':
        title = 'Stick Coffee';
        break;
      case 'BEANS':
        title = 'Coffee Beans';
        break;
    }
    return GestureDetector(
      onTap: () {
        if (hoverState == true) {
          changeHoverState();
        }
        removeOverlay('');
      },
      child: Scaffold(
        drawer: DrawerWidget(
          itemCount: itemCount,
          removeOverlay: removeOverlay,
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: AppBarWidget(
            itemCount: itemCount,
            changeHoverState: changeHoverState,
            removeOverlay: removeOverlay,
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        color: headerCardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  title,
                                  style: GoogleFonts.notoSans(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              if (Responsive.isPage1(context))
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: OnHoverDetect(
                                        builder: (isHovered) {
                                          final color = isHovered
                                              ? selectColor
                                              : Colors.white60;
                                          return InkWell(
                                            onTap: () {
                                              removeOverlay('');
                                              Navigator.pushNamed(context, '/');
                                            },
                                            child: Text(
                                              'Home',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.notoSans(
                                                color: color,
                                                fontSize: 15,
                                                //fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        ' > ',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.notoSans(
                                          color: Colors.white60,
                                          fontSize: 15,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    OnHoverDetect(
                                      builder: (isHovered) {
                                        final color = isHovered
                                            ? selectColor
                                            : Colors.white60;
                                        return InkWell(
                                          onTap: () {
                                            switch (category) {
                                              case 'DRIPBAG':
                                                removeOverlay('');
                                                Navigator.pushNamed(
                                                    context, '/detail/dripbag');
                                                break;
                                              case 'STICK':
                                                removeOverlay('');
                                                Navigator.pushNamed(
                                                    context, '/detail/stick');
                                                break;
                                              case 'BEANS':
                                                removeOverlay('');
                                                Navigator.pushNamed(
                                                    context, '/detail/beans');
                                                break;
                                            }
                                          },
                                          child: Text(
                                            category,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.notoSans(
                                              color: color,
                                              fontSize: 15,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        ' > ',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.notoSans(
                                          color: Colors.white60,
                                          fontSize: 15,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 13,
                                      child: Text(
                                        widget.info.name,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.notoSans(
                                          color: Colors.white70,
                                          fontSize: 15,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              if (!Responsive.isPage1(context))
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OnHoverDetect(
                                      builder: (isHovered) {
                                        final color = isHovered
                                            ? selectColor
                                            : Colors.white60;
                                        return InkWell(
                                          onTap: () {
                                            removeOverlay('');
                                            Navigator.pushNamed(context, '/');
                                          },
                                          child: Text(
                                            'Home',
                                            textAlign: TextAlign.right,
                                            style: GoogleFonts.notoSans(
                                              color: color,
                                              fontSize: 15,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Text(
                                      ' > ',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.notoSans(
                                        color: Colors.white60,
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    OnHoverDetect(
                                      builder: (isHovered) {
                                        final color = isHovered
                                            ? selectColor
                                            : Colors.white60;
                                        return InkWell(
                                          onTap: () {
                                            switch (category) {
                                              case 'DRIPBAG':
                                                removeOverlay('');
                                                Navigator.pushNamed(
                                                    context, '/detail/dripbag');
                                                break;
                                              case 'STICK':
                                                removeOverlay('');
                                                Navigator.pushNamed(
                                                    context, '/detail/stick');
                                                break;
                                              case 'BEANS':
                                                removeOverlay('');
                                                Navigator.pushNamed(
                                                    context, '/detail/beans');
                                                break;
                                            }
                                          },
                                          child: Text(
                                            category,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.notoSans(
                                              color: color,
                                              fontSize: 15,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Text(
                                      ' > ',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.notoSans(
                                        color: Colors.white60,
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      widget.info.name,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.notoSans(
                                        color: Colors.white70,
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: bodyPadding),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: getMainImage(),
                                ),
                                if (!Responsive.isPage1(context))
                                  const SizedBox(
                                    width: 50,
                                  ),
                                if (!Responsive.isPage1(context))
                                  Expanded(
                                    flex: 3,
                                    child: getDescription(
                                        dcPrice,
                                        totalPrice,
                                        shippingFee,
                                        state,
                                        introViewModel,
                                        cartViewModel),
                                  ),
                              ],
                            ),
                            if (Responsive.isPage1(context))
                              getDescription(dcPrice, totalPrice, shippingFee,
                                  state, introViewModel, cartViewModel),
                          ]),
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
                                removeOverlay('');
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
                                removeOverlay('');
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
                                removeOverlay('');
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

  Widget getDescription(
      int dcPrice,
      int totalPrice,
      int shippingFee,
      ProductIntroState state,
      ProductIntroViewModel introViewModel,
      CartViewModel cartViewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            widget.info.name,
            textAlign: TextAlign.start,
            style: GoogleFonts.notoSans(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              currencyFormat(widget.info.price),
              style: GoogleFonts.notoSans(
                fontSize: 22,
                decoration: TextDecoration.lineThrough,
                color: secondaryGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                currencyFormat(dcPrice),
                style: GoogleFonts.notoSans(
                  fontSize: 22,
                  color: secondaryGrey,
                ),
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Text(
          widget.info.description,
          style: GoogleFonts.notoSans(
            fontSize: 15,
          ),
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Row(
          children: [
            Text(
              'Cup-Note : ',
              style: GoogleFonts.notoSans(
                fontSize: 15,
                height: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.info.cupNote,
              style: GoogleFonts.notoSans(
                fontSize: 15,
                height: 2,
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          children: [
            Text(
              '신맛 : ',
              style: GoogleFonts.notoSans(
                fontSize: 15,
                height: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            getStars(widget.info.sourness),
          ],
        ),
        Row(
          children: [
            Text(
              '단맛 : ',
              style: GoogleFonts.notoSans(
                fontSize: 15,
                height: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            getStars(widget.info.sweet),
          ],
        ),
        Row(
          children: [
            Text(
              '쓴맛 : ',
              style: GoogleFonts.notoSans(
                fontSize: 15,
                height: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            getStars(widget.info.bitterness),
          ],
        ),
        Row(
          children: [
            Text(
              '바디감 : ',
              style: GoogleFonts.notoSans(
                fontSize: 15,
                height: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            getStars(widget.info.bodyTaste),
          ],
        ),
        const Padding(padding: EdgeInsets.all(25)),
        Row(
          children: [
            OnHoverDetect(
              builder: (isHovered) {
                final color = isHovered ? Colors.black : selectColor;

                return InkWell(
                  onTap: () {
                    setState(() {
                      buyBtnShow = !buyBtnShow;
                      if (buyBtnShow) {
                        introViewModel.setProductValue('원두 상태(홀빈)');
                        introViewModel.setProductCount(1);
                      }
                    });
                  },
                  child: (buyBtnShow)
                      ? Container(
                          width: 60,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: selectColor,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '닫기',
                              style: GoogleFonts.notoSans(
                                  color: selectColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : Container(
                          width: 95,
                          height: 55,
                          color: color,
                          child: Center(
                            child: Text(
                              '구매하기',
                              style: GoogleFonts.notoSans(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),
            const SizedBox(
              width: 20,
            ),
            OnHoverDetect(
              builder: (isHovered) {
                final color = isHovered ? Colors.black : selectColor;
                return InkWell(
                  onTap: () {
                    if (!isBeans) {
                      cartViewModel.addCart(CartInfo(
                          productInfo: widget.info,
                          count: state.selectedProductCount));
                    } else {
                      final type = (state.selectedProductType == '원두 상태(홀빈)')
                          ? BeanType.Whole
                          : BeanType.Drip;
                      cartViewModel.addCart(
                        CartInfo(
                          productInfo: widget.info,
                          count: state.selectedProductCount,
                          beanType: type,
                        ),
                      );
                    }
                    _showToast();
                  },
                  child: Container(
                    width: 95,
                    height: 55,
                    color: color,
                    child: Center(
                      child: Text(
                        '장바구니 담기',
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(25)),
        if (buyBtnShow)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '결제금액',
                    style: GoogleFonts.notoSans(
                      color: fontColorGrey,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    currencyFormat(totalPrice),
                    style: GoogleFonts.notoSans(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  height: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '정가(1EA)',
                    style: GoogleFonts.notoSans(
                      color: fontColorGrey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    currencyFormat(widget.info.price),
                    style: GoogleFonts.notoSans(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '할인가',
                    style: GoogleFonts.notoSans(
                      color: fontColorGrey,
                      fontSize: 15,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        currencyFormat(dcPrice),
                        style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '(10% 할인)',
                        style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '배송비',
                    style: GoogleFonts.notoSans(
                      color: fontColorGrey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    currencyFormat(shippingFee),
                    style: GoogleFonts.notoSans(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              (isBeans)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: beansDropDown!,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: dropDown!,
                    ),
              if (isBeans)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: beansTypeDropDown!,
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: getQrImage(
                      state.selectedProductCount, state.selectedProductType),
                ),
              ),
            ],
          ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Divider(
            height: 2,
          ),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(e),
                )),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Divider(
            height: 2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(40),
        ),
      ],
    );
  }

  Widget getMainImage() {
    if (Responsive.isPage1(context)) {
      return Image(
        image: AssetImage(widget.info.imageUrl),
        fit: BoxFit.cover,
      );
    }
    if (Responsive.isPage2(context)) {
      return Image(
        image: AssetImage(widget.info.imageUrl),
        width: 200,
        height: 250,
        fit: BoxFit.cover,
      );
    }
    if (Responsive.isPage3(context)) {
      return Image(
        image: AssetImage(widget.info.imageUrl),
        width: 300,
        height: 450,
        fit: BoxFit.cover,
      );
    }
    if (Responsive.isPage4or5(context)) {
      return Image(
        image: AssetImage(widget.info.imageUrl),
        width: 400,
        height: 550,
        fit: BoxFit.cover,
      );
    }
    return Image(
      image: AssetImage(widget.info.imageUrl),
      width: 200,
      height: 250,
      fit: BoxFit.cover,
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

  Widget getStars(int cnt) {
    List<FaIcon> list = [];

    for (int i = 0; i < cnt; i++) {
      list.add(const FaIcon(
        FontAwesomeIcons.solidStar,
        color: secondaryGrey,
        size: 15,
      ));
    }
    return Row(
      children: list.map((e) => e).toList(),
    );
  }

  void changeHoverState() {
    setState(() {
      hoverState = !hoverState;
    });
  }

  void launchURL(Uri query) async {
    if (!await launchUrl(query)) throw 'Could not launch $query';
  }

  String currencyFormat(int price) {
    var format = NumberFormat('###,###,### 원');
    return format.format(price);
  }
}
