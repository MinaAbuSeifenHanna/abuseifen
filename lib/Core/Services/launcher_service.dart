import 'package:url_launcher/url_launcher.dart';

class LauncherService {
  static Future<void> makePhoneCall({required String phoneNumber}) async {
    if (await canLaunchUrl(Uri.parse("tel://+966$phoneNumber"))) {
      await launchUrl(
        Uri.parse("tel://+966$phoneNumber"),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  static Future<void> sendWhatsAppMessage({required String phoneNumber,required String message}) async {
    final whatsappUrl = 'https://wa.me/+966$phoneNumber?text=$message';

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(
        Uri.parse(whatsappUrl),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  static Future<void> openGoogleMap({required String googleUrl}) async {
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(
        Uri.parse(googleUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not open Google Maps';
    }
  }
}