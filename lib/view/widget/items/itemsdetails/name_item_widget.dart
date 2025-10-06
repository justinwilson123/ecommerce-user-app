import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/item_detail_controller.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class NameItemWidget extends GetView<ItemDetailControllerImp> {
  const NameItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          translateFromSpl(
            controller.itemmodel!.itemsNameAr,
            controller.itemmodel!.itemsNameEn,
          ),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
