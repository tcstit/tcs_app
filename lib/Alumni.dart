import 'package:tcs/Alumni2019.dart';
import 'package:tcs/Alumni2020.dart';
import 'package:flutter/material.dart';


class Alumni extends StatefulWidget {
  @override
  _AlumniState createState() => _AlumniState();
}

class _AlumniState extends State<Alumni> {
  PageController pageController=PageController();
  int currentIndex=0;
  var currentTab = [
    Alumni2020(),
    Alumni2019()
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'ALUMNI',
          style: TextStyle(
            letterSpacing: 5,
            fontFamily:'CinzelDecorative',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: PageView(
        children: currentTab,
        controller: pageController,
        onPageChanged: (int index){
          setState(() {
            currentIndex=index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              title: Text("2020",),
              icon: new Icon(Icons.people),
            ),
            BottomNavigationBarItem(
              title: Text("2019"),
              icon: new Icon(
                Icons.people,
              ),
            ),
          ]
      ),
    );
  }
}