import 'package:flutter/material.dart';
import 'package:irish_driving_admin/widgets/colors.dart';

class UserAppointment extends StatefulWidget {
  const UserAppointment({super.key});

  @override
  State<UserAppointment> createState() => _UserAppointmentState();
}

class _UserAppointmentState extends State<UserAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: colorWhite),
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text(
          "Booking",
          style: TextStyle(color: colorWhite),
        ),
      ),
      body: const Center(
        child: Text(
          "Booking Request Will Show up when user request will make",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
