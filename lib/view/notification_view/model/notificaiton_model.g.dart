// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificaiton_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notificaiton _$NotificaitonFromJson(Map<String, dynamic> json) {
  return Notificaiton(
    title: json['title'] as String?,
    body: json['body'] as String?,
    token: json['token'] as String?,
    date: json['date'] as String?,
    image: json['image'] as String?,
    status: json['status'] as int?,
    isReady: json['isReady'] as bool?,
  );
}

Map<String, dynamic> _$NotificaitonToJson(Notificaiton instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'token': instance.token,
      'date': instance.date,
      'image': instance.image,
      'status': instance.status,
      'isReady': instance.isReady,
    };
