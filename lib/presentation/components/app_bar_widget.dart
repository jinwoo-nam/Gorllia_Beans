import 'package:beans_instapay/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/color.dart';
import '../../ui/constant.dart';
import '../../ui/on_hover_detect.dart';

class AppBarWidget extends StatelessWidget {
  final int itemCount;
  final Function changeHoverState;
  final Function(String)? removeOverlay;

  const AppBarWidget({
    Key? key,
    required this.itemCount,
    required this.changeHoverState,
    this.removeOverlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double lastAppbarWidth =
        150 * ((MediaQuery.of(context).size.width - 1200) / 720);

    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {
          if (removeOverlay != null) {
            removeOverlay!('');
          }
          Navigator.pushNamed(context, '/');
        },
        child: const Image(
          image: AssetImage('img/GB_widelogo_brown.png'),
          fit: BoxFit.cover,
          width: 190,
        ),
      ),
      actions: [
        if (Responsive.isPage1(context) ||
            Responsive.isPage2(context) ||
            Responsive.isPage3(context))
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Builder(
                builder: (context) {
                  return Row(
                    children: [
                      OnHoverDetect(
                        builder: (isHovered) {
                          final color = isHovered ? selectColor : Colors.black;
                          return TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'CART',
                                    style: TextStyle(
                                      color: color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: secondaryGrey.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '$itemCount',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          if (removeOverlay != null) {
                            removeOverlay!('');
                          }
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        if (Responsive.isPage4(context) || Responsive.isPage5(context))
          Padding(
            padding: const EdgeInsets.only(right: 70.0),
            child: Row(
              children: [
                OnHoverDetect(
                  builder: (isHovered) {
                    final color = isHovered ? selectColor : Colors.black;
                    return TextButton(
                      onPressed: () {
                        if (removeOverlay != null) {
                          removeOverlay!('');
                        }
                        Navigator.pushNamed(context, '/');
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        'HOME',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 25,
                ),
                OnHoverDetect(
                  builder: (isHovered) {
                    final color = isHovered ? selectColor : Colors.black;
                    return TextButton(
                      onPressed: () {
                        changeHoverState();
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'CATEGORY',
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: color,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 25,
                ),
                OnHoverDetect(
                  builder: (isHovered) {
                    final color = isHovered ? selectColor : Colors.black;
                    return TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              'CART',
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: secondaryGrey.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '$itemCount',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 25,
                ),
                OnHoverDetect(
                  builder: (isHovered) {
                    final color = isHovered ? selectColor : Colors.black;
                    return TextButton(
                      onPressed: () {
                        final uri = Uri.parse(homePageUrl);
                        launchURL(uri);
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        'INSTAPAY',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                if (Responsive.isPage5(context))
                  SizedBox(
                    width: lastAppbarWidth,
                  ),
              ],
            ),
          ),
      ],
    );
  }

  void launchURL(Uri query) async {
    if (!await launchUrl(query)) throw 'Could not launch $query';
  }
}
