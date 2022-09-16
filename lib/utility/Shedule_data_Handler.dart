import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../module/schedule_module.dart';
import '../module/venue_module.dart';

class ScheduleDataHandler{
  static Future<List<SchedulModule>> getAllMatches(BuildContext context)async{
    var match = <SchedulModule>[];
    var assetsbundle = DefaultAssetBundle.of(context);
    var data = await assetsbundle.loadString('assets/jsonfile/ttwenty.json');
    var jsonData = json.decode(data);
    var ScheduleData= jsonData['schedule'];
    for(var matchdata in ScheduleData){
      SchedulModule schedulModule= SchedulModule.fromJSON(matchdata);
      match.add(schedulModule);
    }
    return match;
  }
  static Future<List<venueModule>> getAllvenue(BuildContext context)async{
    var venue = <venueModule>[];
    var assetsbundle= DefaultAssetBundle.of(context);
    var data = await assetsbundle.loadString('assets/jsonfile/ttwenty.json');
    var jsondata = json.decode(data);
    var venueData = jsondata('venues');
    for(var getVenue in venueData){
      venueModule venuemodule= venueModule.fromJSON(getVenue);
      venue.add(venuemodule);
    }
    return venue;
  }
}
