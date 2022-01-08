import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final Map<String, dynamic> data;
  //const locationCard({ Key? key }) : super(key: key);
  LocationCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Dropoff",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          data['building'],
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            Text(
              data["street"],
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              ", " + data["block"],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Text(
              ", " + data["floor"],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              data["city"],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Text(
              ", " + data["state"],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              data["postal_code"],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Text(
              ", " + data["country"],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            )
          ],
        ),
      ],
    );
  }
}
