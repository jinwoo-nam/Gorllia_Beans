import 'package:beans_instapay/ui/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: contactBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
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
              child: Text(
                'About us',
                style: GoogleFonts.notoSans(
                  color: fontColorGrey,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Book Search',
                style: GoogleFonts.notoSans(
                  color: fontColorGrey,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'InstaBooks',
                style: GoogleFonts.notoSans(
                  color: fontColorGrey,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Blog',
                style: GoogleFonts.notoSans(
                  color: fontColorGrey,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Help',
                style: GoogleFonts.notoSans(
                  color: fontColorGrey,
                  fontSize: 15,
                ),
              ),
            ),
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
        ),
      ),
      height: MediaQuery.of(context).size.height,
    );
  }
}
