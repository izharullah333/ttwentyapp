import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ttwentyapp/screens/schedule_screen.dart';
import 'package:ttwentyapp/screens/team_screen.dart';
import 'package:ttwentyapp/screens/venue_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/Drawer_Screen.dart';
import '../widgets/Home_item_widgets.dart';
import '../widgets/net_connection.dart';
import 'History_screen.dart';
class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('T20 APP'),
        actions: [
          IconButton(
            onPressed: (){

            }, icon: const Icon(Icons.notifications),
          )
        ],
      ),
    drawer: const MyDrawer(),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            HomeItemWidget(
                title: 'Schedule',
              iconData: Icons.access_time,
              onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context){
                 return const ScheduleScreen();
               }));
              },
            ),
            HomeItemWidget(
              title: 'Venue',
              iconData: Icons.location_on, onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const venuescreen();
                }));
            },
            ),
            HomeItemWidget(
              title: 'History',
              iconData: Icons.history, onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const HistoryScreen();
                }));
            },
            ),
            HomeItemWidget(
              title: 'Teams',
              iconData: Icons.group,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const Teamscreen();
                }));
            },
            ),
            HomeItemWidget(
              title: 'LiveScore',
              iconData: Icons.live_tv,
              onPressed: () async {
              if(await CheckMyNet.checkNet()){
                var url = 'https://www.t20worldcup.com/';
                if (!await launchUrl(Uri.parse(url))) {
                  throw 'Could not launch $url';
                }
              }else{
                Fluttertoast.showToast(
                    msg: 'No internet Connection',
                );
              }
            },
            ),
            HomeItemWidget(
              title: 'HighLight',
              iconData: Icons.video_call,
              onPressed: () async{
                if(await CheckMyNet.checkNet()){
                  var url = 'https://www.youtube.com/watch?v=GnKE1JlCF84';
                  if (!await launchUrl(Uri.parse(url))) {
                    throw 'Could not launch $url';
                  }
                } else{
                  Fluttertoast.showToast(
                      msg: 'No internet Connection',
                  );
                }
            },
            ),
          ],
        ),
      ),
    ),
    );
  }
}