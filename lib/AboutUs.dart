import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';


class AboutUs extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://media.istockphoto.com/videos/small-business-start-up-team-briefing-with-notes-video-id1151520804',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#282c35'),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor('#0f0f0f'),
        elevation: 6,
        title: Text('About Us'),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              margin: EdgeInsets.fromLTRB(10,0,0,0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 150,

                    child: Stack(
                      children: <Widget>[

                        Container(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          height: 150,
                          width: 150,
                          child:  ClipPolygon(
                            sides: 3,
                            borderRadius: 4,
                            rotate: 20,
                            boxShadows: [PolygonBoxShadow(color: Colors.pink, elevation: 3),
                              PolygonBoxShadow(color: Colors.white, elevation: 3),],
                          ),
                        ),

                        Container(
                          height: 150,
                          width:150,
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),

                          child: ClipPolygon(
                            borderRadius: 8,
                            sides:3,

                            boxShadows: [PolygonBoxShadow(color: Colors.pink, elevation: 3),],
                            child: FutureBuilder(
                              future: _initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  // If the VideoPlayerController has finished initialization, use
                                  // the data it provides to limit the aspect ratio of the video.
                                  return AspectRatio(
                                    aspectRatio: _controller.value.size.width/_controller.value.size.height,

                                    // Use the VideoPlayer widget to display the video.
                                    child: VideoPlayer(_controller),
                                  );
                                } else {
                                  // If the VideoPlayerController is still initializing, show a
                                  // loading spinner.
                                  return Center(child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          right: 32,

                          child: FlatButton(

                            onPressed: () {
                              // Wrap the play or pause in a call to `setState`. This ensures the
                              // correct icon is shown.
                              setState(() {
                                // If the video is playing, pause it.
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  // If the video is paused, play it.
                                  _controller.play();
                                }
                              });
                            },
                            // Display the correct icon depending on the state of the player.
                            child: Icon(
                              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.pink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 35, 0, 0),
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: 200,
                    width: 200,
                    child: RichText(
                      text: TextSpan(
                        text: "",
                        style: TextStyle(color: Colors.purple),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            '''About ''',
                            style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14),
                          ),
                          TextSpan(
                            text:
                            '''Us
''',
                            style: TextStyle(color: Colors.pinkAccent,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14),
                          ),
                          TextSpan(
                            text: '''        ''',
                            style: TextStyle(color: Colors.pinkAccent,decoration: TextDecoration.underline,fontSize: 14,height: 0.7,decorationThickness: 5),
                          ),
                          TextSpan(
                            text:
                            '''
                          
                          ''',
                            style: TextStyle(color: Colors.pinkAccent,fontSize: 4,height: 1),
                          ),
                          TextSpan(
                            text:
                            '''
  
The primary purpose of an about us page is to inform the reader about the company and its operations. This is a straightforward goal that nearly all businesses.''',
                            style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 10),
                          ),

                        ],
                      ),
                    ),

                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  height: 200,
                  width: 230,
                  child: RichText(
                    text: TextSpan(
                      text: "",
                      style: TextStyle(color: Colors.purple),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                          '''Want to network with top digital
entrepeneurs ''',
                          style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14),
                        ),
                        TextSpan(
                          text:
                          '''while on the vacation
''',
                          style: TextStyle(color: Colors.pinkAccent,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14),
                        ),
                        TextSpan(
                          text: '''of a lifetime ?
''',
                          style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14),
                        ),
                        TextSpan(
                          text: '''            ''',
                          style: TextStyle(color: Colors.pinkAccent,decoration: TextDecoration.underline,fontSize: 14,height: 0.7,decorationThickness: 5),
                        ),
                        TextSpan(
                          text:
                          '''
                          
                          ''',
                          style: TextStyle(color: Colors.pinkAccent,fontSize: 4,height: 1),
                        ),
                        TextSpan(
                          text:
                          '''
  
Innovation and simplicity makes us happy, our goal is to remove any technical or financial barriers that can prevent business owners from making their own.''',
                          style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 10),
                        ),

                      ],
                    ),
                  ),

                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Image.asset('im2.png',width: 100,height: 160,),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 40,
              child: RichText(
                text: TextSpan(
                  text: "",
                  style: TextStyle(color: Colors.purple),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                      '''             Special ''',
                      style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14,),
                    ),
                    TextSpan(
                      text: '''Service
  ''',
                      style: TextStyle(color: Colors.pinkAccent,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14),
                    ),
                    TextSpan(
                      text: '''Communicate the story of your business.''',
                      style: TextStyle(color: Colors.white,fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(30,0,0,0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.home,size: 50,color: Colors.pinkAccent,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "",
                            children: <TextSpan>[
                              TextSpan(
                                text: '''Design/Creative''',
                                style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 10,height: 1),
                              ),
                              TextSpan(
                                text: '''
                                
  Performing hot restart''',
                                style: TextStyle(color: Colors.black,fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.local_car_wash,size: 50,color: Colors.white,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "",
                            children: <TextSpan>[
                              TextSpan(
                                text: '''Parking/Drive''',
                                style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 10,height: 1),
                              ),
                              TextSpan(
                                text: '''
                                
  Restarted application in 2 sec''',
                                style: TextStyle(color: Colors.white,fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue,Colors.pink],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15,0,0,0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.ac_unit,size: 50,color: Colors.pinkAccent,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "",
                            children: <TextSpan>[
                              TextSpan(
                                text: '''Snow/Winters''',
                                style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 10,height: 1),
                              ),
                              TextSpan(
                                text: '''
                                
  Performing hot restart''',
                                style: TextStyle(color: Colors.black,fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                  ),
                ],
              ),
            ),


            Row(
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Image.asset('im2.png',width: 100,height: 160,),
                  ),

                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  height: 200,
                  width: 230,
                  child: RichText(
                    text: TextSpan(
                      text: "",
                      style: TextStyle(color: Colors.purple),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                          '''Want to network with top digital
  entrepeneurs ''',
                          style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14),
                        ),
                        TextSpan(
                          text:
                          '''while on the vacation
  ''',
                          style: TextStyle(color: Colors.pinkAccent,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14),
                        ),
                        TextSpan(
                          text: '''of a lifetime ?
  ''',
                          style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14),
                        ),
                        TextSpan(
                          text: '''            ''',
                          style: TextStyle(color: Colors.pinkAccent,decoration: TextDecoration.underline,fontSize: 14,height: 0.7,decorationThickness: 5),
                        ),
                        TextSpan(
                          text:
                          '''
                          
                          ''',
                          style: TextStyle(color: Colors.pinkAccent,fontSize: 4,height: 1),
                        ),
                        TextSpan(
                          text:
                          '''
  
  Innovation and simplicity makes us happy, our goal is to remove any technical or financial barriers that can prevent business owners from making their own.''',
                          style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 10),
                        ),

                      ],
                    ),
                  ),

                ),
              ],
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              alignment: Alignment.topCenter,
              height: 40,
              child: RichText(
                text: TextSpan(
                  text: "",
                  style: TextStyle(color: Colors.purple),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                      '''             What ''',
                      style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14,),
                    ),
                    TextSpan(
                      text: '''Client Says
  ''',
                      style: TextStyle(color: Colors.pinkAccent,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14),
                    ),
                    TextSpan(
                      text: '''Syncing files to device Redmi Note 5 Pro''',
                      style: TextStyle(color: Colors.white,fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0,30),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(13.5,0,0,0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.pink,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('im3.jpg'),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "",
                            children: <TextSpan>[
                              TextSpan(
                                  text: '''

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.black87)
                              ),
                              TextSpan(
                                text: '''Selena Gomez''',
                                style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 10,height: 1),
                              ),
                              TextSpan(
                                  text: '''

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.black87)
                              ),
                              TextSpan(
                                text: '''
                                
Selena Marie Gomez is an American singer, songwriter, actress, and producer.''',
                                style: TextStyle(color: Colors.black,fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 150,
                    width: 115,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10,0,0,0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('im3.jpg'),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "",
                            children: <TextSpan>[
                              TextSpan(
                                  text: '''

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.black87)
                              ),
                              TextSpan(
                                text: '''Selena Gomez''',
                                style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 10,height: 1),
                              ),
                              TextSpan(
                                  text: '''

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.black87)
                              ),
                              TextSpan(
                                text: '''
                                
Selena Marie Gomez is an American singer, songwriter, actress, and producer.''',
                                style: TextStyle(color: Colors.white,fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 150,
                    width: 115,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue,Colors.pink],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10,0,0,0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.pink,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('im3.jpg'),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "",
                            children: <TextSpan>[
                              TextSpan(
                                  text: '''

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.black87)
                              ),
                              TextSpan(
                                text: '''Selena Gomez''',
                                style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 10,height: 1),
                              ),
                              TextSpan(
                                  text: '''

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.black87)
                              ),
                              TextSpan(
                                text: '''
                                
Selena Marie Gomez is an American singer, songwriter, actress, and producer.''',
                                style: TextStyle(color: Colors.black,fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 150,
                    width: 115,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),

                  ),
                ],
              ),
            ),



            Container(

              child: Stack(
                children: <Widget>[


                  Container(
                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                    margin: EdgeInsets.fromLTRB(0,0,0,0),
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                          colors: [Colors.pinkAccent,Colors.pink,Colors.pinkAccent]
                      ),

                    ),


                    child: ClipPath(
                      child: Container(
                        color: HexColor('#282c35'),
                      ),
                      clipper: BottomWaveClipper(),
                    ),

                  ),

                  Positioned(
                    top: 10,

                    child: Container(
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                              width: MediaQuery.of(context).size.width / 4,

                              child:  RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: "",
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '''
                                    

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),
                                    TextSpan(
                                      text: '''Tanviro''',
                                      style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 18,height: 1,),
                                    ),
                                    TextSpan(
                                        text: '''
                                     

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),
                                    TextSpan(
                                      text: '''
                                  Categories''',
                                      style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14,height: 1),
                                    ),
                                    TextSpan(
                                        text: '''


''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),
                                    TextSpan(
                                      text: '''
                                
First
Second
Third
Fourth
Fifth''',
                                      style: TextStyle(color: Colors.white,fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              width: MediaQuery.of(context).size.width / 4,
                              child:  RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: "",
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '''
                                    

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),
                                    TextSpan(
                                        text: '''
                                    


''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),
                                    TextSpan(
                                      text: '''
                                  Community''',
                                      style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14,height: 1),
                                    ),
                                    TextSpan(
                                        text: '''


''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),
                                    TextSpan(
                                      text: '''
                                
First
Second
Third
Fourth
Fifth''',
                                      style: TextStyle(color: Colors.white,fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              width: MediaQuery.of(context).size.width / 4,
                              child:  RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: "",
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '''
                                    

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),

                                    TextSpan(
                                        text: '''
                                    


''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),
                                    TextSpan(
                                      text: '''
                                  About''',
                                      style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14,height: 1),
                                    ),
                                    TextSpan(
                                        text: '''


''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),
                                    TextSpan(
                                      text: '''
                                
First
Second
Third
Fourth
Fifth''',
                                      style: TextStyle(color: Colors.white,fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              width: MediaQuery.of(context).size.width / 4,
                              child:  RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: "",
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '''
                                    

''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),

                                    TextSpan(
                                        text: '''


''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),
                                    TextSpan(
                                      text: '''
                                  Contact''',
                                      style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 14,height: 1),
                                    ),
                                    TextSpan(
                                        text: '''


''',                            style: TextStyle(fontSize:5,height: 0.5,color: Colors.white)
                                    ),
                                    TextSpan(
                                      text: '''
                                
First
Second
Third
Fourth
Fifth''',
                                      style: TextStyle(color: Colors.white,fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        )

                    ),
                  ),
                  Positioned(
                    top: 42,
                    right: 25,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Card(
                            child: Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 100,
                              child: TextField(
                                decoration: const InputDecoration(

                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Type Here',
                                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 17),
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 8,)
                                ),
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.lightBlueAccent,
                            child: InkWell(
                              onTap: (){

                              },
                              splashColor: Colors.black,
                              child: Container(

                                alignment: Alignment.center,
                                height: 25,
                                width: 50,
                                child: Text('Search',style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontSize: 12,fontWeight: FontWeight.bold,height: 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();


    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.43);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.33,
        size.width * 0.5, size.height * 0.38);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.44,
        size.width * 1.0, size.height * 0.4);
    path.lineTo(size.width, size.height - 20);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 200);

    var firstControlPoint = Offset(size.width / 4, size.height- 180);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 210);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 245);
    var secondEndPoint = Offset(size.width, size.height - 220);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 250);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
