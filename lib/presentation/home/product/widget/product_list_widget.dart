import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/main_view_model.dart';
import 'package:beans_instapay/presentation/home/overlay/loader.dart';
import 'package:beans_instapay/presentation/home/overlay/loader_detail.dart';
import 'package:beans_instapay/presentation/home/product/product_view_model.dart';
import 'package:beans_instapay/presentation/product/detail/product_detail_veiw_model.dart';
import 'package:beans_instapay/presentation/product/widget/product_intro_page.dart';
import 'package:beans_instapay/presentation/product/widget/product_intro_view_model.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum ListWidgetType {
  preview,
  detail,
}

class ProductListWidget extends StatelessWidget {
  final ProductInfo productInfo;
  final ListWidgetType listType;

  const ProductListWidget({
    Key? key,
    required this.productInfo,
    this.listType = ListWidgetType.preview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final productViewModel = context.watch<ProductViewModel>();
    final productDetailViewModel = context.watch<ProductDetailViewModel>();
    final introViewModel = context.watch<ProductIntroViewModel>();

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: OnHoverDetect(
        builder: (isHovered) {
          return getProductCard(context, isHovered, viewModel, productViewModel,
              productDetailViewModel, introViewModel);
        },
      ),
    );
  }

  Widget getProductCard(
      BuildContext context,
      bool isHovered,
      MainViewModel viewModel,
      ProductViewModel productViewModel,
      ProductDetailViewModel productDetailViewModel,
      ProductIntroViewModel introViewModel) {
    int dcPrice =
        (productInfo.price * ((100 - productInfo.dcRate) / 100)).toInt();

    if (Responsive.isPage1(context)) {
      final double width = (listType == ListWidgetType.preview) ? 250 : 400;
      return SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProductImage(context, isHovered, width, viewModel,
                productViewModel, productDetailViewModel, introViewModel),
            Text(
              productInfo.name,
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                currencyFormat(dcPrice),
                style: GoogleFonts.notoSans(
                  color: priceGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (Responsive.isPage2(context)) {
      final double width = (listType == ListWidgetType.preview) ? 250 : 400;
      return SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProductImage(context, isHovered, width, viewModel,
                productViewModel, productDetailViewModel, introViewModel),
            Text(
              productInfo.name,
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                currencyFormat(dcPrice),
                style: GoogleFonts.notoSans(
                  color: priceGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (Responsive.isPage3(context)) {
      final double width = (listType == ListWidgetType.preview) ? 250 : 400;

      return SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProductImage(context, isHovered, width, viewModel,
                productViewModel, productDetailViewModel, introViewModel),
            Text(
              productInfo.name,
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                currencyFormat(dcPrice),
                style: GoogleFonts.notoSans(
                  color: priceGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (Responsive.isPage4(context)) {
      final double width = (listType == ListWidgetType.preview) ? 200 : 400;

      return SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProductImage(context, isHovered, width, viewModel,
                productViewModel, productDetailViewModel, introViewModel),
            Text(
              productInfo.name,
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                currencyFormat(dcPrice),
                style: GoogleFonts.notoSans(
                  color: priceGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      final double width = (listType == ListWidgetType.preview) ? 300 : 400;

      return SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProductImage(context, isHovered, width, viewModel,
                productViewModel, productDetailViewModel, introViewModel),
            Text(
              productInfo.name,
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                currencyFormat(dcPrice),
                style: GoogleFonts.notoSans(
                  color: priceGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget getProductImage(
    BuildContext context,
    bool isHovered,
    double width,
    MainViewModel viewModel,
    ProductViewModel productViewModel,
    ProductDetailViewModel productDetailViewModel,
    ProductIntroViewModel introViewModel,
  ) {
    return InkWell(
      onTap: () {
        introViewModel.setProductValue('원두 상태(홀빈)');
        introViewModel.setProductCount(1);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductIntroPage(
                    info: productInfo,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage(productInfo.imageUrl),
              fit: BoxFit.cover,
            ),
            AnimatedPositioned(
              bottom: (isHovered) ? 0 : -50,
              duration: const Duration(milliseconds: 200),
              child: AnimatedOpacity(
                opacity: isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: OnHoverDetect(
                  builder: (isHoveredInContainer) {
                    final color =
                        (isHoveredInContainer) ? Colors.black : selectColor;
                    return InkWell(
                      onTap: () async {
                        if (listType == ListWidgetType.preview) {
                          productViewModel.setProductValue('원두 상태(홀빈)');
                          productViewModel.setProductCount(1);
                          viewModel.setProductInfo(productInfo);
                          Loader.appLoader.showLoader();
                          await Future.delayed(const Duration(seconds: 5));
                        } else {
                          productViewModel.setProductValue('원두 상태(홀빈)');
                          productViewModel.setProductCount(1);
                          productDetailViewModel.setProductInfo(productInfo);
                          LoaderDetail.appLoader.showLoader();
                          await Future.delayed(const Duration(seconds: 5));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: width,
                        height: 50,
                        color: color,
                        child: Text(
                          '구매하기',
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 400),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                scale: (isHovered) ? 1 : 1.5,
                child: OnHoverDetect(
                  builder: (isButtonHovered) {
                    final color =
                        (isButtonHovered) ? selectColor : Colors.white;
                    return ElevatedButton(
                      onPressed: () {
                        introViewModel.setProductValue('원두 상태(홀빈)');
                        introViewModel.setProductCount(1);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductIntroPage(
                                    info: productInfo,
                                  )),
                        );
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(50, 50),
                        shape: const CircleBorder(),
                        primary: color,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String currencyFormat(int price) {
    var format = NumberFormat('###,###,### 원');
    return format.format(price);
  }
}
