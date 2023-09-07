import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  String? task;
  @JsonKey(name: 'task_details')
  String? taskDetails;
  @JsonKey(name: 'task_due_date')
  String? taskDueDate;
  @JsonKey(name: 'task_due_time')
  String? taskDueTime;
  @JsonKey(name: 'task_status')
  String? email;

  PostModel({
    this.task,
    this.taskDetails,
    this.taskDueDate,
    this.taskDueTime,
    this.email,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return _$PostModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
