import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_tutorial/aboutUs.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter tutorial',
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/aboutUs': (context) => AboutUs(),
    },
  ));
}

class Home extends StatelessWidget {
  // This widget is the root of your application.
  // int _current = 0;
  final List imageList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter tutorial'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                initialPage: 0,
              ),
              items: imageList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            )
          ],
        )),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                title: Text('About Us'),
                onTap: () {
                  Navigator.pushNamed(context, '/aboutUs');
                },
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(child: Text('Add')),
      ),
    );
  }
}
