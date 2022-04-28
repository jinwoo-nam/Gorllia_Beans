import 'package:beans_instapay/ui/color.dart';
import 'package:flutter/material.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerBackgroundColor,
      child: Text('1'),
      height: 100,
    );
  }
}
