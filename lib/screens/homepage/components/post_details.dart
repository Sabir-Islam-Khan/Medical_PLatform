// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shrink/api/favourites_manager.dart';
import 'package:shrink/screens/global_component/app_bar.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';

class PostDetails extends StatefulWidget {
  // const PostDetails({ Key? key }) : super(key: key);
  final String name;
  final String time;
  final String imgUrl;
  final String body;
  final int id;
  bool isLiked;
  final String authorPic;
  final String title;
  PostDetails({
    @required this.name,
    @required this.time,
    @required this.imgUrl,
    @required this.body,
    @required this.id,
    @required this.isLiked,
    @required this.authorPic,
    @required this.title,
  });
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColor_12LightGrey,
      appBar: globalAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: ScreenSize.width * 1,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenSize.width * 0.03,
                      ),
                      ClipOval(
                        child: Container(
                          height: 45.0,
                          width: 45.0,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network("$webTemp${widget.authorPic}"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenSize.width * 0.02,
                      ),
                      Container(
                        height: 50.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              "${widget.name}",
                              style: TextStyle(
                                fontSize: ScreenSize.height * 0.022,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${widget.time.characters.take(10)}",
                              style: TextStyle(
                                fontSize: ScreenSize.height * 0.019,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.02,
                  ),
                  Container(
                    width: ScreenSize.width * 0.97,
                    height: ScreenSize.height * 0.25,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(widget.imgUrl),
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.isLiked == true
                          ? GestureDetector(
                              onTap: () {
                                print("Should unlike");
                                unlikePost(widget.id);
                                setState(
                                  () {
                                    widget.isLiked = !widget.isLiked;
                                  },
                                );
                              },
                              child: Icon(
                                Icons.star,
                                color: Colors.blue,
                                size: ScreenSize.height * 0.028,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                print("Should like");
                                likePost(widget.id);
                                setState(
                                  () {
                                    widget.isLiked = !widget.isLiked;
                                  },
                                );
                              },
                              child: Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: ScreenSize.height * 0.028,
                              ),
                            ),
                      SizedBox(
                        width: ScreenSize.width * 0.04,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenSize.width * 0.02,
                      right: ScreenSize.width * 0.02,
                    ),
                    child: Text(
                      widget.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: ScreenSize.height * 0.023,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenSize.width * 0.02,
                      right: ScreenSize.width * 0.02,
                    ),
                    child: Text(
                      widget.body,
                      style: TextStyle(
                        fontSize: ScreenSize.height * 0.021,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.02,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
