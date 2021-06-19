import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/product/notifier/sliding_up_notifer.dart';
import 'package:fluttermvvmtemplate/view/notification_view/model/notificaiton_model.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomSlidingUp extends StatefulWidget {
  PanelController? panelController;
  double? maxHeight;
  double? minHeight;
  double? snapPoint;
  Widget? header;
  bool? parallaxEnabled;
  double? parallaxOffset;
  PanelState? defaultPanelState;
  bool? backdropTapClosesPanel;
  bool? backdropEnabled;
  double? backdropOpacity;
  Widget? panel;
  Border? borderRadius;
  Widget? body;
  Widget Function(ScrollController)? panelBuilder;
  CustomSlidingUp({
    Key? key,
    this.panelController,
    this.maxHeight,
    this.minHeight,
    this.snapPoint,
    this.header,
    this.parallaxEnabled,
    this.parallaxOffset,
    this.defaultPanelState,
    this.backdropTapClosesPanel,
    this.backdropEnabled,
    this.backdropOpacity,
    this.panel,
    this.borderRadius,
    this.body,
    this.panelBuilder,
  }) : super(key: key);

  @override
  _CustomSlidingUpState createState() => _CustomSlidingUpState();
}

class _CustomSlidingUpState extends State<CustomSlidingUp> {
  @override
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      onPanelSlide: (value) =>
          Provider.of<SlidingUpNotifier>(context, listen: false)
              .setPanelSlide(value),
      onPanelOpened: () =>
          Provider.of<SlidingUpNotifier>(context, listen: false)
              .setPanelShow(true),
      onPanelClosed: () =>
          Provider.of<SlidingUpNotifier>(context, listen: false)
              .setPanelShow(false),
      controller: widget.panelController,
      panelBuilder: widget.panelBuilder,
      maxHeight: widget.maxHeight ?? 500,
      minHeight: widget.minHeight ?? 0,
      snapPoint: widget.snapPoint ?? 0.5,
      header: widget.header,
      parallaxEnabled: widget.parallaxEnabled ?? true,
      parallaxOffset: widget.parallaxOffset ?? .2,
      defaultPanelState: widget.defaultPanelState ?? PanelState.CLOSED,
      backdropTapClosesPanel: widget.backdropTapClosesPanel ?? true,
      backdropEnabled: widget.backdropEnabled ?? true,
      backdropOpacity: widget.backdropOpacity ?? 0.15,
      isDraggable: true,
      // borderRadius: BorderRadius.vertical(
      // top: Radius.circular(context.width * 0.08),
      // ),
      color: Colors.transparent,
      boxShadow: [],
      body: widget.body,
    );
  }

  // Widget _scrollingList(context, ScrollController sc) {
  //   return SingleChildScrollView(
  //     controller: sc,
  //     child: widget.child,
  //   );
  // }
}
