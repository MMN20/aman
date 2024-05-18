import 'package:aman/const.dart';
import 'package:flutter/material.dart';

class ReqStatusCard extends StatelessWidget {
  const ReqStatusCard(
      {super.key,
      required this.status,
      required this.onTap,
      required this.reqID,
      required this.details});
  final String status;
  final int reqID;
  final String details;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 17);
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: kPrimarycolor)),
        surfaceTintColor: Colors.indigo,
        margin: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(color: kPrimarycolor),
            gradient: LinearGradient(
              colors: [
                Colors.indigo.withOpacity(0.2),
                Colors.tealAccent.shade700.withOpacity(0.1),
              ],
            ),
          ),
          // height: 300,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الرقم: $reqID",
                  style: textStyle,
                ),

                //! here add the text of the status
                Text(
                  "الحالة: $status",
                  style: textStyle,
                ),

                Text(
                  "التفاصيل: $details",
                  style: textStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
