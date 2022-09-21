import 'package:flutter/material.dart';
import 'package:ttwentyapp/utility/venu_data_handler.dart';

import '../module/venue_module.dart';

class venuescreen extends StatefulWidget {
  const venuescreen({Key? key}) : super(key: key);

  @override
  State<venuescreen> createState() => _venuescreenState();
}

class _venuescreenState extends State<venuescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          'VenueScreen'
        ),
      ),
      body: FutureBuilder <List<venueModule>>(
        future: venuDataHandler.getAllvenue(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<venueModule>? VenueData=snapshot.data;
            return ListView.builder(
              itemCount: VenueData!.length,
              itemBuilder: (context,index){
                var venue = snapshot.data![index];
                return Container(
                  margin: const EdgeInsets.only(
                      top: 10,
                  left: 10,
                    right: 10,
                  ),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text('Country: ${venue.country}',style: const TextStyle(
                        fontSize: 20,
                      ),),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('City: ${venue.city}',style: const TextStyle(
                        fontSize: 20,
                      ),),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(venue.stadium,style: const TextStyle(
                        fontSize: 20
                      ),),
                      Expanded(
                        child: Image.asset(
                          venue.image,
                          height: 141,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                );
              }
            );
          }
          else {
            return const Center(
              child:  CircularProgressIndicator()
            );
          }
        }
      )
    );
  }
}
