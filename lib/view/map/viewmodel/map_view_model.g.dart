// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapViewModel on MapViewBase, Store {
  final _$eventIconAtom = Atom(name: 'MapViewBase.eventIcon');

  @override
  BitmapDescriptor? get eventIcon {
    _$eventIconAtom.reportRead();
    return super.eventIcon;
  }

  @override
  set eventIcon(BitmapDescriptor? value) {
    _$eventIconAtom.reportWrite(value, super.eventIcon, () {
      super.eventIcon = value;
    });
  }

  @override
  String toString() {
    return '''
eventIcon: ${eventIcon}
    ''';
  }
}
