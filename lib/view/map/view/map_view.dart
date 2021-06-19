import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/container/random_color_container.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_locale_text.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/product/notifier/sliding_up_notifer.dart';
import 'package:fluttermvvmtemplate/product/widget/bottom_sheet/draggable_scroll_view/custom_draggable_scroll_view.dart';
import 'package:fluttermvvmtemplate/product/widget/bottom_sheet/sliding_up/custom_sliding_up.dart';
import 'package:fluttermvvmtemplate/product/widget/image_slider/draggable_image_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../viewmodel/map_view_model.dart';
import '../../../core/extension/string_extension.dart';

class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> with SingleTickerProviderStateMixin {
  late BitmapDescriptor eventIcon;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  TabController? _tabController;
  final tabs = <Widget>[
    Tab(
      text: 'Detaylar',
    ),
    Tab(
      text: 'Akış',
    ),
    Tab(
      text: 'Konuşmacılar',
    ),
    Tab(
      text: 'Görseller',
    ),
  ];
  final List imagesList = [
    'https://i.pravatar.cc/150?img=1',
    'https://i.pravatar.cc/150?img=2',
    'https://i.pravatar.cc/150?img=3',
    'https://i.pravatar.cc/150?img=4',
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
  Widget build(BuildContext context) {
    print(Provider.of<SlidingUpNotifier>(context).panelSlide);
    print(Provider.of<SlidingUpNotifier>(context).panelSlide > .8
        ? (1 - (0.8 / Provider.of<SlidingUpNotifier>(context).panelSlide))
        : 0);
    return BaseView<MapViewModel>(
      viewModel: MapViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, MapViewModel value) =>
          DefaultTabController(
        initialIndex: 0,
        length: tabs.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(animateHeightAppbar),
            child: AppBar(
              backgroundColor: context.colors.secondary,
              leading: IconButton(
                  onPressed: () {
                    value.panelController!.close();
                  },
                  icon: Icon(Icons.chevron_left_outlined)),
              title: AutoSizeText(
                'DevFest Denizli 2021',
                style: context.textTheme.subtitle1,
              ),
            ),
          ),
          body: CustomSlidingUp(
            maxHeight: context.height,
            snapPoint: 0.5,
            panelController: value.panelController,
            panelBuilder: (sc) => SingleChildScrollView(
              controller: sc,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  eventBannerContainer(),
                  slidingUpContent(context),
                ],
              ),
            ),
            body: Observer(builder: (_) {
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: value.kLake,
                zoomControlsEnabled: false,
                onMapCreated: (map) => value.mapsInit(map),
                markers: createMarker(value),
                compassEnabled: true,
                myLocationEnabled: true,
              );
            }),
          ),
        ),
      ),
    );
  }

  Padding slidingUpContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: animateHeightBanner),
      child: Container(
        // height: context.height,
        width: context.width,
        clipBehavior: Clip.hardEdge,
        padding: context.paddingNormalHorizontal,
        decoration: BoxDecoration(
          color: context.colors.secondary,
        ),
        child: Column(
          children: [
            touchDragPlaceholder(context),
            eventNameWithCategory(context),
            organizerEventAreaContent(context),
            eventTagDetail(context, 'location', 'Kongre ve Kültür Merkezi',
                'İncilipınar,20150 Pamukkale/Denizli'),
            eventTagDetail(context, 'time', '25 Ekim Pazar', '08:00 - 19:00'),
            eventTagDetail(
                context, 'price', '25₺+', 'Tek Oturum - Öğrenci 25₺, Tam 50₺'),
            eventTagDetail_users(context),
            Divider(),
            Container(
              width: context.width,
              child: TabBar(
                controller: _tabController,
                labelPadding: context.paddingNormalHorizontal,
                isScrollable: true,
                indicatorWeight: 0.01,
                onTap: (int selected) {},
                indicatorColor: Colors.black,
                labelColor: context.colors.primary,
                labelStyle: context.textTheme.subtitle1,
                unselectedLabelColor: context.colors.onSecondary,
                unselectedLabelStyle: context.textTheme.subtitle1,
                tabs: tabs,
              ),
            ),
            Container(
              width: context.width,
              height: context.height * .4,
              child: TabBarView(
                children: [
                  Container(
                    width: context.width,
                    child: AutoSizeText(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into',
                      style: context.textTheme.bodyText2,
                    ),
                  ),
                  Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: context.colors.primary,
                      ),
                    ),
                    width: context.width,
                  ),
                  Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: context.colors.primary,
                      ),
                    ),
                    width: context.width,
                  ),
                  Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: context.colors.primary,
                      ),
                    ),
                    width: context.width,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * .2,
            )
          ],
        ),
      ),
    );
  }

  Row eventNameWithCategory(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          'DevFest Denizli 2021',
          maxFontSize: 22,
          minFontSize: 10,
          style: context.textTheme.headline4!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        AutoSizeText(
          'Teknoloji',
          maxFontSize: 18,
          minFontSize: 10,
          style: context.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.onSecondary,
          ),
        ),
      ],
    );
  }

  Padding touchDragPlaceholder(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Container(
        width: context.width * .1,
        height: context.width * .015,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[350],
        ),
      ),
    );
  }

  Padding eventTagDetail_users(BuildContext context) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('users'.toSVG),
          Padding(
            padding: context.paddingLowHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  '46 kişi gidiyor',
                  style: context.textTheme.bodyText2,
                ),
                circleAvatarsGroup(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding organizerEventAreaContent(BuildContext context) {
    return Padding(
      padding: context.paddingNormalVertical,
      child: Row(
        children: [
          Container(
            height: context.width * .11,
            width: context.width * .11,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 5, color: Colors.black26, spreadRadius: .1)
              ],
              borderRadius: BorderRadius.circular(context.width * .03),
              image: DecorationImage(
                image: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1236548019656503299/VCtQW2JT_400x400.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AutoSizeText('GDG Denizli',
                      style: context.textTheme.bodyText1),
                  AutoSizeText(
                    '205 Katılımcı',
                    minFontSize: 3,
                    style: context.textTheme.bodyText1!.copyWith(
                        fontSize: context.width * .03,
                        color: context.colors.onSecondary),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  AnimatedContainer eventBannerContainer() {
    return AnimatedContainer(
      duration: Duration.zero,
      height: animateHeightBanner,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(animateBorderRadius),
        ),
        image: DecorationImage(
          image: NetworkImage(
              'https://raw.githubusercontent.com/AshishBhoi/DevFest/master/assets/images/banner_light.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container circleAvatarsGroup(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.only(top: context.lowValue),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          // ...List.generate(
          //         imagesList.length,
          //         (index) =>
          //             circleAvatarUsers(context, index, imagesList[index]))
          //     .toList(),
          circleAvatarUsers(context, 0, imagesList[0]),
          circleAvatarUsers(context, 1, imagesList[1]),
          circleAvatarUsers(context, 2, imagesList[2]),
          circleAvatarUsers(context, 3, imagesList[3]),
          Padding(
            padding: EdgeInsets.only(
                left: (context.width * .055) * imagesList.length),
            child: Container(
              child: AutoSizeText(
                '+41',
                style: context.textTheme.bodyText2!
                    .copyWith(color: context.colors.onSecondary),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding circleAvatarUsers(BuildContext context, int index, String img) {
    return Padding(
      padding: EdgeInsets.only(left: (context.width * .045) * index),
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 12,
          backgroundImage: NetworkImage(img),
        ),
      ),
    );
  }

  Padding eventTagDetail(
      BuildContext context, String svgName, String title, String subtitle) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(svgName.toSVG),
          Padding(
            padding: context.paddingLowHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  title,
                  style: context.textTheme.bodyText2,
                ),
                AutoSizeText(
                  subtitle,
                  style: context.textTheme.bodyText2!
                      .copyWith(color: context.colors.onSecondary),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Set<Marker> createMarker(MapViewModel value) {
    return value.mapEventList
        .map(
          (e) => Marker(
              markerId: MarkerId(e.hashCode.toString()),
              position:
                  LatLng(e.location!.latitude ?? 0, e.location!.longitude ?? 0),
              // icon: value.eventIcon ?? BitmapDescriptor.defaultMarker,
              icon: BitmapDescriptor.defaultMarker,
              zIndex: 5,
              infoWindow: InfoWindow(title: 'Devfest Denizli 2021'),
              onTap: () => value.markerOnTap(e)),
        )
        .toSet();
  }

  Widget touchSwipePointer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.width * .025),
      child: Container(
        height: context.width * .015,
        width: context.width * .1,
        decoration: BoxDecoration(
          color: context.colors.onSecondary,
          borderRadius: BorderRadius.all(
            Radius.circular(context.width * .01),
          ),
        ),
      ),
    );
  }

  double get animateHeightBanner =>
      (Provider.of<SlidingUpNotifier>(context).panelSlide + .5) *
      (context.height * .2);

  double get animateHeightAppbar =>
      Provider.of<SlidingUpNotifier>(context).panelSlide > .8
          ? kToolbarHeight *
              ((Provider.of<SlidingUpNotifier>(context).panelSlide - .8) / .2)
          : 0;
  double get animateBorderRadius =>
      Provider.of<SlidingUpNotifier>(context).panelSlide > .8
          ? 0
          : context.width * 0.08;
}
