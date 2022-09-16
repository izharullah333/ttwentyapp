import 'package:flutter/material.dart';

import '../module/schedule_module.dart';
import '../utility/Shedule_data_Handler.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Schedule Screen'
        ),
      ),
      body: FutureBuilder <List<SchedulModule>>(
        future: ScheduleDataHandler.getAllMatches(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<SchedulModule>? matchData = snapshot.data;
            return ListView.builder(
              itemCount: matchData!.length,
                itemBuilder: (context, index){
                var match = snapshot.data![index];
                return Container(
                  margin: const EdgeInsets.only(
                      top: 10,
                  left: 10,
                  right: 10,
                  ),
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(match.date,style: const TextStyle(
                        fontSize: 20,color: Colors.white,
                      ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset('assets/flages/${match.flagOne}',
                                  fit: BoxFit.cover,
                                  width: 90,
                                  height: 60,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(match.teamOne,style: const TextStyle(
                                fontSize: 15,color: Colors.white
                              ),),
                            ],
                          ),
                          const Text('VS',style: TextStyle(
                            fontSize: 15,color: Colors.white
                          ),),

                          Row(
                            children: [
                              Text(match.teamTwo,style: const TextStyle(
                                fontSize: 15,color: Colors.white
                              ),),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset('assets/flages/${match.flagTwo}',
                                  fit: BoxFit.cover,
                                  width: 90,
                                  height: 60,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(match.venue,style: const TextStyle(
                        fontSize: 15,color: Colors.white
                      ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          width: 110,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)
                            )
                          ),
                          child: Center(
                              child: Text('Group ${match.group}',style: const TextStyle(
                                fontSize: 25,color: Colors.white
                              ),)),
                        ),
                      ),
                    ],
                  ),
                );
                }

            );
          }
          else {
            return const Center(
                child: CircularProgressIndicator());
          }
        }

      )
    );
  }
}
