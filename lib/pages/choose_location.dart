import 'package:flutter/material.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  //const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'england.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'germany.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Spain', flag: 'spain.png'),
    WorldTime(url: 'Asia/Jerusalem', location: 'Israel', flag: 'israel.png')
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //Navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  // void getData() async {
  //   //simulate network request for a username
  //   String username = await Future.delayed(Duration(seconds:3), () {
  //     return 'Tamir';
  //   });
  //
  //   //simulate network request to get bio of the username
  //   String Grade = await Future.delayed(Duration(seconds:1), () {
  //     return '100';
  //   });
  //   print('$username with Grade $Grade');
  // }

  int counter = 0;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    //print('build of location is running');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    print(locations[index].location);
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                )
              ),
            );
          },
      ),
    );
  }
}
