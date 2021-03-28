import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class Gallery extends StatefulWidget {

  @override

  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<Gallery> {

  static List<String> _images = ["im1.jpg","im2.jpg","im3.jpg","im4.jpg","im5.jpg","im6.jpg","im7.jpg","im8.jpg","im9.jpg","im10.jpg","im10.png"];
  List<String> _title = ["Title","Title im2.jpg","Title im3.jpg","Title im4.jpg","Title im5.jpg","Title im5.jpg","Title im5.jpg","Title im5.jpg","Title im5.jpg","Title im5.jpg","Title im5.jpg","Title im5.jpg"];
  List<String> _description = ["im1.jpg","im2.jpg","im3.jpg","im4.jpg","im5.jpg","im5.jpg","im5.jpg","im5.jpg","im5.jpg","im5.jpg","im5.jpg","im5.jpg"];
  int x = 0;

  Widget _image = Image.asset("assets/${_images[0]}",height: 100,width: 100,);

  Widget _myAnimatedWidget = FirstWidget();

  var selectedItem = null;


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(

        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: HexColor('#0f0f0f'),
            elevation: 6,
            title: Text('Gallery'),
          ),
          backgroundColor: HexColor('#282c35'),
          body:
          Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 4000),
                //Enable this for ScaleTransition
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    child: child,
                    turns: animation,);
                },
                //Enable this for RotationTransition
                // transitionBuilder: (Widget child, Animation<double> animation) {
                //   return RotationTransition(
                //     child: child,
                //     turns: animation,
                //   );
                // },

                child:  Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 450,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            image: DecorationImage(
                                image: AssetImage(_images[x]),
                                fit: BoxFit.fill
                            ),
                          ),
                        ),
                      ),
                      Container(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 35,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(left: 24,top: 5,bottom: 5,right: 24),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      _title[x],style: TextStyle(
                                      fontFamily: 'IndieFlower',
                                      fontSize: 20,color: Colors.white,
                                    ),),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(left: 12,top: 0,bottom: 0,right: 12),
                decoration: BoxDecoration(
                ),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Hero(
                      tag: 'image$index',
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            x = index;
                            _image = Image.asset("${_images[x]}");

                            for(var item in _images){
                              if(item == _images[index]){
                                selectedItem = Border.all(color: Colors.blueGrey,style: BorderStyle.solid,width: 3);
                              }
                              else{
                                selectedItem = Border.all(color: Colors.blueGrey,style: BorderStyle.solid,width: 3);
                              }
                            }
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: selectedItem,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(_images[index]),
                              fit: BoxFit.cover,


                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          image: DecorationImage(
            image: AssetImage("_image"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


