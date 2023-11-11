import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String? time; //the time of that location
  String flag; //url to an asset flag icon
  String url; //the location url for api endpoints
  bool isDaytime = false; //True if it's day and false if it's night

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    String URL = 'https://worldtimeapi.org/api/timezone/$url';

    try{
      Response res = await get(Uri.parse(URL));
      Map data = jsonDecode(res.body);

      //get the date properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //Create DateTime object

      DateTime curr_time = DateTime.parse(datetime);
      curr_time.add(Duration(hours: int.parse(offset)));

      //set the time property
      time = DateFormat.jm().format(curr_time);
      isDaytime = curr_time.hour > 6 && curr_time.hour < 20? true : false;
    }
    catch(err){
      print('Error is: $err');
      time = 'Could not calc the time';
    }

  }


}


