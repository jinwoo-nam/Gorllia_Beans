import 'package:beans_instapay/presentation/home/product/widget/product_list_widget.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DripBagPage extends StatelessWidget {
  const DripBagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '드립백',
              style: GoogleFonts.notoSans(
                fontSize: 25,
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Fedora Drip bag',
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Image(
                image: AssetImage('img/shop/banner/cat_dripbag_fedora.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 5,
              ),
              child: Text(
                '전 품목 10% 할인',
                style: GoogleFonts.notoSans(
                  color: secondaryGrey.withOpacity(0.7),
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Container(
                padding: const EdgeInsets.only(bottom: 1),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: Text(
                  'SEE COLLECTION',
                  style: GoogleFonts.notoSans(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ProductListWidget(),
                      ProductListWidget(),
                      ProductListWidget(),
                      ProductListWidget(),
                      ProductListWidget(),
                    ],
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
      ),
    );
  }
}
