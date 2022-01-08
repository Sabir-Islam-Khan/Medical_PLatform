import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/medical_feed_provider.dart';

import 'package:shrink/screens/favourite_clinics_page/favourite_clinics_page.dart';
import 'package:shrink/screens/favourite_product_page/favourite_products_page.dart';
import 'package:shrink/screens/favourites/components/favourite_clinic_scroll_list.dart';
import 'package:shrink/screens/favourites/components/favourite_posts_card.dart';
import 'package:shrink/screens/favourites/components/favourite_products_scroll_list.dart';
import 'package:shrink/screens/global_component/blue_appbar.dart';
import 'package:shrink/styles/colors.dart';

import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        Provider.of<MedicalPostObj>(context).getMedicalPosts;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 236, 249),
      appBar: globalBlueAppbar(context, "Favourites"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            // column for clinic scroll list
            favouriteClinicIdGlobal.isEmpty
                ? SizedBox()
                : Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: ScreenSize.width * 0.03,
                          ),
                          Text(
                            "Clinics",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FavouriteClinicPage(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  'See All   ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  '>>>',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: globalColor_10Orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize.width * 0.03,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 200.0,
                        child: FavouriteClinicScrollList(),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
            // column for product scroll list

            favouriteProductIdGlobal.isEmpty
                ? SizedBox()
                : Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: ScreenSize.width * 0.03,
                          ),
                          Text(
                            "Products",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FavouriteProductPage(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  'See All   ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  '>>>',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: globalColor_10Orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize.width * 0.03,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 200.0,
                        child: FavouriteProductScrollList(),
                      ),
                    ],
                  ),
            SizedBox(
              height: 10.0,
            ),
            // favourite posts
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data['items'].length,
              itemBuilder: (BuildContext context, int widgetIndex) {
                return FavouritePostCard(
                  name: data['items'][widgetIndex]['author_name'],
                  time: data['items'][widgetIndex]['created_on'],
                  body: data['items'][widgetIndex]['body'],
                  id: data['items'][widgetIndex]['id'],
                  imgUrl: webTemp +
                      data['items'][widgetIndex]['_links']['picto_file'],
                  isLiked: favouritePostIdGlobal
                          .contains(data['items'][widgetIndex]['id'])
                      ? true
                      : false,
                  authorPic: data['items'][widgetIndex]["author_selfie"],
                  title: data["items"][widgetIndex]["title"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
