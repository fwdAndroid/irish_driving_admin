import 'package:cloud_firestore/cloud_firestore.dart';

class TestRouteModel {
  String uuid;
  String testLocation;
  String centerEndLocation;
  String centerName;

  TestRouteModel({
    required this.uuid,
    required this.centerEndLocation,
    required this.testLocation,
    required this.centerName,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'centerName': centerName,
        "testLocation": testLocation,
        "centerEndLocation": centerEndLocation,
        'uuid': uuid,
      };

  ///
  static TestRouteModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return TestRouteModel(
      testLocation: snapshot['testLocation'],
      centerName: snapshot['centerName'],
      uuid: snapshot['uuid'],
      centerEndLocation: snapshot['centerEndLocation'],
    );
  }
}
