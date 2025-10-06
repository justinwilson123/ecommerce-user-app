import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/imageasset.dart';

class ViewStatusRequset extends StatelessWidget {
  final StatusRequst statusRequst;
  final double size;
  final double? height;
  const ViewStatusRequset({
    super.key,
    required this.statusRequst,
    required this.size,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: statusRequst == StatusRequst.loading
          ? Center(
              child: Lottie.asset(
                AppImageAsset.loading1Lottie,
                width: size,
                height: size,
              ),
            )
          : statusRequst == StatusRequst.offlinefailur
              ? Center(
                  child: Lottie.asset(
                    AppImageAsset.offline1Lottie,
                    width: size,
                    height: size,
                  ),
                )
              : statusRequst == StatusRequst.serverfailur
                  ? Center(
                      child: Lottie.asset(
                        AppImageAsset.serverfailureLottie,
                        width: size,
                        height: size,
                      ),
                    )
                  : statusRequst == StatusRequst.failure
                      ? const Center(
                          child: Text("failure"),
                        )
                      : statusRequst == StatusRequst.noData
                          ? Center(
                              child: Lottie.asset(
                                AppImageAsset.nodataLottie,
                                width: size,
                                height: size,
                              ),
                            )
                          : SizedBox.shrink(),
    );
  }
}
