import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:mytimeproject/model/common.dart';
import 'package:mytimeproject/model/model.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({
    Key ? key,
    required this.currentMusic
  }): super(key: key);

  final CardInfo currentMusic;
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State < PlayScreen > {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: Icon(
                      Icons.arrow_back_ios_new, color: Colors.white,
                    )),
                    PopupMenuButton(
                      elevation: 0,
                      icon: Icon(CommunityMaterialIcons.menu_swap, color: Colors.white,size : 30),
                      itemBuilder: (context) => [
                        PopupMenuItem(child: Text(
                          'Share',
                          style: defaultTextStyle.copyWith(color: Colors.grey[700]),
                        )),
                        PopupMenuItem(child: Text(
                          'Add to PlayList',
                          style: defaultTextStyle.copyWith(color: Colors.grey[700]),
                        )),
                        PopupMenuItem(child: Text(
                          'Add to SaveBox',
                          style: defaultTextStyle.copyWith(color: Colors.grey[700]),
                        ))
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: upInsets,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height : size.height * .425,
                          width : size.width * .9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55),
                            image : DecorationImage(
                              image : AssetImage(widget.currentMusic.imgSrc),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: upInsets.copyWith(top: size.height * .05, left : 30, right :30),
                        child : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: (){},
                              icon: Icon(CommunityMaterialIcons.thumb_up, color: Colors.white,)
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.currentMusic.title,
                                  style : headTextStyle.copyWith(fontSize: 30)
                                ),
                                Text(
                                  "No CopyRight",
                                  style : defaultTextStyle
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon : Icon(CommunityMaterialIcons.thumb_down, color: Colors.white,)
                            )
                          ],
                        )
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: sideInsets.copyWith(top : 20),
                            height : size.height * .01,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[400]
                            ),
                          ),
                          Container(
                            margin: sideInsets.copyWith(top : 20),
                            height : size.height * .01,
                            width : size.width * .4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[900]
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: upInsets.copyWith(top:size.height*.015, left : 15,right:15),
                        child : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '01:57',
                              style: defaultTextStyle.copyWith(fontSize: 13, fontWeight: FontWeight.w200)
                            ),
                            Text(
                              '04:13',
                              style: defaultTextStyle.copyWith(fontSize: 13, fontWeight: FontWeight.w200)
                            ),
                          ],
                        )
                      ),
                      Padding(
                        padding: upInsets.copyWith(top: size.height * .001),
                        child : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon : Icon(CommunityMaterialIcons.shuffle,
                              color: Colors.white, size: 25
                              )
                            ),
                            IconButton(
                              onPressed: () {},
                              icon : Icon(CommunityMaterialIcons.skip_previous,
                              color: Colors.white, size: 35
                              )
                            ),
                            IconButton(
                              onPressed: () {},
                              icon : Icon(CommunityMaterialIcons.play,
                              color: Colors.white, size: 40
                              )
                            ),
                            IconButton(
                              onPressed: () {},
                              icon : Icon(CommunityMaterialIcons.skip_next,
                              color: Colors.white, size: 35
                              )
                            ),
                            IconButton(
                              onPressed: () {},
                              icon : Icon(CommunityMaterialIcons.repeat,
                              color: Colors.white, size: 25
                              )
                            )
                          ],
                        )
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: .16,
                minChildSize: .1,
                builder: (context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child : Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius : BorderRadius.only(
                          topLeft : Radius.circular(45),
                          topRight : Radius.circular(45),
                        )
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: upInsets,
                            height : size.height * .01,
                            width : size.width * .4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Colors.grey[700]
                            ),
                          ),
                          Container(
                            margin: upInsets,
                            height : size.height,
                            width : double.infinity,
                            child : ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, int index) {
                                return Container(
                                  height: size.height * .095,
                                  width : double.infinity,
                                  child: Padding(
                                    padding: defaultInsets.copyWith(top : size.height * .02),
                                    child : Row(
                                      children: [
                                        Container(
                                          margin : const EdgeInsets.only(right:20),
                                          width : size.width * .15,
                                          decoration: BoxDecoration(
                                            image : DecorationImage(
                                              image : AssetImage(
                                                widget.currentMusic.imgSrc,
                                              ),
                                              fit: BoxFit.cover,
                                            )
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.currentMusic.title,
                                              style : defaultTextStyle
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'No CopyRight  ',
                                                  style: defaultTextStyle.copyWith(
                                                    fontWeight:FontWeight.w200,
                                                    color: Colors.grey[500], fontSize:14
                                                  ),
                                                ),
                                                Text(
                                                  '04:13',
                                                  style: defaultTextStyle.copyWith(
                                                    fontWeight:FontWeight.w200,
                                                    color: Colors.grey[500], fontSize:14
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ),
                                );
                              },
                            )
                          )
                        ],
                      )
                    )
                  );
                },
              ),
            )
          ]
        )
      )
    );
  }
}