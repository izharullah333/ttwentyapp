import 'package:flutter/material.dart';

import '../module/venue_module.dart';
import '../utility/venu_data_handler.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<HistoryModule>>(
          future: HistoryDataHnadler.getAllHistory(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<HistoryModule>? historydata = snapshot.data;
              return ListView.builder(
                  itemCount: historydata!.length,
                  itemBuilder: (context, index) {
                    var history = snapshot.data![index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.purple),
                      child: Column(
                        children: [
                          Text(
                            'Hosted by ${history.host}'
                            "  "
                            '( ${history.year} )',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Winner',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text('RunnerUp',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
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
                                    child: Image.asset(
                                      'assets/flages/${history.winnerFlag}',
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 60,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    history.winner,
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              const Text(
                                'VS',
                                style:  TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    history.runnerUp,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/flages/${history.runnerUpFlag}',
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 60,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
