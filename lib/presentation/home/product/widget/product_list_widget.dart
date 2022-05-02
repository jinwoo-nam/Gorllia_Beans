import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
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
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: getProductImage(context),
    );
  }

  Widget getProductImage(BuildContext context) {
    if (Responsive.isPage1(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image(
              image: AssetImage(productInfo.imageUrl),
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          SizedBox(
            width: 210,
            child: Text(
              productInfo.name,
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 210,
            child: Padding(
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
          ),
        ],
      );
    } else if (Responsive.isPage2(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image(
              image: AssetImage(productInfo.imageUrl),
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          SizedBox(
            width: 210,
            child: Text(
              productInfo.name,
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 210,
            child: Padding(
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
          ),
        ],
      );
    } else if (Responsive.isPage3(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image(
              image: AssetImage(productInfo.imageUrl),
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          SizedBox(
            width: 210,
            child: Text(
              productInfo.name,
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 210,
            child: Padding(
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
          ),
        ],
      );
    } else if (Responsive.isPage4(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image(
              image: AssetImage(productInfo.imageUrl),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 5,
            ),
          ),
          SizedBox(
            width: 210,
            child: Text(
              productInfo.name,
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 210,
            child: Padding(
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
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image(
              image: AssetImage(productInfo.imageUrl),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 5,
            ),
          ),
          SizedBox(
            width: 210,
            child: Text(
              productInfo.name,
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 210,
            child: Padding(
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
          ),
        ],
      );
    }
  }
}
