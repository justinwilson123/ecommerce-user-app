import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/item_detail_controller.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class DescrItemWidget extends GetView<ItemDetailControllerImp> {
  const DescrItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.fade,
      "${translateFromSpl(controller.itemmodel!.itemsDescAr, controller.itemmodel!.itemsDescEn)}",
    );
  }
}
