import 'package:curved_drawer/curved_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcs/AboutUs.dart';
import 'package:tcs/Alumni.dart';
import 'package:tcs/Gallery.dart';
import 'package:tcs/Drawer.dart';
import 'package:tcs/Sample.dart';
import 'package:hexcolor/hexcolor.dart';

var GlobalContext;


class MyApp extends StatelessWidget {

  final GlobalKey<ScaffoldState> _drawerOpenKey = new GlobalKey<ScaffoldState>();
  int x=1;
  @override
  Widget build(BuildContext context) {
    GlobalContext=context;
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        key: _drawerOpenKey,
        backgroundColor: HexColor('#282c35'),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("fblogo.jpg"),
                    fit: BoxFit.cover,
                  ),

                ),
                child: Row(
                    children: <Widget> [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 72, bottom: 94,top: 13),
                        child:Text('Menu Bar',style: TextStyle(
                          fontSize: 28,fontStyle: FontStyle.italic,color: Colors.black, fontWeight: FontWeight.bold,
                        ),textAlign: TextAlign.center,),
                      ),

                    ]
                ),
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(GlobalContext);
                },

              ),

              ListTile(
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(GlobalContext);
                },
              ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  Navigator.pop(GlobalContext);
                },
              ),

              ListTile(
                title: Text('Help'),
                onTap: () {
                  Navigator.pop(GlobalContext);
                },
              ),

              ListTile(
                  contentPadding: EdgeInsets.only(left:16,top: 170),
                  title: Text('Developed By Tech Team'),
                  subtitle: Text('version 1.1.011'),
                  onTap: null
              ),
            ],
          ),
        ),

        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              pinned: true,
              expandedHeight: 400,
              leading: IconButton(
                icon: Icon(Icons.menu,color: Colors.white,),
                onPressed: () {
                  _drawerOpenKey.currentState.openDrawer();
                },
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: Text(''),
              ),
              title: Text('TCS App',style: TextStyle(fontSize: 24),),
              actions: <Widget>[
                NamedIcon(
                  text: 'Notifications',
                  iconData: Icons.notifications,
                  notificationCount: 5,
                  onTap: (){
                  },
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(7000,1600),
                ),
              ),
            ),
            SliverGrid.count(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                      bottom: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: Colors.white,
                      icon: Icon(Icons.school),
                      splashColor: Colors.blueGrey,
                      onPressed: (){},
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Courses",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: Colors.white,
                    ),),

                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                      bottom: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: Colors.white,
                      icon: Icon(Icons.assignment_turned_in),
                      splashColor: Colors.blueGrey,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => Sample()),
                        );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Registration",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: Colors.white,
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                      bottom: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: Colors.white,
                      icon: Icon(Icons.image),
                      splashColor: Colors.grey,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => Gallery()),
                        );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Gallery",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: Colors.white,
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                      bottom: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: Colors.white,
                      icon: Icon(Icons.business),
                      splashColor: Colors.blueGrey,
                      onPressed: (){},
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Placement",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: Colors.white,
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                      bottom: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: Colors.white,
                      icon: Icon(Icons.people),
                      splashColor: Colors.blueGrey,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => Alumni()),
                        );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Alumni",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: Colors.white,
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                      bottom: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: Colors.white,
                      icon: Icon(Icons.code),
                      splashColor: Colors.blueGrey,
                      onPressed: (){},
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Developers",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: Colors.white,
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                      bottom: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: Colors.white,
                      icon: Icon(Icons.perm_identity),
                      splashColor: Colors.blueGrey,
                      onPressed: (){},
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Members",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: Colors.white,
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                      bottom: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: Colors.white,
                      icon: Icon(Icons.filter_none),
                      splashColor: Colors.blueGrey,
                      onPressed: (){},
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Test Series",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: Colors.white,
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                      bottom: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: Colors.white,
                      icon: Icon(Icons.personal_video),
                      splashColor: Colors.blueGrey,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => AboutUs()),
                        );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("About Us",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: Colors.white,
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                      bottom: BorderSide(
                        color: Colors.white,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: Colors.white,
                      icon: Icon(Icons.format_align_justify),
                      splashColor: Colors.blueGrey,
                      onPressed: (){},
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Feedback",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: Colors.white,
                    ),),
                  ),
                ),

              ],
            ),
          ],
        ),


      ),
    ) ;
  }
}


