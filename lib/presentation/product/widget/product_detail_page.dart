import 'package:beans_instapay/domain/model/product_detail_page_info.dart';
import 'package:beans_instapay/presentation/home/contact/contact_page.dart';
import 'package:beans_instapay/presentation/home/footer/footer_page.dart';
import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_list_widget.dart';
import 'package:beans_instapay/presentation/product/product_detail_state.dart';
import 'package:beans_instapay/presentation/product/product_detail_veiw_model.dart';
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
  bool hoverState = false;

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();
    final viewModel = context.watch<ProductDetailViewModel>();
    final double lastAppbarWidth =
        150 * ((MediaQuery.of(context).size.width - 1200) / 720);
    double appBarHeight = 70;
    double categoryWidth = 50;
    if (Responsive.isPage5(context)) {
      categoryWidth += lastAppbarWidth;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          //toolbarHeight: 90,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: InkWell(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () {
              Navigator.pop(context);
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
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
                          onPressed: () {},
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
                          onHover: (state){
                            setHoverState(state);
                          },
                          onPressed: () {},
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
                          onPressed: () {},
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              children: widget.info.categories
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            viewModel.setProductType(e);
                                          },
                                          child: getProductType(e, viewModel),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          ...getProductListWidgetList(viewModel),
                        ]),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: homeViewModel.getCalcContactPageHeight(context),
                    minHeight: homeViewModel.getCalcContactPageHeight(context),
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
                        child: Text(
                          'Coffee Beans',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Fedora Dripbag',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Stick Coffee',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void setHoverState(bool state) {
    if (state != hoverState) {
      setState(() {
        hoverState = state;
      });
    }
  }

  List<Widget> getProductListWidgetList(ProductDetailViewModel viewModel) {
    if (widget.info.categories.length > 1) {
      if (viewModel.state.productType == ProductType.All) {
        return widget.info.productInfo.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: ProductListWidget(
              productInfo: e,
              listType: ListWidgetType.detail,
            ),
          );
        }).toList();
      } else {
        return widget.info.productInfo
            .where((element) {
              return (element.categories[1] ==
                  viewModel.state.productType.convertedText);
            })
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: ProductListWidget(
                  productInfo: e,
                  listType: ListWidgetType.detail,
                ),
              ),
            )
            .toList();
      }
    } else {
      return widget.info.productInfo.map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: ProductListWidget(
            productInfo: e,
            listType: ListWidgetType.detail,
          ),
        );
      }).toList();
    }
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
