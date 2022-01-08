import 'package:flutter/material.dart';
import 'package:shrink/screens/global_component/app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:shrink/screens/product_homepage/components/product_side_scroll_list.dart';
import 'package:shrink/screens/product_homepage/components/promos_side_scroll_list.dart';
import 'package:shrink/screens/product_homepage/components/title_widget.dart';
import 'package:shrink/variables/globalVar.dart';

class ProductHomepage extends StatelessWidget {
  // const ProductHomepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: globalAppBar(context),
      body: SlidingUpPanel(
        maxHeight: ScreenSize.height * 1,
        minHeight: ScreenSize.height * 0.63,
        isDraggable: false,
        panelBuilder: (homeScrollController) => buildSlidePanel(
          homeScrollController: homeScrollController,
          context: context,
        ),
        body: Stack(
          children: [
            Container(
              height: ScreenSize.height * 0.42,
              width: ScreenSize.width * 1,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset('assets/images/doctor_one.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildSlidePanel(
    {@required ScrollController homeScrollController, BuildContext context}) {
  return Container(
    color: Color.fromARGB(255, 223, 237, 251),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleWidget(context, "PROMO", "promo"),
        Container(
          height: 190,
          child: PromoSideScrollList(),
        ),
        titleWidget(
          context,
          "MARKETPLACE",
          "marketplace",
        ),
        Container(
          height: 190.0,
          child: ProductSideScrollList(),
        ),
      ],
    ),
  );
}
