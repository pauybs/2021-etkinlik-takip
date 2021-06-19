import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/view/map/model/map_event_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'dart:ui' as ui;
import 'package:sliding_up_panel/sliding_up_panel.dart';
part 'map_view_model.g.dart';

class MapViewModel = MapViewBase with _$MapViewModel;

abstract class MapViewBase with Store, BaseViewModel {
  @override
  BuildContext? context;
  GoogleMapController? controller;
  PanelController? panelController;
  @observable
  BitmapDescriptor? eventIcon;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    // _throttleStringHelper = ThrottleStringHelper();
    // _fetchAllUser();
    panelController = PanelController();
  }

//example markers
  List<MapEventModel> mapEventList = [
    MapEventModel(
        location: Location(latitude: 37.7347649, longitude: 29.0489951)),
    // MapEventModel(location: Location(latitude: 40, longitude: 30)),
    // MapEventModel(location: Location(latitude: 35, longitude: 35))
  ];

  final CameraPosition kLake =
      CameraPosition(target: LatLng(37.7587804, 29.0946194), zoom: 7);

  // void mapsCardOnPressed() {
  //   controller.animateCamera(
  //       CameraUpdate.newLatLng(AppConstant.TURKEY_CENTER_LAT_LONG));
  // }

  void markerOnTap(value) {
    // print(value);
    panelController!.animatePanelToSnapPoint(
        curve: Curves.easeInOutExpo, duration: Duration(milliseconds: 700));
  }

  Future<void> mapsInit(GoogleMapController controller) async {
    this.controller = controller;
    await createMarkerImageFromAsset();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> createMarkerImageFromAsset() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('asset/image/twitterBlackLogo.jpg', 75);
    eventIcon = BitmapDescriptor.fromBytes(markerIcon);
  }
}
