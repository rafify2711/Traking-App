import 'package:flutter/cupertino.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(BuildContext context, String? url) async {
  if (url != null) {
    final Uri newUrl = Uri.parse(url);
    if (await canLaunchUrl(newUrl)) {
      await launchUrl(newUrl);
    } else {
      showSnackBar(context, 'Cannot launch $url');
    }
  }
}
