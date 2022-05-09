import 'package:beans_instapay/presentation/home/home_view_model.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

const String facebookUrl = 'https://www.facebook.com/instapay.kr';
const String instaUrl = 'https://www.instagram.com/instabooks.official/';
const String blogUrl = 'https://blog.naver.com/instapay_official';

class FooterPage extends StatelessWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = (context).watch<HomeViewModel>();

    return Container(
      color: footerBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnHoverDetect(
                builder: (isHovered) {
                  final color = (isHovered) ? selectColor : fontColorGrey;
                  return InkWell(
                    onTap: () {
                      final uri = Uri.parse(facebookUrl);
                      viewModel.launchURL(uri);
                    },
                    child: Tooltip(
                      textStyle: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      preferBelow: false,
                      decoration: const BoxDecoration(
                        color: selectColor,
                      ),
                      message: 'Facebook',
                      verticalOffset: 20,
                      height: 25,
                      child: FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: color,
                        size: 18,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 40,
              ),
              OnHoverDetect(
                builder: (isHovered) {
                  final color = (isHovered) ? selectColor : fontColorGrey;
                  return InkWell(
                    onTap: () {
                      final uri = Uri.parse(instaUrl);
                      viewModel.launchURL(uri);
                    },
                    child: Tooltip(
                      textStyle: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      preferBelow: false,
                      decoration: const BoxDecoration(
                        color: selectColor,
                      ),
                      message: 'Instagram',
                      verticalOffset: 20,
                      height: 25,
                      child: FaIcon(
                        FontAwesomeIcons.instagram,
                        color: color,
                        size: 18,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 40,
              ),
              OnHoverDetect(
                builder: (isHovered) {
                  final color = (isHovered) ? selectColor : fontColorGrey;
                  return InkWell(
                    onTap: () {
                      final uri = Uri.parse(blogUrl);
                      viewModel.launchURL(uri);
                    },
                    child: Tooltip(
                      textStyle: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      preferBelow: false,
                      decoration: const BoxDecoration(
                        color: selectColor,
                      ),
                      message: 'Blog',
                      verticalOffset: 20,
                      height: 25,
                      child: FaIcon(
                        FontAwesomeIcons.penToSquare,
                        color: color,
                        size: 18,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Copyright © 2020 InstaPay - All Rights Reserved.',
              style: GoogleFonts.notoSans(
                color: fontColorGrey,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
