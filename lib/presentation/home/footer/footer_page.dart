import 'package:beans_instapay/ui/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(
                FontAwesomeIcons.facebookF,
                color: fontColorGrey,
                size: 16,
              ),
              SizedBox(
                width: 40,
              ),
              FaIcon(
                FontAwesomeIcons.instagram,
                color: fontColorGrey,
                size: 16,
              ),
              SizedBox(
                width: 40,
              ),
              FaIcon(
                FontAwesomeIcons.penToSquare,
                color: fontColorGrey,
                size: 16,
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
