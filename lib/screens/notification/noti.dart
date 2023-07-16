import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/mywidget.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: colorWhite),
          backgroundColor: mainColor,
          title: const Text(
            "Notifications",
            style: TextStyle(color: colorWhite),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("appointment")
                    .where("status", isEqualTo: "start")
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];

                        return Card(
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Test Center Name:",
                                  style: TextStyle(
                                      color: colorBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(documentSnapshot['centerName']),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Test Center Location:",
                                  style: TextStyle(
                                      color: colorBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(documentSnapshot['centerLocation']),
                              ],
                            ),
                            trailing: TextButton(
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Appointment Detail'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              const Text(
                                                'Name',
                                                style: TextStyle(
                                                    color: colorBlack,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(documentSnapshot['name']),
                                              const Divider(),
                                              const Text(
                                                'Booking Date',
                                                style: TextStyle(
                                                    color: colorBlack,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(documentSnapshot['date']),
                                              const Divider(),
                                              const Text(
                                                'Driving Route',
                                                style: TextStyle(
                                                    color: colorBlack,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (builder) => MyWidget(
                                                                title: documentSnapshot[
                                                                    "centerName"],
                                                                url: documentSnapshot[
                                                                    'weblink'])));
                                                  },
                                                  child: Text(
                                                    documentSnapshot['weblink'],
                                                    style: TextStyle(
                                                        color: blueColor),
                                                  )),
                                              const Divider()
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text(
                                              'Close',
                                              style:
                                                  TextStyle(color: colorBlack),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  "View Detail",
                                  style: TextStyle(color: colorBlack),
                                )),
                          ),
                        );
                      });
                })));
  }
}
