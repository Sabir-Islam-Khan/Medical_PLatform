import 'package:flutter/material.dart';
import 'package:shrink/screens/landing_page/landing_page.dart';

popUpDialog(String titleMsg, String bodyMsg, BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(titleMsg),
      content: Text(bodyMsg),
      actions: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingPage(
                      status: 200,
                    ),
                  ),
                );
              },
              child: const Text('Okay'),
            )
          ],
        )
      ],
    ),
  );
}
