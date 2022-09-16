import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../module/venue_module.dart';

class venuDataHandler{
  static Future<List<venueModule>> getAllvenue(BuildContext context)async{
    var venue = <venueModule>[];
    var assetsbundle= DefaultAssetBundle.of(context);
    var data = await assetsbundle.loadString('assets/jsonfile/ttwenty.json');
    var jsondata = jsonDecode(data);
    var venueData = jsondata['venues'];
    for(var getVenue in venueData){
      venueModule venuemodule= venueModule.fromJSON(getVenue);
      venue.add(venuemodule);
    }
    return venue;
    }
}
class HistoryDataHnadler{
  static Future<List<HistoryModule>>getAllHistory(BuildContext context) async {
    var history = <HistoryModule>[];
    var assetsbundle= DefaultAssetBundle.of(context);
    var data = await assetsbundle.loadString('assets/jsonfile/ttwenty.json');
    var jsondata = jsonDecode(data);
    var historydata=jsondata['history'];
    for(var gethsitory in historydata){
      HistoryModule historymodule= HistoryModule.fromJSON(gethsitory);
      history.add(historymodule);
    }
    return history;
  }
}
class TeamDataHindler{
  static Future<List<TeamModule>>getAllTeam(BuildContext context) async {
    var team = <TeamModule>[];
    var assestsbundle = DefaultAssetBundle.of(context);
    var data = await assestsbundle.loadString('assets/jsonfile/ttwenty.json');
    var jsondata = jsonDecode(data);
    var teamData = jsondata['teams'];
    for(var getTeam in teamData){
      TeamModule teammodule = TeamModule.fromJSON(getTeam);
      team.add(teammodule);
    }
    return team;
  }
}