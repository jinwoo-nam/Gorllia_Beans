import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/responsive/responsive.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

const String homePageUrl = 'https://www.instapay.kr/';
const String bookSearchUrl = 'https://book.instapay.kr/';
const String instaBooksUrl = 'https://book.instapay.kr/gbb/';
const String blogUrl = 'https://blog.naver.com/instapay_official';
const String helpUrl = 'https://book.instapay.kr/help.php';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return getContactPage(context);
  }

  Widget getContactPage(BuildContext context) {
    final viewModel = (context).watch<HomeViewModel>();

    if (Responsive.isPage1(context) ||
        Responsive.isPage2(context) ||
        Responsive.isPage3(context)) {
      return Container(
        color: contactBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getContact(),
              getLinks(viewModel),
              getGetInTouch(),
            ],
          ),
        ),
      );
    } else if (Responsive.isPage4(context)) {
      return Container(
        color: contactBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
            vertical: 40,
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getContact(),
                      getGetInTouch(),
                    ],
                  ),
                ),
              ),
              Expanded(child: getLinks(viewModel)),
            ],
          ),
        ),
      );
    } else {
      return Container(
        color: contactBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 6,
            vertical: 50,
          ),
          child: Row(
            children: [
              Expanded(
                child: getContact(),
              ),
              Expanded(
                child: getLinks(viewModel),
              ),
              Expanded(
                child: getGetInTouch(),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget getContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONTACT',
          style: GoogleFonts.notoSans(
            textStyle: Theme.of(context).textTheme.headline5,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              width: 40,
              height: 4,
              decoration: const BoxDecoration(
                color: selectColor,
              ),
            ),
          ),
        ),
        Text(
          '서울특별시 강남구 영동대로 85길 38\n진성빌딩 701\n대표이사 배재광',
          style: GoogleFonts.notoSans(
            color: fontColorGrey,
            fontSize: 15,
            height: 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Email: support@instapay.kr\nKakao: @instapay (인스타페이)',
            style: GoogleFonts.notoSans(
              color: fontColorGrey,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget getLinks(HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'LINKS',
            style: GoogleFonts.notoSans(
              textStyle: Theme.of(context).textTheme.headline5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              width: 40,
              height: 4,
              decoration: const BoxDecoration(
                color: selectColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: OnHoverDetect(
            builder: (isHovered) {
              final color = (isHovered) ? selectColor : fontColorGrey;
              final text = (isHovered) ? ' - About us' : 'About us';
              return InkWell(
                onTap: (){
                  final uri = Uri.parse(homePageUrl);
                  viewModel.launchURL(uri);
                },
                child: Text(
                  text,
                  style: GoogleFonts.notoSans(
                    color: color,
                    fontSize: 15,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: OnHoverDetect(
            builder: (isHovered) {
              final color = (isHovered) ? selectColor : fontColorGrey;
              final text = (isHovered) ? ' - Book Search' : 'Book Search';
              return InkWell(
                onTap: (){
                  final uri = Uri.parse(bookSearchUrl);
                  viewModel.launchURL(uri);
                },
                child: Text(
                  text,
                  style: GoogleFonts.notoSans(
                    color: color,
                    fontSize: 15,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: OnHoverDetect(
            builder: (isHovered) {
              final color = (isHovered) ? selectColor : fontColorGrey;
              final text = (isHovered) ? ' - InstaBooks' : 'InstaBooks';
              return InkWell(
                onTap: (){
                  final uri = Uri.parse(instaBooksUrl);
                  viewModel.launchURL(uri);
                },
                child: Text(
                  text,
                  style: GoogleFonts.notoSans(
                    color: color,
                    fontSize: 15,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: OnHoverDetect(
            builder: (isHovered) {
              final color = (isHovered) ? selectColor : fontColorGrey;
              final text = (isHovered) ? ' - Blog' : 'Blog';
              return InkWell(
                onTap: (){
                  final uri = Uri.parse(blogUrl);
                  viewModel.launchURL(uri);
                },
                child: Text(
                  text,
                  style: GoogleFonts.notoSans(
                    color: color,
                    fontSize: 15,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: OnHoverDetect(
            builder: (isHovered) {
              final color = (isHovered) ? selectColor : fontColorGrey;
              final text = (isHovered) ? ' - Help' : 'Help';
              return InkWell(
                onTap: (){
                  final uri = Uri.parse(helpUrl);
                  viewModel.launchURL(uri);
                },
                child: Text(
                  text,
                  style: GoogleFonts.notoSans(
                    color: color,
                    fontSize: 15,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget getGetInTouch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Text(
            'GET IN TOUCH',
            style: GoogleFonts.notoSans(
              textStyle: Theme.of(context).textTheme.headline5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              width: 40,
              height: 4,
              decoration: const BoxDecoration(
                color: selectColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            '이메일 주소를 남겨주시면 새로운 소식을 보내드립니다.',
            style: GoogleFonts.notoSans(
              color: fontColorGrey,
              fontSize: 15,
            ),
          ),
        ),
        TextField(
          style: GoogleFonts.notoSans(
            color: Colors.white,
            fontSize: 15,
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: '구독해 주세요!',
            hintStyle: GoogleFonts.notoSans(
              color: fontColorGrey,
              fontSize: 15,
            ),
            filled: true,
            fillColor: secondaryGrey,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Icon(
              Icons.mail_rounded,
              color: selectColor,
            ),
          ),
        ),
      ],
    );
  }
}
