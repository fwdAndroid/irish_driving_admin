import 'package:flutter/material.dart';
import 'package:irish_driving_admin/screens/tabs/current_appointment.dart';
import 'package:irish_driving_admin/screens/tabs/past_appointment.dart';
import 'package:irish_driving_admin/widgets/colors.dart';

class UserAppointment extends StatefulWidget {
  const UserAppointment({super.key});

  @override
  State<UserAppointment> createState() => _UserAppointmentState();
}

class _UserAppointmentState extends State<UserAppointment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Booking',
            style: TextStyle(
              color: colorBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: const TabBar(
            labelColor: mainColor,
            indicatorColor: mainColor,
            tabs: <Widget>[
              Tab(
                text: "Current Appointment",
              ),
              Tab(
                text: "Past Appointment",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[CurrentAppointment(), PastAppointment()],
        ),
      ),
    );
  }
}
