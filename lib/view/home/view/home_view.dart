import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_locale_text.dart';
import 'package:fluttermvvmtemplate/core/components/text/locale_text.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
// import '../../../product/widget/bottomNavigation/bottom_navigation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/product/helpers/dateDiff.dart';
import 'package:fluttermvvmtemplate/product/widget/base_scaffold/base_scaffold.dart';
import 'package:fluttermvvmtemplate/view/event_detail/view/event_detail_view.dart';
import 'package:fluttermvvmtemplate/view/home/home_viewmodel/home_view_model.dart';
import '../../../core/extension/string_extension.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const category = <String>[
      LocaleKeys.home_scrollEvent_all,
      LocaleKeys.home_scrollEvent_science,
      LocaleKeys.home_scrollEvent_technology,
      LocaleKeys.home_scrollEvent_sport,
      LocaleKeys.home_scrollEvent_artAndCulture,
      LocaleKeys.home_scrollEvent_history
    ];

    final eventCard = [
      {
        'type': 'Konser',
        'name': 'No Clear Mind',
        'time': '11 Mart',
        'image': 'asset/image/image_concert.png'
      },
      {
        'type': 'Konferans',
        'name': 'TEDx',
        'time': '12 Kasım',
        'image': 'asset/image/tedx_talk.png'
      },
      {
        'type': 'Spor',
        'name': 'Anadolu Efes & Asvel Lyon',
        'time': '23 Ekim',
        'image': 'asset/image/anadolu_efes.png'
      },
    ];

    final eventCardUpcoming = [
      {
        'type': 'Spor',
        'name': 'Anadolu Efes & Asvel Lyon',
        'time': '2021-05-04T10:37:30.250Z',
        'image': 'asset/image/anadolu_efes.png'
      },
      {
        'type': 'Konser',
        'name': 'Nirvana',
        'time': '2021-05-02T10:37:30.250Z',
        'image': 'asset/image/image_concert.png'
      },
      {
        'type': 'Konferans',
        'name': 'TEDx',
        'time': '2021-05-06T10:37:30.250Z',
        'image': 'asset/image/tedx_talk.png'
      },
    ];

    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) =>
          CustomScaffold(
        background_color: context.colors.background,
        top_safe_area_value: true,
        bottom_safe_area_value: false,
        widget: Stack(
          children: [
            Container(
              height: context.mediaQuery.size.height * 0.336,
              child: Column(
                children: [
                  SizedBox(height: context.lowValue),
                  Expanded(
                    flex: 9,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.menu), onPressed: () {}),
                            Container(
                                padding: context.paddingLowHorizontal,
                                alignment: Alignment.topLeft,
                                child: AutoLocaleText(
                                    value: LocaleKeys.home_title.locale +
                                        ' Abdullah',
                                    style: context.textTheme.headline5,
                                    minFontSize: 16)
                                // Text(
                                //   'Merhaba Abdullah 🤩',
                                //   style: context.textTheme.headline5,
                                // ),
                                ),
                          ],
                        ),
                        Container(
                          padding: context.paddingNormalHorizontal.copyWith(
                              left: context.mediaQuery.size.width * 0.15),
                          alignment: Alignment.topLeft,
                          child: AutoLocaleText(
                            value: LocaleKeys.home_upcomingEvents.locale,
                            minFontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 14,
                    child: Container(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: eventCardUpcoming.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => EventDetailView()),
                                // );
                              },
                              child: Padding(
                                padding: context.paddingLow,
                                child: Container(
                                  padding: context.paddingMediumHorizontal
                                      .copyWith(
                                          top: context.mediaQuery.size.height *
                                              0.015),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.36),
                                              BlendMode.dstATop),
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              eventCardUpcoming[index]
                                                  ['image']!)),
                                      color: context.colors.primary,
                                      borderRadius: BorderRadius.circular(24)),
                                  width: context.mediaQuery.size.width * 0.7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: AutoSizeText(
                                          eventCardUpcoming[index]['name']!,
                                          style: context.textTheme.subtitle1!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      context.colors.secondary),
                                          minFontSize: 12,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: AutoSizeText(
                                          DateDiff(
                                                  date: eventCardUpcoming[index]
                                                      ['time'],
                                                  dateDiff: '')
                                              .dateDayMinute,
                                          style: context.textTheme.subtitle2!
                                              .copyWith(
                                                  color:
                                                      context.colors.secondary),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: AutoSizeText(
                                          eventCardUpcoming[index]['type']!,
                                          style: context.textTheme.bodyText1!
                                              .copyWith(
                                                  color:
                                                      context.colors.secondary,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.65,
                minChildSize: 0.65,
                maxChildSize: 1,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      height: context.mediaQuery.size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 0.01,
                            blurRadius: 14,
                            offset:
                                Offset(0, 0.1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: context.paddingLowHorizontal.copyWith(
                            left: context.mediaQuery.size.width * 0.027),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: context.colors.onSecondary
                                      .withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)),
                              margin: context.paddingLowVertical,
                              width: 80,
                              height: 8,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: context.colors.onSecondary,
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: LocaleKeys.home_findEvent.locale,
                                  hintStyle: context.textTheme.subtitle2!
                                      .copyWith(
                                          color: context.colors.onSecondary)),
                            ),
                            Expanded(
                              flex: 2,
                              child: ListView.builder(
                                itemCount: category.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      padding: context.paddingNormalHorizontal
                                          .copyWith(
                                              top: context
                                                      .mediaQuery.size.height *
                                                  0.02),
                                      child: AutoLocaleText(
                                        value: category[index].locale,
                                        style: context.textTheme.subtitle2!
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                        minFontSize: 13,
                                      ));
                                },
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoLocaleText(
                                      value: LocaleKeys
                                          .home_scrollEvent_all.locale,
                                      style: context.textTheme.bodyText1,
                                    ),
                                    Spacer(),
                                    AutoLocaleText(
                                      value: LocaleKeys.home_viewAll.locale,
                                      style: context.textTheme.bodyText1!
                                          .copyWith(
                                              color: context.colors.primary),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height:
                                  context.mediaQuery.size.height * 0.1977878,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: eventCard.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    padding: context.paddingLowHorizontal,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width:
                                              context.mediaQuery.size.height *
                                                  0.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  eventCard[index]['image']!),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              context.mediaQuery.size.height *
                                                  0.25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight,
                                                colors: [
                                                  Color(0xff111467),
                                                  Colors.transparent
                                                ],
                                              )),
                                        ),
                                        Container(
                                          padding: context
                                              .paddingNormalHorizontal
                                              .copyWith(right: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Spacer(
                                                flex: 2,
                                              ),
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      decoration: BoxDecoration(
                                                          color: context.colors
                                                              .onBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60)),
                                                      width: 4,
                                                      height: 30,
                                                    ),
                                                    AutoLocaleText(
                                                      value: eventCard[index]
                                                          ['type'],
                                                      style: context
                                                          .textTheme.overline!
                                                          .copyWith(
                                                              color: context
                                                                  .colors
                                                                  .secondary),
                                                      minFontSize: 10,
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: AutoLocaleText(
                                                  value: eventCard[index]
                                                      ['name'],
                                                  style: context
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    color: context
                                                        .colors.secondary,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  minFontSize: 15,
                                                ),
                                              ),
                                              Expanded(
                                                child: AutoLocaleText(
                                                  value: eventCard[index]
                                                      ['time'],
                                                  style: context
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    color: context
                                                        .colors.secondary,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  minFontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoLocaleText(
                                      value: LocaleKeys.home_viewAll,
                                      style: context.textTheme.bodyText1,
                                    ),
                                    Spacer(),
                                    AutoLocaleText(
                                      value: LocaleKeys.home_viewAll.locale,
                                      style: context.textTheme.bodyText1!
                                          .copyWith(
                                              color: context.colors.primary),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height:
                                  context.mediaQuery.size.height * 0.1977878,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: eventCard.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    padding: context.paddingLowHorizontal,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width:
                                              context.mediaQuery.size.height *
                                                  0.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  eventCard[index]['image']!),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              context.mediaQuery.size.height *
                                                  0.25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight,
                                                colors: [
                                                  Color(0xff111467),
                                                  Colors.transparent
                                                ],
                                              )),
                                        ),
                                        Container(
                                          padding: context
                                              .paddingNormalHorizontal
                                              .copyWith(right: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Spacer(
                                                flex: 2,
                                              ),
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      decoration: BoxDecoration(
                                                          color: context.colors
                                                              .onBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60)),
                                                      width: 4,
                                                      height: 30,
                                                    ),
                                                    AutoLocaleText(
                                                      value: eventCard[index]
                                                          ['type'],
                                                      style: context
                                                          .textTheme.overline!
                                                          .copyWith(
                                                              color: context
                                                                  .colors
                                                                  .secondary),
                                                      minFontSize: 10,
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: AutoLocaleText(
                                                  value: eventCard[index]
                                                      ['name'],
                                                  style: context
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    color: context
                                                        .colors.secondary,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  minFontSize: 15,
                                                ),
                                              ),
                                              Expanded(
                                                child: AutoLocaleText(
                                                  value: eventCard[index]
                                                      ['time'],
                                                  style: context
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    color: context
                                                        .colors.secondary,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  minFontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Spacer(
                              flex: 9,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
