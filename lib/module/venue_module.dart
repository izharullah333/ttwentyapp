class venueModule{
  String country;
  String city;
  String stadium;
  String image;
  venueModule({
    required this.country,
    required this.city,
    required this.stadium,
    required this.image,
});
  static venueModule fromJSON(Map<String ,dynamic>map){
   return venueModule(
     country: map['country'],
     city: map['city'],
     stadium: map['stadium'],
     image: map['image'],
   );
   }
  }
  class HistoryModule{
  String winner;
  String runnerUp;
  String host;
  String winnerFlag;
  String runnerUpFlag;
  String year;
  HistoryModule({
    required this.winner,
    required this.runnerUp,
    required this.host,
    required this.winnerFlag,
    required this.runnerUpFlag,
    required this.year,
  });
  static HistoryModule fromJSON(Map<String ,dynamic>map){
    return HistoryModule(
      winner: map['winner'],
      runnerUp: map['runnerUp'],
      host: map['host'],
      winnerFlag: map['winnerFlag'],
      runnerUpFlag: map['runnerUpFlag'],
      year: map['year'],

    );
  }
  }
  class TeamModule{
  String fullName;
  String shortName;
  String flag;

  TeamModule({
      required this.fullName,
      required this.shortName,
      required this.flag,

  });
  static TeamModule fromJSON(Map<String,dynamic>map){
    return TeamModule(
      fullName: map['fullName'],
      shortName: map['shortName'],
      flag: map['flag'],
    );
  }
}