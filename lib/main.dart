import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Unsplash(),
    );
  }
}

class Unsplash extends StatefulWidget {
  @override
  _UnsplashState createState() => _UnsplashState();
}

class _UnsplashState extends State<Unsplash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.menu,size: 25.0,),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage("assets/images/1.png"),
                    ),
                  ],
                ),
                Container(
                  height: 150.0,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Unsplash",
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Beautiful, free photos.",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: 65.0,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      labelText: 'Search photos',
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(color: Colors.grey.shade50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(color: Colors.grey.shade50),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .6 -10.0,
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: pageList.length,
                      itemBuilder: (BuildContext context,int index)=>
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(pageList[index].imageUrl),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      staggeredTileBuilder: (int index)=>
                       StaggeredTile.count(2,index.isEven ? 3 : 1.5),
                       mainAxisSpacing: 15.0,
                       crossAxisSpacing: 20.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}