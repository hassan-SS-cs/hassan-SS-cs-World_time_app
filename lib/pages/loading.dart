import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
//   void getTime() async {
//   //   Response response = await get(
//   //     Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
//   //   );
//   //  Map data =  jsonDecode(response.body);
//   //  print(data);
//   //  print(data['title']);
//   //==============================

//   //make the request
//   Response response = await get(Uri.parse("https://time.now/developer/api/timezone/Europe/London"));
//   Map data = jsonDecode(response.body);
//  // print(data);

//  //get properties from data
//  String dateTime = data['datetime'];
//   String offset = data['utc_offset'].substring(1,3);
//   //print(dateTime);
//   //print(offset);

//   //create DateTime Object
//   DateTime now = DateTime.parse(dateTime);
//  now = now.add(Duration(hours: int.parse(offset) ));
//   print(now);
//   }

void setupWorldTime()async {

WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin',);
await instance.getTime();
Navigator.pushReplacementNamed(context, '/home',arguments: {
  'location': instance.location, 
  'flag':  instance.flag,
  'time': instance.time,
  'isDaytime': instance.isDaytime,
});

}

  @override
  void initState() {
    super.initState();
   setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child:SpinKitPouringHourGlassRefined(
  color: Colors.white,
  size: 100.0,
),
      )
    );
  }
}