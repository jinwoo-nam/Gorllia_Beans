import 'package:url_launcher/url_launcher.dart';

void launchURL(String query) async {
  Uri uri = Uri.parse(query);
  if (!await launchUrl(uri)) throw 'Could not launch $query';
}