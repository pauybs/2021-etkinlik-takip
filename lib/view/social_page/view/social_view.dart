import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/product/helpers/dateDiff.dart';
import 'package:fluttermvvmtemplate/product/widget/base_scaffold/base_scaffold.dart';
import 'package:fluttermvvmtemplate/view/send_feed_view/view/send_feed_view.dart';
import 'package:fluttermvvmtemplate/view/social_page/view_model/social_view_model.dart';

class SocialView extends StatelessWidget {
  const SocialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storyFeed = [
      {
        'photo': 'https://avatars.githubusercontent.com/u/34376691?v=4',
        'name': 'Abdullah Oğuz',
        'time': '13.40'
      },
      {
        'photo': 'https://avatars.githubusercontent.com/u/62259512?v=4',
        'name': 'Halil İbrahim Ulu',
        'time': '14.50'
      },
      {
        'photo': 'https://avatars.githubusercontent.com/u/36731163?v=',
        'name': 'Fatih Emre Kalem',
        'time': '8.50'
      },
      {
        'photo':
            'https://pbs.twimg.com/profile_images/1352733037163900935/3oDljPVM_400x400.jpg',
        'name': 'Betül Üsküdar',
        'time': '10.50'
      },
      {
        'photo': 'https://avatars.githubusercontent.com/u/17102578?v=4',
        'name': 'Abdullah Oğuz',
        'time': '13.40'
      },
      {
        'photo': 'https://avatars.githubusercontent.com/u/187922?v=4',
        'name': 'Abdullah Oğuz',
        'time': '13.40'
      },
    ];

    final feedData = [
      {
        'photo': 'https://avatars.githubusercontent.com/u/34376691?v=4',
        'name': 'Abdullah Oğuz',
        'time': '2021-05-15T21:30:00.250Z',
        'text': 'Bugün NSIstanbul etkinliğine gelen var mı ?'
      },
      {
        'photo': 'https://avatars.githubusercontent.com/u/62259512?v=4',
        'name': 'Halil İbrahim Ulu',
        'time': '2021-05-02T10:37:30.250Z',
        'text': 'Karaköyde bir konser varmış giden var mı ?'
      },
      {
        'photo': 'https://avatars.githubusercontent.com/u/36731163?v=',
        'name': 'Fatih Emre Kalem',
        'time': '2021-05-02T10:37:30.250Z',
        'text': 'Korona bitse de hep birlikte duman konserine gitsek :('
      },
      {
        'photo':
            'https://pbs.twimg.com/profile_images/1352733037163900935/3oDljPVM_400x400.jpg',
        'name': 'Betül Üsküdar',
        'time': '2021-05-02T10:37:30.250Z',
        'text':
            'UI/UX üzerine dolu dolu bir etkinlik serisi düşünüyorum. Şu an planlamasını yapıyorum. Böyle bir işte gönüllü olarak yardımcı olabilecek kişilerle konuşarak daha da güzel bir iş çıkartabiliriz. Eğer gönüllü olmak isteyen varsa benimle iletişime geçebilir'
      }
    ];

    return BaseView<SocialViewModel>(
      viewModel: SocialViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, SocialViewModel value) => 
      
      CustomScaffold(
        resize_bottom_insets: false,
        fab_button: Padding(
          padding: context.paddingNormalVertical
              .copyWith(top: 0, bottom: context.mediaQuery.size.height * 0.1),
          child: FloatingActionButton(
              heroTag: 'a',
              backgroundColor: context.colors.primary,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SendFeedView()));
              },
              child: Icon(
                Icons.add,
                color: context.colors.background,
                size: 27,
              )
              
              ,),

        ),
        widget: Container(
          child: Column(
            children: [
              SizedBox(
                height: context.lowValue,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.menu))),
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 8),
                              ),
                            ]),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: context.paddingNormalHorizontal,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(200)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(200)),
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              hintText: 'ara...',
                              suffixIcon: Icon(Icons.search),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    Expanded(
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.message))),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: storyFeed.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: context.paddingLowHorizontal,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              NetworkImage(storyFeed[index]['photo']!),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 14,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: feedData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(feedData[index]['photo']!),
                        ),
                        title: Row(
                          children: [
                            Text(feedData[index]['name']!,
                                style: context.textTheme.subtitle2),
                            Spacer(),
                            Text(
                                DateDiff(dateDiff: feedData[index]['time'])
                                    .since,
                                style: context.textTheme.caption)
                          ],
                        ),
                        subtitle: Text(feedData[index]['text']!),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ), bottom_safe_area_value: false, top_safe_area_value: true,
      )
      
      // Scaffold(
  
       
      //   body: 
      // ),
    );
  }
}
