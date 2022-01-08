import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shrink/screens/global_component/blue_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shrink/api/order_manager.dart';

import 'package:shrink/utils/error_handlers.dart';

//import 'dart:io';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => new _PaymentState();
}

class _PaymentState extends State<Payment> {
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalBlueAppbar(context, "Payment"),
      body: Container(
        padding: EdgeInsets.all(5),
        child: WebView(
          initialUrl: initialURL,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (webViewController) =>
              _webViewController = webViewController,
          onPageFinished: (String url) {
            if (url == initialURL) {
              redirectToStripe(_webViewController);
            }
          },
          navigationDelegate: (NavigationRequest request) async {
            if (request.url.contains('?cart_id=cart_id?session_id=')) {
              await getSuccessPayment(context);
              Navigator.of(context).pop();
              Navigator.of(context).popAndPushNamed('/successPayment');
            } else {
              errorDialog(context, 'Payment not successful');
              Navigator.of(context).pop('cancel');
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }

  String get initialURL =>
      'data:text/html;base64,${base64Encode(Utf8Encoder().convert(kStripeHtmlPage))}';
}

const kStripeHtmlPage = '''
<!DOCTYPE html>
<html>
<script src="https://js.stripe.com/v3/"></script>
<head><title>Stripe checkout</title></head>
<body>
</body>
</html>
''';
