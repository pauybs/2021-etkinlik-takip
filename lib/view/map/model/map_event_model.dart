import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'map_event_model.g.dart';

@JsonSerializable()
class MapEventModel extends INetworkModel<MapEventModel> {
  int? id;
  String? name;
  String? desc;
  String? date;
  int? tagId;
  int? capacity;
  int? isOnline;
  int? isPayment;
  int? placeId;
  String? updatedAt;
  String? createdAt;
  int? isRemoved;
  Location? location;

  MapEventModel(
      {this.id,
      this.name,
      this.desc,
      this.date,
      this.tagId,
      this.capacity,
      this.isOnline,
      this.isPayment,
      this.placeId,
      this.updatedAt,
      this.createdAt,
      this.isRemoved,
      this.location});

  @override
  MapEventModel fromJson(Map<String, Object?> json) {
    return _$MapEventModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$MapEventModelToJson(this);
  }
}

@JsonSerializable()
class Location extends INetworkModel<Location> {
  int? id;
  String? name;
  String? placeAdress;
  double? latitude;
  double? longitude;
  String? updatedAt;
  String? createdAt;

  Location(
      {this.id,
      this.name,
      this.placeAdress,
      this.latitude,
      this.longitude,
      this.updatedAt,
      this.createdAt});

  @override
  Location fromJson(Map<String, Object?> json) {
    return _$LocationFromJson(json);
  }

  factory Location.fromJson(Map<String, Object?> json) {
    return _$LocationFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$LocationToJson(this);
  }
}
