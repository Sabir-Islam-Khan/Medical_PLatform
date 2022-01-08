import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/display_providers.dart';
import 'package:shrink/utils/money_convert.dart';
import 'package:shrink/variables/globalVar.dart';

Widget productDetailWidget(
  BuildContext context,
  int cost,
  proID,
  itemIndex,
  String picURL,
  proName,
) {
  double price = MoneyConvert().centToDollar(cost);
  int _amount = Provider.of<AmountDisplay>(context).getDisplayNum;
  String description = Provider.of<DescriptionDisplay>(context).getDescription;

  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          proName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: ScreenSize.height * 0.005,
        ),
        Text(
          '\$ $price',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: ScreenSize.height * 0.02,
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(
          height: ScreenSize.height * 0.02,
        ),
        Text(
          "Quantity",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: ScreenSize.height * 0.02,
        ),
        Row(
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    return Color.fromRGBO(200, 200, 200, 1);
                  }),
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                onPressed: () =>
                    Provider.of<AmountDisplay>(context, listen: false)
                        .decrementAmount(),
                child: Text(
                  "-",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: ScreenSize.width * 0.05,
            ),
            Text(
              _amount.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: ScreenSize.width * 0.05,
            ),
            SizedBox(
              width: 25,
              height: 25,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      return Color.fromRGBO(200, 200, 200, 1);
                    },
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(0),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                onPressed: () =>
                    Provider.of<AmountDisplay>(context, listen: false)
                        .incrementAmount(),
                child: Text(
                  "+",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  r"$  ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  (cost / 100).toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  "  / pack",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: ScreenSize.height * 0.06,
        ),
      ],
    ),
  );
}
