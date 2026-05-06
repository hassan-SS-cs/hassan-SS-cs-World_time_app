import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

String  location;  //location name for the ui
  String time = '';
 //the time in that location
String flag; //url to an assest flag icon
String url;   //location url for the api
bool? isDaytime;

 WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
Response response = await get(Uri.parse("https://time.now/developer/api/timezone/$url"));
  Map data = jsonDecode(response.body);
 // print(data);

 //get properties from data
 String dateTime = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);
  //print(dateTime);
  //print(offset);

  //create DateTime Object
  DateTime now = DateTime.parse(dateTime);
 now = now.add(Duration(hours: int.parse(offset) ));

 // set the time property
//  isDaytime = condition ? true : false
isDaytime = now.hour> 1 && now.hour < 12 ? true:false;
 time = DateFormat.jm().format(now);
    }
    catch(e){
      print('you have an error: $e');
      time = 'could not get time data';
    }
  
  }

}
