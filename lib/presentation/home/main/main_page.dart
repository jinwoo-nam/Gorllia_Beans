import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/constant.dart';
import 'package:beans_instapay/ui/on_hover_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: const AssetImage('img/cupscups01.jpg'),
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tight(Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.width,
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
                      onTap: () {},
                      child: Container(
                        width: 290,
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
                            Radius.circular(10.0), // POINT
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '최고급 드립백 커피를 만나보세요',
                              style: GoogleFonts.notoSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                              size: 22,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            getMainAd(context),
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

  Widget getMainAd(BuildContext context) {
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
              Text(
                '고릴라빈즈 론칭 기념',
                style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontSize: 15,
                  height: 2,
                ),
              ),
              Text(
                '최고급 원두 1+1 할인 이벤트!',
                style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              OnHoverButton(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
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
              ),
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
              Text(
                '고릴라빈즈 론칭 기념',
                style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontSize: 15,
                  height: 2,
                ),
              ),
              Text(
                '최고급 원두 1+1 할인 이벤트!',
                style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              OnHoverButton(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
              Text(
                '고릴라빈즈 론칭 기념',
                style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontSize: 20,
                  height: 2,
                ),
              ),
              Text(
                '최고급 원두 1+1 할인 이벤트!',
                style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              OnHoverButton(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '고릴라빈즈 론칭 기념',
                    style: GoogleFonts.notoSans(
                      color: Colors.white,
                      fontSize: 20,
                      height: 2,
                    ),
                  ),
                  Text(
                    '최고급 원두 1+1 할인 이벤트!',
                    style: GoogleFonts.notoSans(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                ],
              ),
              OnHoverButton(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '고릴라빈즈 론칭 기념',
                      style: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontSize: 20,
                        height: 2,
                      ),
                    ),
                    Text(
                      '최고급 원두 1+1 할인 이벤트!',
                      style: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 2,
                      ),
                    ),
                  ],
                ),
                OnHoverButton(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 40),
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
              ],
            ),
          ),
        ),
      );
    }
  }
}
