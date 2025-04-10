class VideoInfoModel {
   String vid;
   String title;
   String description;
   String author;
   String uploading;
   String vlenth;
   String thum;
   String clogo;

  VideoInfoModel({
    required this.vid,
    required this.title,
    required this.description,
    required this.author,
    required this.uploading,
    required this.vlenth,
    required this.thum,
    required this.clogo,
  });

  Map<String,dynamic> toJson(){
    return {
      'vid':vid,
      'title':title,
      'description':description,
      'author':author,
      'uploading':uploading,
      'vlenth':vlenth,
      'thum':thum,
      'clogo':clogo,
    };
  }

  factory VideoInfoModel.fromJson(Map<String, dynamic> json) {
    return VideoInfoModel(
      vid: json['vid'],
      title: json['title'],
      description: json['description'],
      author: json['author'],
      uploading: json['uploading'],
      vlenth: json['vlenth'],
      thum: json['thum'],
      clogo: json['clogo'],
    );
  }
}
