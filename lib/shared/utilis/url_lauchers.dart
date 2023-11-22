import 'package:url_launcher/url_launcher.dart';

void openUrl() async {
  const url = 'https://www.google.com';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
