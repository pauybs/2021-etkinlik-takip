// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapEventModel _$MapEventModelFromJson(Map<String, dynamic> json) {
  return MapEventModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    desc: json['desc'] as String?,
    date: json['date'] as String?,
    tagId: json['tagId'] as int?,
    capacity: json['capacity'] as int?,
    isOnline: json['isOnline'] as int?,
    isPayment: json['isPayment'] as int?,
    placeId: json['placeId'] as int?,
    updatedAt: json['updatedAt'] as String?,
    createdAt: json['createdAt'] as String?,
    isRemoved: json['isRemoved'] as int?,
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MapEventModelToJson(MapEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'date': instance.date,
      'tagId': instance.tagId,
      'capacity': instance.capacity,
      'isOnline': instance.isOnline,
      'isPayment': instance.isPayment,
      'placeId': instance.placeId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'isRemoved': instance.isRemoved,
      'location': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    id: json['id'] as int?,
    name: json['name'] as String?,
    placeAdress: json['placeAdress'] as String?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    updatedAt: json['updatedAt'] as String?,
    createdAt: json['createdAt'] as String?,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'placeAdress': instance.placeAdress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
