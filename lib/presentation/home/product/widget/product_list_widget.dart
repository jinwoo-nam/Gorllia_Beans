import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/presentation/home/overlay/loader.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListWidget extends StatelessWidget {
  final ProductInfo productInfo;

  const ProductListWidget({
    Key? key,
    required this.productInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: OnHoverDetect(
        builder: (isHovered) {
          return getProductCard(context, isHovered);
        },
      ),
    );
  }

  Widget getProductCard(BuildContext context, bool isHovered) {
    if (Responsive.isPage1(context)) {
      return SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProductImage(isHovered, 250),
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
                productInfo.price,
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
      return SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProductImage(isHovered, 250),
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
                productInfo.price,
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
      return SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProductImage(isHovered, 250),
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
                productInfo.price,
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
      return SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProductImage(isHovered, 200),
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
                productInfo.price,
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
      return SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProductImage(isHovered, 300),
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
                productInfo.price,
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

  Widget getProductImage(bool isHovered, double width) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child:
            // (isHovered)
            //     ?
            Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage(productInfo.imageUrl),
              fit: BoxFit.cover,
            ),
            AnimatedPositioned(
              bottom: (isHovered) ? 0 : -50,
              duration: const Duration(milliseconds: 300),
              child: AnimatedOpacity(
                opacity: isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 400),
                child: OnHoverDetect(
                  builder: (isHoveredInContainer) {
                    final color =
                        (isHoveredInContainer) ? Colors.black : selectColor;
                    return InkWell(
                      onTap: () async{
                        Loader.appLoader.showLoader();
                        await Future.delayed(const Duration(seconds: 5));
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
                      onPressed: () {},
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
        )
        // : Image(
        //     image: AssetImage(productInfo.imageUrl),
        //     fit: BoxFit.cover,
        //   ),
        );
  }
}
