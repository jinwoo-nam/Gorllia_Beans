import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Image(
              image: AssetImage('img/shop/product/thumb_dripbagGA.jpg'),
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          SizedBox(
            width: 210,
            child: Text(
              '과테말라 안티구아 드립백 10개입',
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 210,
            child: Text(
              '13,500 원',
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
