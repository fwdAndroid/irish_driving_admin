import 'package:cloud_firestore/cloud_firestore.dart';

class TestRouteModel {
  String uuid;
  String testLocation;
  String centerName;

  TestRouteModel({
    required this.uuid,
    required this.testLocation,
    required this.centerName,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'centerName': centerName,
        "testLocation": testLocation,
        'uuid': uuid,
      };

  ///
  static TestRouteModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return TestRouteModel(
      testLocation: snapshot['testLocation'],
      centerName: snapshot['centerName'],
      uuid: snapshot['uuid'],
    );
  }
}
