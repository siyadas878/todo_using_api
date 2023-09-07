// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchData _$FetchDataFromJson(Map<String, dynamic> json) => FetchData(
      taskId: json['task_id'] as int?,
      task: json['task'] as String?,
      taskDetails: json['task_details'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$FetchDataToJson(FetchData instance) => <String, dynamic>{
      'task_id': instance.taskId,
      'task': instance.task,
      'task_details': instance.taskDetails,
      'email': instance.email,
    };
