import 'package:flutter/material.dart';
import 'package:irish_driving_admin/widgets/colors.dart';

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
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Notifications",
            style: TextStyle(color: colorWhite),
          ),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return const Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/pic.png"),
                    ),
                    trailing: Text(
                      "View",
                      style: TextStyle(color: mainColor, fontSize: 15),
                    ),
                    title: Text(
                      "User Make the Order Request",
                      style: TextStyle(color: colorBlack, fontSize: 16),
                    ),
                  ),
                  Divider()
                ],
              );
            }),
        backgroundColor: colorWhite);
  }
}
