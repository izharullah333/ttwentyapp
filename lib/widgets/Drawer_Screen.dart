import 'package:flutter/material.dart';
import '../screens/History_screen.dart';
import '../screens/schedule_screen.dart';
import '../screens/team_screen.dart';
import '../screens/venue_screen.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.purple
            ), child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.highlight,size: 60,color: Colors.white,
              ),
              Text('T20 World Cup',style: TextStyle(
                fontSize: 30,color: Colors.white
              ),)
            ],
          ),
          ),
              ListTile(
               onTap: (){
                 Navigator.of(context).pop();
               },
              leading: const Icon(Icons.home,color: Colors.white,),
              title: const Text('Home',style:  TextStyle(color: Colors.white),),
            ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const ScheduleScreen();
              }));
            },
            leading: const Icon(Icons.schedule,color: Colors.white,),
            title: const Text('Schedule',style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const venuescreen();
              }));
            },
            leading: const Icon(Icons.location_on,color: Colors.white,),
            title: const Text('Location',style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const HistoryScreen();
              }));
            },
            leading: const Icon(Icons.history,color: Colors.white,),
            title: const Text('History',style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const Teamscreen();
              }));
            },
            leading: const Icon(Icons.group,color: Colors.white,),
            title: const Text('Teams',style: TextStyle(color: Colors.white),),
          ),
          const Divider(
            thickness: 2,
            color: Colors.white,
          ),
          const ListTile(
            leading: Icon(Icons.star,color: Colors.white,),
            title: Text('Rate Us',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
