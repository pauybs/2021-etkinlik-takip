import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/product/notifier/sliding_up_notifer.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:provider/provider.dart';

class CustomDraggableScrollImageSlider extends StatelessWidget {
  bool scrollAnimate = false;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  CustomDraggableScrollImageSlider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    scrollAnimation(context);
    return AnimatedContainer(
      duration: context.lowDuration,
      height: scrollAnimate ? context.height * .2 : 0,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://raw.githubusercontent.com/AshishBhoi/DevFest/master/assets/images/banner_light.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> scrollAnimation(BuildContext context) async => {
        scrollAnimate =
            await Provider.of<SlidingUpNotifier>(context).panelSlide > .6
      };
}
