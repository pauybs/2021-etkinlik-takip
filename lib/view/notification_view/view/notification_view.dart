import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/product/helpers/dateDiff.dart';
import 'package:fluttermvvmtemplate/product/widget/card/notification_card.dart';
import 'package:fluttermvvmtemplate/view/notification_view/model/notificaiton_model.dart';

List<Notificaiton> notify = [
  Notificaiton(
      title: '',
      body: '@1 seni takip etti',
      date: '2021-05-15T21:30:00.250Z',
      isReady: true,
      status: 1,
      image: 'https://avatars.githubusercontent.com/u/36731163?v=',
      token: '123'),
  // Notificaiton(
  //     title: '',
  //     body: '@2 seni takip etti',
  //     date: '2021-05-02T10:37:30.250Z',
  //     isReady: false,
  //     image: 'https://avatars.githubusercontent.com/u/34376691?v=4',
  //     status: 2,
  //     token: '123'),
  Notificaiton(
      title: '',
      body: '@3 seni takip etti',
      date: '2021-05-02T10:37:30.250Z',
      isReady: false,
      status: 3,
      image: 'https://avatars.githubusercontent.com/u/62259512?v=4',
      token: '123'),
  Notificaiton(
      title: '',
      body: '@4 seni takip etti',
      date: '2021-05-02T10:37:30.250Z',
      isReady: false,
      status: 4,
      image:
          'https://pbs.twimg.com/profile_images/1352733037163900935/3oDljPVM_400x400.jpg',
      token: '123'),
];
// 2021-04-02T10:37:30.250Z

DateTime dateNow = DateTime.now();

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);
  final empty = 'empty';
  @override
  Widget build(BuildContext context) {
    // print(notify[0].date);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            color: Colors.black87,
            icon: Icon(Icons.chevron_left_rounded),
            onPressed: () {}),
        title: Text(
          LocaleKeys.notificaiton_notificaitons.locale,
          style: context.textTheme.headline6!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: context.paddingNormalHorizontal,
        child: ListView.builder(
          itemCount: notify.length,
          itemBuilder: (context, index) =>
              NotificationCard(item: notify[index]),
        ),
      ),
    );
  }

  // DateDiff(dateDiff: notify[index].date).since

  Center emptyPage() => Center(child: SvgPicture.asset('Empty'.toSVG));
}
