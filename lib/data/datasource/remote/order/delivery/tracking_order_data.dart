import 'package:ecommerce/core/services/tracking_firebase_services.dart';

class TrackingOrderData {
  TrackingFierbaseServices trackingServices = TrackingFierbaseServices();

  getTrackingOrder({required String deliveryId}) async {
    var response = await trackingServices.getLiveLocation(
      deliveryId: deliveryId,
    );
    return response.fold((l) => l, (r) => r);
  }
}
