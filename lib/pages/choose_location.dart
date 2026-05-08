import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // void getData() async{
  //   //simulate network request for a username 
  //   String username = await Future.delayed(Duration(seconds: 3),(){
  //       return ('hassan');
  //   }
  //   );
  //  String bio= await Future.delayed(Duration(seconds: 2),(){
  //       return('hassan is hassan');
  //   }
  //   );
  //   print('$username - $bio');
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   print('initstate');
  //   getData();
  // }
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index)async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen with the needed data 
    Navigator.pop(context, {
  'location': instance.location, 
  'flag':  instance.flag,
  'time': instance.time,
  'isDaytime': instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
        print('build init state');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location', style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                    updateTime(index) ;                 
                    },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },

        ),
    );
  }
}