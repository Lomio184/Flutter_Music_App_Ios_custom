import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:mytimeproject/model/common.dart';
import 'package:mytimeproject/screens/Main/main_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screen_set = [
    MainScreen(),
    Scaffold(body: Container(color: Colors.red,child: Center(child: Text("Not Implemented")))),
    Scaffold(body: Container(color: Colors.blue,child: Center(child: Text("Not Implemented")))),
  ];

  _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body : SafeArea(
        child : Stack(
          children: [
            screen_set[currentIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child : buildBottomNavBar(size)
            )
          ],
        )
      )
    );
  }

  Container buildBottomNavBar(Size size) {
    return Container(
              height : size.height * .09,
              width : double.infinity,
              margin: defaultInsets,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child : BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: _onTap,
                type : BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.grey[700],
                unselectedItemColor: Colors.grey[400],
                elevation: 0,
                items: [
                  BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.home), title : Text('Home', style : bottomTextStyle)),
                  BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.music_box_multiple), title : Text('Box', style : bottomTextStyle)),
                  BottomNavigationBarItem(icon: Icon(Icons.person), title : Text('Profile', style : bottomTextStyle)),
                ],
              )
            );
  }
}