import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectUsScreen extends StatelessWidget {
  const ConnectUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("78".tr),
        centerTitle: true,
        backgroundColor: AppColor.praimarycolor,
      ),
      body: Container(
        color: AppColor.backgroundappcolor,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:+963938662383"));
                  },
                  title: Text("82".tr),
                  trailing: const Icon(Icons.phone),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  onTap: () async {
                    await launchUrl(
                      Uri.parse("https://wa.me/qr/ZSHUI25ZBAKUA1"),
                    );
                  },
                  title: Text(
                    "83".tr,
                    style: const TextStyle(color: Colors.green),
                  ),
                  trailing: const Icon(Icons.sms_outlined, color: Colors.green),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse("https://t.me/Ah55668"));
                  },
                  title: Text(
                    "84".tr,
                    style: const TextStyle(color: Colors.blue),
                  ),
                  trailing: const Icon(Icons.telegram, color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
