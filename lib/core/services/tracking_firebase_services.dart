import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/functions/checkinternet.dart';

class TrackingFierbaseServices {
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  Future<Either<StatusRequst, Stream<Map>>> getLiveLocation({
    required String deliveryId,
  }) async {
    if (await checkInternet()) {
      try {
        return Right(
          _firebaseFireStore
              .collection("tracking")
              .doc(deliveryId)
              .snapshots()
              .map<Map>((snapshot) {
                return snapshot.data() as Map;
              }),
        );
      } catch (_) {
        return Left(StatusRequst.serverfailur);
      }
    } else {
      return Left(StatusRequst.offlinefailur);
    }
  }
}
