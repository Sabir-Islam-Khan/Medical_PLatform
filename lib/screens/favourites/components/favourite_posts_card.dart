// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink/api/favourites_manager.dart';
import 'package:shrink/screens/homepage/components/post_details.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';

class FavouritePostCard extends StatefulWidget {
  final String name;
  final String time;
  final String imgUrl;
  final String body;
  final int id;
  bool isLiked;
  final String authorPic;
  final String title;

  FavouritePostCard({
    @required this.name,
    @required this.time,
    @required this.imgUrl,
    @required this.body,
    @required this.id,
    @required this.isLiked,
    @required this.authorPic,
    @required this.title,
  });
  // const FavouritePostCard({ Key? key }) : super(key: key);

  @override
  _FavouritePostCardState createState() => _FavouritePostCardState();
}

class _FavouritePostCardState extends State<FavouritePostCard> {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(widget.time);
    String year = time.year.toString();
    String date = time.day.toString();
    int monthNumber = time.month;

    List months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    String monthName = months[monthNumber - 1];
    return widget.isLiked == true
        ? Column(
            children: [
              SizedBox(
                height: ScreenSize.height * 0.355,
                width: ScreenSize.width * 0.97,
                child: Card(
                  elevation: 0.0,
                  child: Column(
                    children: [
                      Container(
                        height: 08,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: ScreenSize.width * 0.02,
                          ),
                          ClipOval(
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.network(
                                    "$webTemp${widget.authorPic}"),
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
                                  height: 7.0,
                                ),
                                Text(
                                  "${widget.name}",
                                  style: TextStyle(
                                    fontSize: ScreenSize.height * 0.02,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "3 hrs",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                // Text(
                                //   "${widget.time.characters.take(10)}",
                                //   style: TextStyle(
                                //     fontSize: ScreenSize.height * 0.017,
                                //     fontWeight: FontWeight.w500,
                                //     color: Colors.grey,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
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
                                    size: ScreenSize.height * 0.025,
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
                                    size: ScreenSize.height * 0.025,
                                  ),
                                ),
                          SizedBox(
                            width: ScreenSize.width * 0.04,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetails(
                                    name: widget.name,
                                    time: widget.time,
                                    imgUrl: widget.imgUrl,
                                    body: widget.body,
                                    id: widget.id,
                                    isLiked: widget.isLiked,
                                    authorPic: widget.authorPic,
                                    title: widget.title),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: ScreenSize.height * 0.2,
                            width: ScreenSize.width * 1,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.network(widget.imgUrl),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Container(
                            width: ScreenSize.width * 0.8,
                            padding: EdgeInsets.only(
                              left: ScreenSize.width * 0.025,
                              right: ScreenSize.width * 0.02,
                            ),
                            child: Text(
                              "$date $monthName $year",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                fontSize: ScreenSize.height * 0.015,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(132, 132, 131, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize.width * 0.05,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: ScreenSize.width * 0.8,
                            padding: EdgeInsets.only(
                              left: ScreenSize.width * 0.025,
                              right: ScreenSize.width * 0.02,
                            ),
                            child: Text("${widget.title}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontSize: ScreenSize.height * 0.018,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          SizedBox(
                            width: ScreenSize.width * 0.05,
                          ),
                        ],
                      ),
                      Container(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          )
        : SizedBox();
  }
}
