// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'fetch_data.g.dart';

@JsonSerializable()
class FetchData {
  @JsonKey(name: 'task_id')
  int? taskId;
  String? task;
  @JsonKey(name: 'task_details')
  String? taskDetails;
  String? email;

  FetchData({this.taskId, this.task, this.taskDetails, this.email});

  factory FetchData.fromJson(Map<String, dynamic> json) {
    return _$FetchDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FetchDataToJson(this);
}
