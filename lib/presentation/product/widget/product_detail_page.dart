import 'package:beans_instapay/domain/model/product_detail_page_info.dart';
import 'package:beans_instapay/presentation/home/contact/contact_page.dart';
import 'package:beans_instapay/presentation/home/footer/footer_page.dart';
import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/presentation/home/product/widget/product_list_widget.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductDetailPageInfo info;

  const ProductDetailPage({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          toolbarHeight: 90,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: InkWell(
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
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        info.title,
                        style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      info.description,
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
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: info.categories.map((e) => Text(e)).toList(),
                        ),
                      ),
                      ...info.productInfo
                          .map(
                            (e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 32.0),
                              child: ProductListWidget(
                                productInfo: e,
                                listType: ListWidgetType.detail,
                              ),
                            ),
                          )
                          .toList(),
                    ]),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: viewModel.getCalcContactPageHeight(context),
                minHeight: viewModel.getCalcContactPageHeight(context),
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
    );
  }
}
