import 'package:beans_instapay/presentation/components/temp/notice_sample.dart';
import 'package:beans_instapay/ui/color.dart';
import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/constant.dart';

class DrawerWidget extends StatefulWidget {
  final int itemCount;

  const DrawerWidget({
    Key? key,
    required this.itemCount,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isCategoryClick = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          OnHoverDetect(
            builder: (isHovered) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                mouseCursor: SystemMouseCursors.click,
                title: const Text(
                  'HOME',
                  style: TextStyle(
                    color: secondaryGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          const Divider(
            height: 1,
            color: fontColorGrey,
          ),
          ListTile(
            onTap: () {
              setState(() {
                isCategoryClick = !isCategoryClick;
              });
            },
            mouseCursor: SystemMouseCursors.click,
            title: const Text(
              'CATEGORY',
              style: TextStyle(
                color: secondaryGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_down),
          ),
          const Divider(
            height: 1,
            color: fontColorGrey,
          ),
          if (isCategoryClick)
            Column(
              children: [
                ListTile(
                  tileColor: Colors.grey.withOpacity(0.5),
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    Navigator.pushNamed(context, '/detail/beans');
                  },
                  title: const Text(
                    'COFFEE BEANS',
                    style: TextStyle(
                      color: secondaryGrey,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: fontColorGrey,
                ),
                ListTile(
                  tileColor: Colors.grey.withOpacity(0.5),
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    Navigator.pushNamed(context, '/detail/dripbag');
                  },
                  title: const Text(
                    'FEDORA DRIPBAG',
                    style: TextStyle(
                      color: secondaryGrey,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: fontColorGrey,
                ),
                ListTile(
                  tileColor: Colors.grey.withOpacity(0.5),
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    Navigator.pushNamed(context, '/detail/stick');
                  },
                  title: const Text(
                    'STICK COFFEE',
                    style: TextStyle(
                      color: secondaryGrey,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: fontColorGrey,
                ),
              ],
            ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/cart');
            },
            mouseCursor: SystemMouseCursors.click,
            title: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text(
                    'CART',
                    style: TextStyle(
                      color: secondaryGrey,
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
                  child: Text('${widget.itemCount}'),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: fontColorGrey,
          ),
          ListTile(
            onTap: () {
              final uri = Uri.parse(homePageUrl);
              launchURL(uri);
            },
            mouseCursor: SystemMouseCursors.click,
            title: const Text(
              'INSTAPAY',
              style: TextStyle(
                color: secondaryGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: fontColorGrey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NoticeSample()),
              );
            },
            mouseCursor: SystemMouseCursors.click,
            title: const Text(
              'NOTICE',
              style: TextStyle(
                color: secondaryGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: fontColorGrey,
          ),
        ],
      ),
    );
  }

  void launchURL(Uri query) async {
    if (!await launchUrl(query)) throw 'Could not launch $query';
  }
}
