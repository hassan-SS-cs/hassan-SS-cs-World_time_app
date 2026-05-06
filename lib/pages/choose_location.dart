import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
        print('build init state');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location', style: TextStyle(color: Colors.white),),
      ),
      body: Text('Choose Location Screen'),
    );
  }
}