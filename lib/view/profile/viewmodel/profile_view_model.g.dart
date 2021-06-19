// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  final _$tabControllerAtom = Atom(name: '_ProfileViewModelBase.tabController');

  @override
  TabController? get tabController {
    _$tabControllerAtom.reportRead();
    return super.tabController;
  }

  @override
  set tabController(TabController? value) {
    _$tabControllerAtom.reportWrite(value, super.tabController, () {
      super.tabController = value;
    });
  }

  final _$isTabSelectedValueAtom =
      Atom(name: '_ProfileViewModelBase.isTabSelectedValue');

  @override
  int get isTabSelectedValue {
    _$isTabSelectedValueAtom.reportRead();
    return super.isTabSelectedValue;
  }

  @override
  set isTabSelectedValue(int value) {
    _$isTabSelectedValueAtom.reportWrite(value, super.isTabSelectedValue, () {
      super.isTabSelectedValue = value;
    });
  }

  @override
  String toString() {
    return '''
tabController: ${tabController},
isTabSelectedValue: ${isTabSelectedValue}
    ''';
  }
}
