import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:irish_driving_admin/screens/add_routes/add_test_routes.dart';
import 'package:irish_driving_admin/screens/dashboard/main_screen.dart';
import 'package:irish_driving_admin/services/database.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/dialog.dart';
import 'package:irish_driving_admin/widgets/utils.dart';

class RoutesPage extends StatefulWidget {
  const RoutesPage({super.key});

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Test Routes",
            style: TextStyle(color: colorWhite),
          ),
        ),
        backgroundColor: colorWhite,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => const AddTestRoutes()));
          },
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("centers").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No Center Found Yet!"),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return StreamBuilder<Object>(
                    stream: FirebaseFirestore.instance
                        .collection("centers")
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final List<DocumentSnapshot> documents =
                          snapshot.data!.docs;
                      final Map<String, dynamic> data =
                          documents[index].data() as Map<String, dynamic>;
                      return Card(
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Test Center Start Location:",
                                style: TextStyle(
                                    color: colorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(data['testLocation']),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Test Center End Location:",
                                style: TextStyle(
                                    color: colorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(data['centerEndLocation']),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  barrierDismissible:
                                      false, // user must tap button!

                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialogs(
                                      title:
                                          "Delete Test Center \n\nAre you sure to delete it?",
                                      fl: [
                                        TextButton(
                                            onPressed: () async {
                                              print(data['uuid']);
                                              DataBaseMethods().deletePost(
                                                  data.remove('uuid'));

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (builder) =>
                                                          MainScreen()));

                                              showSnakBar(
                                                  "Test Center Delete Successfully",
                                                  context);
                                            },
                                            child: const Text(
                                              "Yes",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "No",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ))
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: redColor,
                            ),
                          ),
                        ),
                      );
                    });
              },
            );
          },
        ));
  }
}
