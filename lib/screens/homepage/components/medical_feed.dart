import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/medical_feed_provider.dart';
import 'package:shrink/screens/homepage/components/post_card.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';

class MedicalFeed extends StatelessWidget {
  //const MedicalFeed({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        Provider.of<MedicalPostObj>(context).getMedicalPosts;
    if (data == null) {
      data = {};
    }
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        shrinkWrap: true,
        //scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data['items'] == null ? 0 : data['items'].length,
        itemBuilder: (BuildContext context, int widgetIndex) {
          return PostCard(
            name: data['items'][widgetIndex]['author_name'],
            time: data['items'][widgetIndex]['created_on'],
            body: data['items'][widgetIndex]['body'],
            id: data['items'][widgetIndex]['id'],
            imgUrl:
                webTemp + data['items'][widgetIndex]['_links']['picto_file'],
            isLiked:
                favouritePostIdGlobal.contains(data['items'][widgetIndex]['id'])
                    ? true
                    : false,
            authorPic: data['items'][widgetIndex]["author_selfie"],
            title: data["items"][widgetIndex]["title"],
          );
        },
      ),
    );
  }
}
