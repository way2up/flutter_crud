import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_tutorial/aboutUs.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

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

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  var _uploadImage;
  int userIndex = 0;

  bool showEditUser = false;
  bool showAddUser = false;
  final picker = ImagePicker();
  String userName = 'Text';
  String userImage = 'assets/images/1.jpg';

  List userList = [
    {
      'userName': 'Tom',
      'userImage': 'assets/images/1.jpg',
    },
    {
      'userName': 'Jone',
      'userImage': 'assets/images/2.jpg',
    },
    {
      'userName': 'Anna',
      'userImage': 'assets/images/3.jpg',
    },
    {
      'userName': 'Martin',
      'userImage': 'assets/images/4.jpg',
    },
  ];

// edit
  editUser() {
    setState(() {
      showEditUser = !showEditUser;
    });
  }

  Future getImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _uploadImage = File(image.path);
      userList[userIndex]['userImage'] = _uploadImage.path;
      print(_uploadImage.path);
    });
  }

  changeUserName(String str) {
    setState(() {
      userList[userIndex]['userName'] = str;
    });
  }

  // add
  addUser() {
    setState(() {
      showAddUser = !showAddUser;
    });
  }

  addobject() {
    Map<String, dynamic> object = {
      'userName': userName,
      'userImage': userImage,
    };
    setState(() {
      userList.add(object);
      userName = 'Text';
      userImage = 'assets/images/1.jpg';
    });
  }

  createUserName(String str) {
    setState(() {
      userName = str;
    });
  }

  Future createImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _uploadImage = File(image.path);
      userImage = _uploadImage.path;
    });
  }

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      userIndex = index;
      print(context);
      // reason = changeReason.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter tutorial 2'),
        centerTitle: true,
        // backgroundColor: Colors.blueAccFile _image;
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              initialPage: 0,
              onPageChanged: onPageChange,
            ),
            items: userList.map((user) {
              // print(user);
              return Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            user['userName'],
                            style: TextStyle(
                                color: Colors.indigo[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo[400],
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          alignment: Alignment.center,
                          child: Image.asset(
                            user['userImage'],
                            width: 200.0,
                            height: 150.0,
                            // fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                textColor: Colors.amber,
                onPressed: editUser,
                child: Text("Edit"),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.blue, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50)),
              ),
              FlatButton(
                textColor: Color(0xFF6200EE),
                onPressed: addUser,
                child: Text("Add"),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red[300],
                        width: 2,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50)),
              ),
              FlatButton(
                textColor: Colors.red,
                onPressed: () {
                  setState(() {
                    userList.removeAt(userIndex);
                  });
                },
                child: Text("Delete"),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.red[300],
                        width: 4,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ],
          ),
          if (showEditUser)
            Column(
              children: <Widget>[
                TextField(
                  decoration: new InputDecoration(hintText: "User name!"),
                  onSubmitted: changeUserName,
                ),
                FlatButton(
                  textColor: Colors.blue,
                  onPressed: getImage,
                  child: Text("Upload Image"),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.red,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ],
            ),
          if (showAddUser)
            Column(
              children: <Widget>[
                TextField(
                  decoration: new InputDecoration(hintText: "User name!"),
                  onSubmitted: createUserName,
                ),
                FlatButton(
                  textColor: Colors.blue,
                  onPressed: createImage,
                  child: Text("Upload Image"),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.red,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                ),
                FlatButton(
                  textColor: Colors.blue,
                  onPressed: addobject,
                  child: Text("Create"),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.red,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                ),
                Text(userImage),
              ],
            ),
        ],
      ),

      // sidebar
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: getImage,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.camera_alt),
      // ),
    );
  }
}
