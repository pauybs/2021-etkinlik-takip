import 'package:fluttermvvmtemplate/product/notifier/sliding_up_notifer.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../navigation/navigation_service.dart';
import 'theme_notifer.dart';
import 'package:fluttermvvmtemplate/product/widget/bottom_sheet/draggable_scroll_view/custom_draggable_scroll_view.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider? get instance {
    if (_instance == null) _instance = ApplicationProvider._init();
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
    Provider.value(value: NavigationService.instance)
  ];
  List<SingleChildWidget> uiChangesItems = [
    ChangeNotifierProvider(
      create: (context) => SlidingUpNotifier(),
    )
  ];
}
