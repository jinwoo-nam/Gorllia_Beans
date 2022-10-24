import 'dart:math';

import 'package:beans_instapay/presentation/home/home_event.dart';
import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/constant.dart';
import 'package:beans_instapay/ui/on_hover_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final length = max(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Stack(
      children: [
        Image(
          image: const AssetImage('img/cupscups01.jpg'),
          fit: BoxFit.cover,
          height: length,
          width: length,
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tight(Size(
            length,
            length,
          )),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children: [
                  getMainLogo(context),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60.0,
                      bottom: 20,
                    ),
                    child: getMainText(context),
                  ),
                  OnHoverButton(
                    child: InkWell(
                      onTap: () {
                        viewModel.onEvent(const HomeEvent.moveToDripBag());
                      },
                      child: Container(
                        width: 330,
                        margin: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 50,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.zero,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Text(
                                '최고급 드립백 커피를 만나보세요',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.notoSans(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 22,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            getMainAd(context, viewModel),
          ],
        ),
      ],
    );
  }

  Widget getMainLogo(BuildContext context) {
    if (Responsive.isPage1(context)) {
      return const Image(
        image: AssetImage('img/GB_logo_w.png'),
        height: 75,
      );
    } else if (Responsive.isPage2(context)) {
      return const Image(
        image: AssetImage('img/GB_logo_w.png'),
        height: 80,
      );
    } else if (Responsive.isPage3(context)) {
      return const Image(
        image: AssetImage('img/GB_logo_w.png'),
        height: 85,
      );
    } else if (Responsive.isPage4(context)) {
      return const Image(
        image: AssetImage('img/GB_logo_w.png'),
        height: 90,
      );
    } else {
      return const Image(
        image: AssetImage('img/GB_logo_w.png'),
        height: 95,
      );
    }
  }

  Widget getMainText(BuildContext context) {
    if (Responsive.isPage1(context)) {
      return Text(
        'Find Your Taste!',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: GoogleFonts.sora(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      );
    } else if (Responsive.isPage2(context)) {
      return Text(
        'Find Your Taste!',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: GoogleFonts.sora(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 60,
        ),
      );
    } else if (Responsive.isPage3(context)) {
      return Text(
        'Find Your Taste!',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: GoogleFonts.sora(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 75,
        ),
      );
    } else if (Responsive.isPage4(context)) {
      return Text(
        'Find Your Taste!',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: GoogleFonts.sora(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 85,
        ),
      );
    } else {
      return Text(
        'Find Your Taste!',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: GoogleFonts.sora(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 120,
        ),
      );
    }
  }

  Widget getMainAd(BuildContext context, HomeViewModel viewModel) {
    if (Responsive.isPage1(context)) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: mainPageHeight / 3,
        color: headerCardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getADText(context, viewModel),
              const SizedBox(
                height: 25,
              ),
              getBuyButton(context, viewModel),
            ],
          ),
        ),
      );
    } else if (Responsive.isPage2(context)) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: (mainPageHeight + 80) / 3,
        color: headerCardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getADText(context, viewModel),
              const SizedBox(
                height: 25,
              ),
              getBuyButton(context, viewModel),
            ],
          ),
        ),
      );
    } else if (Responsive.isPage3(context)) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: (mainPageHeight + 200) / 3,
        color: headerCardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getADText(context, viewModel),
              const SizedBox(
                height: 25,
              ),
              getBuyButton(context, viewModel),
            ],
          ),
        ),
      );
    } else if (Responsive.isPage4(context)) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: (mainPageHeight + 150) / 3,
        color: headerCardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getADText(context, viewModel),
              getBuyButton(context, viewModel),
            ],
          ),
        ),
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: (mainPageHeight + 150) / 3,
        color: headerCardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getADText(context, viewModel),
                getBuyButton(context, viewModel),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget getBuyButton(BuildContext context, HomeViewModel viewModel) {
    double ver = 10;
    double ho = 20;
    if (Responsive.isPage1(context)) {
      ver = 10;
      ho = 20;
    } else if (Responsive.isPage2(context) || Responsive.isPage3(context)) {
      ver = 20;
      ho = 30;
    } else if (Responsive.isPage4(context)) {
      ver = 30;
      ho = 40;
    } else {
      ver = 30;
      ho = 40;
    }

    return OnHoverButton(
      child: InkWell(
        onTap: () {
          viewModel.onEvent(const HomeEvent.moveToCoffeeBeans());
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: ver, horizontal: ho),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Colors.white,
            ),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '구매하기',
                  style: GoogleFonts.notoSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const WidgetSpan(
                  child: Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                    size: 19,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getADText(BuildContext context, HomeViewModel viewModel) {
    double fontSize1 = 15;
    double fontSize2 = 24;

    if (Responsive.isPage1(context) || Responsive.isPage2(context)) {
      fontSize1 = 15;
      fontSize2 = 24;
    } else if (Responsive.isPage3(context) || Responsive.isPage4(context)) {
      fontSize1 = 20;
      fontSize2 = 40;
    } else {
      fontSize1 = 20;
      fontSize2 = 40;
    }

    return InkWell(
      onTap: () {
        viewModel.onEvent(const HomeEvent.moveToCoffeeBeans());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '고릴라빈즈 론칭 기념',
            style: GoogleFonts.notoSans(
              color: Colors.white,
              fontSize: fontSize1,
              height: 2,
            ),
          ),
          Text(
            '최고급 원두 전품목 10% 할인',
            style: GoogleFonts.notoSans(
              color: Colors.white,
              fontSize: fontSize2,
              fontWeight: FontWeight.bold,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
