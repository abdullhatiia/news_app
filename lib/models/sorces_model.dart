class SourcesModel{


  final String status;
  final List<Source> sources;

  SourcesModel({
     required this.status,
     required this.sources,
  }
      );
 factory SourcesModel.fromJson(Map<String,dynamic> json)=>
     SourcesModel(
         status: json["status"],
         sources: (json["sources"]as List).map((element) =>
             Source.fromeJson(element)).
         toList(),
     );
}
class Source{

  final String id;
  final String name;

  Source({
    required this.id,
    required this.name
  } );
 factory Source.fromeJson(Map<String,dynamic>json){
    return Source(id:json["id"],name: json["name"],);
  }


}