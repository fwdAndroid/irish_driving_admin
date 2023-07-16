import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:irish_driving_admin/widgets/colors.dart';

class SubscribedUsers extends StatefulWidget {
  const SubscribedUsers({super.key});

  @override
  State<SubscribedUsers> createState() => _SubscribedUsersState();
}

class _SubscribedUsersState extends State<SubscribedUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: colorWhite),
        backgroundColor: mainColor,
        title: const Text(
          "Subscribed Users",
          style: TextStyle(color: colorWhite),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("appointment")
                  .where("payment", isEqualTo: "paid")
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
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
                                "Name:",
                                style: TextStyle(
                                    color: colorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(documentSnapshot['name']),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Amount",
                                style: TextStyle(
                                    color: colorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(documentSnapshot['amount'].toString()),
                            ],
                          ),
                        ),
                      );
                    });
              })),
    );
  }
}
