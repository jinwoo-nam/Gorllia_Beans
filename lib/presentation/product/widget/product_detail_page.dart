import 'package:beans_instapay/domain/model/product_detail_page_info.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/cart/cart_view_model.dart';
import 'package:beans_instapay/presentation/components/app_bar_widget.dart';
import 'package:beans_instapay/presentation/components/drawer_widget.dart';
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
