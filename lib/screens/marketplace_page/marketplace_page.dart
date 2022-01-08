import 'package:flutter/material.dart';
import 'package:shrink/screens/global_component/app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:shrink/variables/globalVar.dart';

import 'components/product_grid.dart';

class MarketplaceSearchPage extends StatelessWidget {
  // const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: globalAppBar(context),
      backgroundColor: Color.fromARGB(255, 223, 236, 249),
      body: SlidingUpPanel(
        maxHeight: ScreenSize.height * 1,
        renderPanelSheet: false,
        minHeight: ScreenSize.height * 0.7,
        parallaxEnabled: true,
        parallaxOffset: 0.6,
        panelBuilder: (homeScrollController) => buildSlidePanel(
          homeScrollController: homeScrollController,
          context: context,
        ),
        body: Stack(
          children: [
            Container(
              height: ScreenSize.height * 0.5,
              width: ScreenSize.width * 1,
              color: Colors.white,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Opacity(
                  opacity: 0.35,
                  child: Image.asset('assets/images/doctor_two.png'),
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
  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 223, 237, 251),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 25.0,
              child: Container(
                height: ScreenSize.height * 0.06,
                width: ScreenSize.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey[600],
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 5.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search_outlined,
                          size: ScreenSize.height * 0.035,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 60.0,
                ),
                Center(
                  child: Container(
                    width: 55.0,
                    height: 2.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 1.5,
                ),
                Center(
                  child: Container(
                    width: 55.0,
                    height: 2.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: ScreenSize.height * 199,
                  child: ProductGrid(),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
