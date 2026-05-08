import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  Map args = {};


  @override
  Widget build(BuildContext context) {
     args = args.isNotEmpty ? args: ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    print(args);



  //set background
  String bgImage = args['isDaytime'] == true ? 'day.png' :'night.png';
  Color bgColor = args['isDaytime'] == true ? const Color.fromARGB(255, 0, 109, 198) : Colors.indigo[700]!;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                FloatingActionButton.extended(
                  onPressed: () async {
                dynamic result= await Navigator.pushNamed(context, '/location');
                setState(() {
                  args = {
                    'time':result['time'],
                    'location': result['location'],
                    'isDaytime':result['isDaytime'],
                    'flag':result['flag']
                    
                  };
                });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                    ),
                  label: Text('Edit Location',style: TextStyle(color: Colors.white),),
                  backgroundColor: bgColor,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      args?['location'] ?? '',
                      style: TextStyle(fontSize: 20, letterSpacing: 2, color: Colors.white,
),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(args?['time'] ?? '',
                style: TextStyle(
                  fontSize: 66,
                  color: Colors.white,

          
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}