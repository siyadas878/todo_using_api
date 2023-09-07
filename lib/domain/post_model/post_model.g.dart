// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      task: json['task'] as String?,
      taskDetails: json['task_details'] as String?,
      taskDueDate: json['task_due_date'] as String?,
      taskDueTime: json['task_due_time'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'task': instance.task,
      'task_details': instance.taskDetails,
      'task_due_date': instance.taskDueDate,
      'task_due_time': instance.taskDueTime,
      'email': instance.email,
    };
