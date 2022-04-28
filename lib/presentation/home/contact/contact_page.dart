import 'package:beans_instapay/ui/color.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: contactBackgroundColor,
      child: Text('1'),
      height: MediaQuery.of(context).size.height,
    );
  }
}
