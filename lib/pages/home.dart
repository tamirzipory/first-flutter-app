import 'package:flutter/material.dart';
import 'loading.dart';

class Home extends StatefulWidget {
  //const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    final dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments is Map<dynamic, dynamic>) {
      data = data.isNotEmpty ? data : arguments;
    } else {
      // Handle the case where arguments is not of the expected type
      // or is null by initializing data with an empty map
      data = {};
    }
    print(data);
    String flagImg = '';
    flagImg = (data['isDaytime'] ?? false) ? 'day_img.jpg' : 'night_img.jpg';

    Color colorFont = (data['isDaytime'] ?? false) ? Colors.blue : Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: colorFont,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$flagImg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      if(result != null){
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      }
                    },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                      ),
                      label: Text(
                          'Edit your location',
                           style: TextStyle(
                             color: Colors.grey[400],
                           ),
                      ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'] ?? '',
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: Colors.blue[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:20.0),
                  Text(
                    data['time'] ?? '',
                    style: TextStyle(
                      color: colorFont,
                      fontSize: 60.0,
                      letterSpacing: 2.0,
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
