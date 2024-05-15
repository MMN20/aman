import 'package:flutter/material.dart';

class ReqStatusCard extends StatelessWidget {
  const ReqStatusCard({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      surfaceTintColor: Colors.black,
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        height: 300,
        child: Center(
          child: Text(status),
        ),
      ),
    );
  }
}
