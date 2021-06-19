
// class CustomDraggableScrollView extends StatefulWidget {
//   final Widget child;
//   final double initialChildSize;
//   final double minChildSize;
//   final double maxChildSize;
//   DraggableScrollableNotification? draggableController;
//   CustomDraggableScrollView({
//     Key? key,
//     required this.child,
//     this.initialChildSize = 0.6,
//     this.minChildSize = 0.2,
//     this.maxChildSize = 0.5,
//   }) : super(key: key);
//   @override
//   _CustomDraggableScrollViewState createState() =>
//       _CustomDraggableScrollViewState();
// }

// class _CustomDraggableScrollViewState extends State<CustomDraggableScrollView> {
//   @override
//   Widget build(BuildContext context) {
    // return NotificationListener<DraggableScrollableNotification>(
    //   onNotification: (value) => scrollNotificationScroll(value),
    //   child: DraggableScrollableSheet(
    //     initialChildSize: widget.initialChildSize,
    //     minChildSize: widget.minChildSize,
    //     maxChildSize: widget.maxChildSize,
    //     builder: (context, _scrollController) =>
    //         singleChildScrollView(context, _scrollController),
    //   ),
//     );
//   }

//   bool scrollNotificationScroll(DraggableScrollableNotification value) {
//     Provider.of<DraggableControllerNotifier>(context, listen: false)
//         .changeValue(value);
//     return false;
//   }

//   SingleChildScrollView singleChildScrollView(
//       BuildContext context, ScrollController _scrollController) {
//     return SingleChildScrollView(
//       controller: _scrollController,
//       child: widget.child,
//     );
//   }
// }
