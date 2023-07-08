import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:irish_driving_admin/models/test_route_models.dart';
import 'package:uuid/uuid.dart';

class DataBaseMethods {
  final FirebaseFirestore _firebaseFirestones = FirebaseFirestore.instance;

  Future<String> addCenters(
    String centerName,
    String centerLocation,
  ) async {
    String res = "Some Error";
    try {
      String postId = Uuid().v1();
      TestRouteModel postModel = TestRouteModel(
        centerName: centerName,
        uuid: postId,
        testLocation: centerLocation,
      );

      ///Uploading Post To Firebase
      _firebaseFirestones
          .collection('centers')
          .doc(postId)
          .set(postModel.toJson());
      res = 'Successfully Add the Center';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
