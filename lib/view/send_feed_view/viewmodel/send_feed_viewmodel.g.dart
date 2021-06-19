// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_feed_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SendFeedViewModel on _SendFeedViewModelBase, Store {
  final _$imageAtom = Atom(name: '_SendFeedViewModelBase.image');

  @override
  PickedFile? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(PickedFile? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$_SendFeedViewModelBaseActionController =
      ActionController(name: '_SendFeedViewModelBase');

  @override
  dynamic changeImage(PickedFile? pickImage) {
    final _$actionInfo = _$_SendFeedViewModelBaseActionController.startAction(
        name: '_SendFeedViewModelBase.changeImage');
    try {
      return super.changeImage(pickImage);
    } finally {
      _$_SendFeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image}
    ''';
  }
}
