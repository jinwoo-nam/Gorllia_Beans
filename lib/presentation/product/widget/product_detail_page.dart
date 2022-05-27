import 'package:beans_instapay/domain/model/product_detail_page_info.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/cart/cart_view_model.dart';
import 'package:beans_instapay/presentation/home/contact/contact_page.dart';
import 'package:beans_instapay/presentation/home/footer/footer_page.dart';
import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_list_widget.dart';
import 'package:beans_instapay/presentation/product/detail/product_detail_state.dart';
import 'package:beans_instapay/presentation/product/detail/product_detail_veiw_model.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

const String homePageUrl = 'https://www.instapay.kr/';

class ProductDetailPage extends StatefulWidget {
  final ProductDetailPageInfo info;

  const ProductDetailPage({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double bodyPadding = 16;
  bool hoverState = false;
  bool isCategoryClick = false;
  final controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Responsive.isPage1(context)) {
      bodyPadding = 32;
    } else if (Responsive.isPage2(context) || Responsive.isPage3(context)) {
      bodyPadding = 32;
    } else if (Responsive.isPage4(context)) {
      bodyPadding = 50;
    } else if (Responsive.isPage5(context)) {
      bodyPadding = 200 * ((MediaQuery.of(context).size.width - 1200) / 720);
    }

    final homeViewModel = context.watch<HomeViewModel>();
    final viewModel = context.watch<ProductDetailViewModel>();
    final cartViewModel = context.watch<CartViewModel>();
    final itemCount = cartViewModel.state.cartInfo.length;

    final double lastAppbarWidth =
        150 * ((MediaQuery.of(context).size.width - 1200) / 720);
    double appBarHeight = 70;
    double categoryWidth = 150;
    if (Responsive.isPage5(context)) {
      categoryWidth += lastAppbarWidth;
    }

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
                  viewModel.launchURL(uri);
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
                              viewModel.launchURL(uri);
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
                                  widget.info.title,
                                  style: GoogleFonts.notoSans(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                widget.info.description,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.notoSans(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  //fontWeight: FontWeight.bold,
                                ),
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
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Row(
                                  children: widget.info.categories
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                viewModel.setProductType(e);
                                              },
                                              child:
                                                  getProductType(e, viewModel),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                              if (Responsive.isPage1(context))
                                ...getProductListWidgetList(viewModel),
                            ]),
                      ),
                    ),
                  ),
                  if (Responsive.isPage2(context) ||
                      Responsive.isPage3(context))
                    Padding(
                      padding: EdgeInsets.all(bodyPadding),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 2,
                        children: getProductListWidgetList(viewModel),
                      ),
                    ),
                  if (Responsive.isPage4(context))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: bodyPadding),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 1 / 2,
                        children: getProductListWidgetList(viewModel),
                      ),
                    ),
                  if (Responsive.isPage5(context))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: bodyPadding),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 1 / 2,
                        children: getProductListWidgetList(viewModel),
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

  List<Widget> getProductListWidgetList(ProductDetailViewModel viewModel) {
    if (widget.info.categories.length > 1) {
      if (viewModel.state.productType == ProductType.All) {
        return widget.info.productInfo.map((e) {
          return getProductList(e);
        }).toList();
      } else {
        return widget.info.productInfo
            .where((element) {
              return (element.categories[1] ==
                  viewModel.state.productType.convertedText);
            })
            .map(
              (e) => getProductList(e),
            )
            .toList();
      }
    } else {
      return widget.info.productInfo.map((e) {
        return getProductList(e);
      }).toList();
    }
  }

  Padding getProductList(ProductInfo info) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 15,
      ),
      child: ProductListWidget(
        productInfo: info,
        listType: ListWidgetType.detail,
      ),
    );
  }

  Widget getProductType(String value, ProductDetailViewModel viewModel) {
    var fontWeight = FontWeight.normal;

    if (viewModel.state.productType.convertedText == value) {
      fontWeight = FontWeight.bold;
    }

    return Text(
      value,
      style: TextStyle(fontWeight: fontWeight),
    );
  }
}
