import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:irish_driving_admin/widgets/colors.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: colorWhite),
          backgroundColor: mainColor,
          title: const Text(
            "Users",
            style: TextStyle(color: colorWhite),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("users").snapshots(),
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
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  documentSnapshot['photoURL'].toString()),
                            ),
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
                                  "Phone Number:",
                                  style: TextStyle(
                                      color: colorBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(documentSnapshot['phoneNumber']),
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
                                        title: const Text('Users Detail'),
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
                                                'Email',
                                                style: TextStyle(
                                                    color: colorBlack,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(documentSnapshot['email']),
                                              const Divider(),
                                              const Text(
                                                'Date of Birth',
                                                style: TextStyle(
                                                    color: colorBlack,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                documentSnapshot['dob'],
                                                style: TextStyle(
                                                    color: colorBlack),
                                              ),
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
