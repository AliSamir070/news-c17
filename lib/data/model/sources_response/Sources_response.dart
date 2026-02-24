import 'package:hive_ce/hive.dart';

import 'Source.dart';
part 'Sources_response.g.dart';
@HiveType(typeId: 0,adapterName: "SourcesResponseAdapter")
class SourcesResponse {
  SourcesResponse({
      this.status, 
      this.sources,
      this.code,
      this.message});

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }
  @HiveField(0)
  String? status;
  @HiveField(1)
  List<Source>? sources;
  @HiveField(2)
  String? code;
  @HiveField(3)
  String? message;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    map['code']=code;
    map['message']=message;
    return map;
  }

}