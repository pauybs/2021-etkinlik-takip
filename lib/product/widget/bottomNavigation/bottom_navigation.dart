import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/product/notifier/sliding_up_notifer.dart';
import 'package:fluttermvvmtemplate/view/event_detail/view/event_detail_view.dart';
import 'package:fluttermvvmtemplate/view/map/view/map_view.dart';
import 'package:fluttermvvmtemplate/view/notification_view/view/notification_view.dart';
import 'package:fluttermvvmtemplate/view/profile/view/profile_view.dart';
import 'package:fluttermvvmtemplate/view/social_page/view/social_view.dart';
import 'package:provider/provider.dart';
import '../../../core/init/theme/light/color_scheme_light.dart';
import '../../../view/home/view/home_view.dart';
import '../../../core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  final color = ColorSchemeLight.instance;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    MapView(),
    // Center(child: Text('Map')),
    SocialView(),
    NotificationView(),
    ProfileView()
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, 2.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutQuad,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isAnimationBottomSheet(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: !Provider.of<SlidingUpNotifier>(context).isShow
          ? buildBottomAppBar(context)
          : eventDetailBottomNavigation(context),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  Container eventDetailBottomNavigation(BuildContext context) {
    return Container(
      padding: context.paddingNormalHorizontal,
      decoration: BoxDecoration(
        color: context.colors.secondary,
        boxShadow: [
          BoxShadow(blurRadius: 4, color: Colors.black12, spreadRadius: 1)
        ],
      ),
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Katılıyor musun?',
                style: context.textTheme.bodyText1!
                    .copyWith(color: context.colors.primary),
              ),
              AutoSizeText('Limit yok',
                  style: context.textTheme.bodyText2!
                      .copyWith(color: context.colors.primary)),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              child: AutoSizeText(
                'Bilet Al',
                style: context.textTheme.button!
                    .copyWith(color: context.colors.secondary),
              ))
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    // print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  SlideTransition buildFloatingActionButton() {
    return SlideTransition(
      position: _offsetAnimation,
      child: FloatingActionButton(
          heroTag: 'c',
          child: SvgPicture.asset('asset/svg/Network.svg'),
          backgroundColor:
              _selectedIndex == 2 ? Colors.indigo[400] : color!.slate_gray,
          elevation: 1,
          onPressed: () {
            _onItemTapped(2);
          }),
    );
  }

  Widget buildBottomAppBar(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        child: BottomAppBar(
          notchMargin: 10,
          color: Colors.grey[50],
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                bottomNavigationBarItem(context, 'Home', 0),
                bottomNavigationBarItem(context, 'Send', 1),
                Spacer(),
                bottomNavigationBarItem(context, 'Notification', 3),
                bottomNavigationBarItem(context, 'Profil', 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded bottomNavigationBarItem(BuildContext context, String icon, int index,
      {Color? color}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _onItemTapped(index);
        },
        child: SvgPicture.asset(
          'asset/svg/${icon}.svg',
          color: _selectedIndex == index ? context.colors.primary : null,
        ),
      ),
    );
  }

  Future<void> isAnimationBottomSheet(context) async {
    var _handleAnimation = Provider.of<SlidingUpNotifier>(context).panelSlide;
    await _handleAnimation > .2 ? _controller.forward() : _controller.reverse();
  }
}
