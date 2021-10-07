import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytimeproject/model/common.dart';
import 'package:mytimeproject/model/model.dart';
import 'package:mytimeproject/screens/play/play_screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key ? key
  }): super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State < MainScreen > {
  List < bool > albumTap = [
    false, false, false
  ];

  @override
  initState() {
    super.initState();
    for (int i = 0; i < albumTap.length; i++) {
      albumTap[i] = false;
    }
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    List < CardInfo > musicAlbum = [
      CardInfo('assets/images/album1.png', 'Your Time', Alignment.bottomRight, 0),
      CardInfo('assets/images/album2.png', 'Blow your Mind', Alignment.topLeft, 1),
      CardInfo('assets/images/album3.png', 'Just Smile', Alignment.center, 3),
    ];

    List<TrendCard> trendCard = [
      TrendCard('assets/images/side1.png', "Favorite", Alignment.center),
      TrendCard('assets/images/side2.png', "Top 100 Songs", Alignment.topLeft),
      TrendCard('assets/images/side3.png', "Best Music", Alignment.center),
    ];

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: defaultInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(size),
                itemHead(title: "Playlist💖"),
                Container(
                  margin: upInsets,
                  height: size.height * .35,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: musicAlbum.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (albumTap[index]) {
                              albumTap[index] = false;
                            } else {
                              albumTap[index] = true;
                            }
                          });
                        },
                        child: albumTap[index] ? Stack(
                          children: [
                            buildAlbumCard(size, musicAlbum, index),
                            Container(
                              margin: sideInsets,
                              height: size.height * .4,
                              width: size.width * .75,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.8),
                                borderRadius: BorderRadius.circular(55)
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                                    child: Column(
                                      children: [
                                        Text(
                                          musicAlbum[index].title,
                                          style: headTextStyle,
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            bizContainer(
                                              size,
                                              Icon(
                                                CommunityMaterialIcons.share,
                                                color: Colors.white,
                                              ),
                                              "Share",
                                              false
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(
                                                  builder : (context) => PlayScreen(
                                                    currentMusic: musicAlbum[index],
                                                  )
                                                ));
                                              },
                                              child: bizContainer(
                                                size,
                                                Icon(
                                                  CommunityMaterialIcons.play,
                                                  color: Colors.white,size: 50
                                                ),
                                                "Play",
                                                true
                                              ),
                                            ),
                                            bizContainer(
                                              size,
                                              Icon(
                                                CommunityMaterialIcons.inbox,
                                                color: Colors.white,
                                              ),
                                              "Save",
                                              false
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                )
                              )
                            )
                          ]
                        ) : buildAlbumCard(size, musicAlbum, index));
                    },
                  )
                ),
                SizedBox(height : 20),
                Divider(
                  height: 2,
                  color: Colors.grey[200],
                ),
                itemHead(title : "Trend & Chart🔥"),
                Container(
                  margin: itemUpInsets,
                  height : size.height * .15,
                  width : double.infinity,
                  child : ListView.builder(
                    itemCount: trendCard.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index){
                      return Container(
                        height : size.height * .15,
                        width : size.width * .8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image : AssetImage(
                              trendCard[index].imgSrc,
                            )
                          )
                        ),
                        child: Padding(
                          padding: trendCard[index].alignment == Alignment.topLeft ?
                            EdgeInsets.symmetric(horizontal:30, vertical: 15) : EdgeInsets.only(),
                          child : Align(
                            alignment: trendCard[index].alignment,
                            child : Text(
                              trendCard[index].title,
                              style : headTextStyle.copyWith(fontSize: 40)
                            )
                          )
                        ),
                      );
                    },
                  )
                ),
                SizedBox(
                  height :20,
                ),
                Divider(
                  height : 2,
                  color: Colors.grey[200],
                ),
                Container(
                  margin: upInsets,
                  height : size.height * .08,
                  width : size.width * .8,
                  child : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Premium on MyTime',
                            style: defaultTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            "Membership : \$2.99/month",
                            style: defaultTextStyle.copyWith(fontSize: 11, color: Colors.grey[400]),
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon : Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20)
                      )
                    ],
                  )
                ),
                Container(
                  margin: upInsets,
                  child : Center(
                    child : Text(
                      "MyTime copyright",
                      style : defaultTextStyle
                    )
                  )
                )
              ],
            ),
          )
    );
  }

  Column bizContainer(Size size, Icon icon, String title, bool isMainIcon) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15),
          height: isMainIcon ? size.height * .08 : size.height * .075,
          width: isMainIcon ? size.width * .2 : size.width * .1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.white),
          ),
          child: Center(
            child: icon
          )
        ),
        Text(
          title,
          style: defaultTextStyle.copyWith(fontSize: isMainIcon ? 25 : 20),
        )
      ],
    );
  }

  Container buildAlbumCard(Size size, List < CardInfo > musicAlbum, int index) {
    return Container(
      margin: sideInsets,
      height: size.height * .4,
      width: size.width * .75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(55),
          bottomLeft: Radius.circular(55),
          bottomRight: Radius.circular(55),
        ),
        image: DecorationImage(
          image: AssetImage(
            musicAlbum[index].imgSrc
          ),
          fit: BoxFit.cover,
        )
      ),
      child: Padding(
        padding: musicAlbum[index].position != 2 ?
        EdgeInsets.only(
          bottom: 15, right: 15,
          left: musicAlbum[index].position == 1 ? 15 : 0,
          top: musicAlbum[index].position == 1 ? 15 : 0,
        ) : EdgeInsets.only(),
        child: Align(
          alignment: musicAlbum[index].alignment,
          child: Text(
            musicAlbum[index].title,
            style: headTextStyle.copyWith(fontSize: musicAlbum[index].position == 2 ? 50 : 35)
          )
        )
      )
    );
  }

  Align buildAppBar(Size size) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height * .08,
        width: size.width * .8,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 2, color: Colors.white)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 65),
                    child: TextFormField(
                      style: defaultTextStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.vidaloka(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(.2)
                          )
                        ),
                        hintText: "Search Your Music..."
                      ),
                    )
                )
              )
            ),
            Container(
              width: size.width * .14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple,
                border: Border.all(width: 2, color: Colors.yellow)
              ),
              child: Center(
                child: Icon(
                  CommunityMaterialIcons.face,
                  color: Colors.grey[400],
                )
              )
            )
          ],
        ),
      ),
    );
  }
}