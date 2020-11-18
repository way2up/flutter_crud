// Container(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: 400.0,
//                 initialPage: 0,
//               ),
//               items: userList.map((imgUrl) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                       ),
//                       child: Image.asset(
//                         imgUrl,
//                         fit: BoxFit.fill,
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             )
//           ],
//         )
//         ),

// class StackWidetSample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Over Image'),
//       ),
//       body: Center(
//         child: Stack(
//           children: <Widget>[
//             Container(
//               alignment: Alignment.center,
//               child: Image.network(
//                 'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
//                 height: 250,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                   'Show text here',
//                   style: TextStyle(
//                       color: Colors.pink,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22.0),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Container(
//   alignment: Alignment.bottomRight,
//   height: 50.0,
//   child: _uploadImage == null
//       ? Text("Image is not loaded")
//       : Image.file(_uploadImage),
// ),
