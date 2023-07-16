import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/mywidget.dart';

class PastAppointment extends StatefulWidget {
  const PastAppointment({super.key});

  @override
  State<PastAppointment> createState() => _PastAppointmentState();
}

class _PastAppointmentState extends State<PastAppointment> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("appointment").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No Current Appointment Completed Yet"),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return StreamBuilder<Object>(
                stream: FirebaseFirestore.instance
                    .collection("appointment")
                    .where("status", isEqualTo: "complete")
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  final Map<String, dynamic> data =
                      documents[index].data() as Map<String, dynamic>;
                  return Card(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Test Center Name:",
                            style: TextStyle(
                                color: colorBlack, fontWeight: FontWeight.bold),
                          ),
                          Text(data['centerName']),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Test Center Location:",
                            style: TextStyle(
                                color: colorBlack, fontWeight: FontWeight.bold),
                          ),
                          Text(data['centerLocation']),
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
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(data['name']),
                                        const Divider(),
                                        const Text(
                                          'Booking Date',
                                          style: TextStyle(
                                              color: colorBlack,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(data['date']),
                                        const Divider(),
                                        const Text(
                                          'Driving Route',
                                          style: TextStyle(
                                              color: colorBlack,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (builder) =>
                                                          MyWidget(
                                                              title: data[
                                                                  "centerName"],
                                                              url: data[
                                                                  'weblink'])));
                                            },
                                            child: Text(
                                              data['weblink'],
                                              style:
                                                  TextStyle(color: blueColor),
                                            )),
                                        const Divider()
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(color: colorBlack),
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
          },
        );
      },
    );
  }
}
