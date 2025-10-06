import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/setting_controller/location/my_location_controller.dart';
import 'package:ecommerce/core/constant/imageasset.dart';

class ListMylocationWidget extends GetView<MyLocationController> {
  const ListMylocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.getDatajson();
      },
      child: ListView(
        children: [
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: Get.width / 2,
              child: Image.asset(AppImageAsset.locationimage, fit: BoxFit.fill),
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            controller.mylocations.length,
            (i) => SizedBox(
              height: 110,
              child: InkWell(
                onTap: () {},
                child: Card(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings_backup_restore_outlined,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.deleteDatajson(
                                  controller.mylocations[i].locationId!,
                                );
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${controller.mylocations[i].namelocation}"),
                            Text("${controller.mylocations[i].city}"),
                            Text("${controller.mylocations[i].street}"),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          AppImageAsset.iconlocation,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
