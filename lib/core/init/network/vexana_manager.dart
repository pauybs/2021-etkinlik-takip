import 'dart:io';

import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager get instance {
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  static const String _iosBaseUrl = 'https://coery-backend.herokuapp.com/';
  static const String _androidBaseUrl = 'https://coery-backend.herokuapp.com/';

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(
          baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl));
}
