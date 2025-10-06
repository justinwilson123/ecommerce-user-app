import 'package:flutter/widgets.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerce/core/constant/imageasset.dart';

class ViewHandLingData extends StatelessWidget {
  final StatusRequst statusRequst;
  final Widget widget;
  const ViewHandLingData({
    super.key,
    required this.statusRequst,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequst == StatusRequst.loading
        ? Center(
            child: Lottie.asset(
              AppImageAsset.loading1Lottie,
            ),
          )
        : statusRequst == StatusRequst.offlinefailur
            ? Center(
                child: Lottie.asset(
                  AppImageAsset.offline1Lottie,
                ),
              )
            : statusRequst == StatusRequst.serverfailur
                ? Center(
                    child: Lottie.asset(
                      AppImageAsset.serverfailureLottie,
                    ),
                  )
                : statusRequst == StatusRequst.failure
                    ? const Center(
                        child: Text("failure"),
                      )
                    : statusRequst == StatusRequst.noData
                        ? Center(
                            child: Lottie.asset(AppImageAsset.nodataLottie),
                          )
                        : widget;
  }
}
