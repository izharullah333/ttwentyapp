import 'package:flutter/material.dart';
import '../module/venue_module.dart';
import '../utility/venu_data_handler.dart';

class Teamscreen extends StatefulWidget {
  const Teamscreen({Key? key}) : super(key: key);

  @override
  State<Teamscreen> createState() => _TeamscreenState();
}

class _TeamscreenState extends State<Teamscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team'),
      ),
      body: FutureBuilder<List<TeamModule>>(
        future: TeamDataHindler.getAllTeam(context),
        builder: (context ,snapshot){
          if(snapshot.hasData){
            List<TeamModule>? teamData=snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: teamData!.length,
                itemBuilder: (context, index){
                  var team=snapshot.data![index];
                  return Container(
                    margin: EdgeInsets.only(
                        bottom: 10),
                    width: 200,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(team.flag,
                            fit: BoxFit.cover,
                            width: 90,
                              height: 60,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(team.fullName,style: TextStyle(
                            fontSize: 20,color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          else {
            return const Center(
                child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
