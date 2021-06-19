import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_locale_text.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/send_feed_view/viewmodel/send_feed_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';
import '../../../core/extension/string_extension.dart';

class SendFeedView extends StatelessWidget {
  const SendFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _picker = ImagePicker();
    dynamic _pickImageError;
    ScrollController? controller;

    return BaseView<SendFeedViewModel>(
      viewModel: SendFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, SendFeedViewModel viewModel) =>
          Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: context.colors.background,
          shadowColor: Colors.transparent,
          leading: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: AutoLocaleText(
                value: LocaleKeys.sendFeed_cancel.locale,
                style: context.textTheme.button!
                    .copyWith(color: context.colors.primary),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: context.mediaQuery.size.height * 0.014,
                  top: context.mediaQuery.size.height * 0.014,
                  right: context.lowValue),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ))),
                  onPressed: () {
                    // SEND TWEET AREA
                    // !!!!
                  },
                  child: Padding(
                    padding: context.paddingNormalHorizontal,
                    child: AutoLocaleText(
                      value: LocaleKeys.sendFeed_send.locale,
                      style: context.textTheme.button!
                          .copyWith(color: context.colors.background),
                    ),
                  )),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: GestureDetector(
                    onHorizontalDragDown: (details) {
                      viewModel.image == null
                          ? null
                          : FocusScope.of(context).unfocus();
                    },
                    child: Container(
                      height: context.mediaQuery.size.height * 0.9 - context.mediaQuery.viewInsets.bottom * 0.05,
                      color: context.colors.background,
                      child: Stack(
                        children: [
                          Observer(builder: (_) {
                            return Expanded(
                              // flex: viewModel.image == null ? 13 : 200,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: CircleAvatar(
                                      radius: 25,
                                      child: ClipOval(
                                        child: Image.network(
                                          'https://avatars.githubusercontent.com/u/34376691?v=4',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Observer(builder: (_) {
                                      return Column(
                                        children: [
                                          TextFormField(
                                            autofocus: true,
                                            maxLines: null,
                                            scrollPhysics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                labelStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                                hintStyle: TextStyle(
                                                    color: Colors.black26,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                hintText: LocaleKeys
                                                    .sendFeed_shareYourThought
                                                    .locale),
                                          ),
                                          viewModel.image != null
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  width: context.mediaQuery.size
                                                          .width *
                                                      0.8,
                                                  child: Observer(builder: (_) {
                                                    return Image.file(
                                                      File(
                                                        viewModel.image!.path,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    );
                                                  }),
                                                )
                                              : Container(),
                                        ],
                                      );
                                    }),
                                  )
                                ],
                              ),
                            );
                          }),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            child: Positioned(
                           
                              bottom: context.mediaQuery.viewInsets.bottom > 0
                                  ?  context.mediaQuery.viewInsets.bottom + 10 
                                  : 20,
                              right: 10,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: context.paddingLowHorizontal,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                        ),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal: 0,
                                              vertical: context
                                                      .mediaQuery.size.height *
                                                  0.020),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                context.colors.primary),
                                      ),
                                      child: Icon(Icons.camera_enhance,
                                          color: context.colors.background),
                                      onPressed: () {
                                        showDialog(
                                            barrierDismissible: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                32.0))),
                                                actionsPadding:
                                                    context.paddingNormal,
                                                buttonPadding:
                                                    context.paddingMedium,
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () async {
                                                            try {
                                                              final pickedFile =
                                                                  await await _picker
                                                                      .getImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery,
                                                              );
                                                              viewModel
                                                                  .changeImage(
                                                                      pickedFile);
                                                              Navigator.pop(
                                                                  context);
                                                            } catch (e) {
                                                              print(e);
                                                            }
                                                          },
                                                          icon: Icon(Icons
                                                              .photo_album)),
                                                      IconButton(
                                                          onPressed: () async {
                                                            try {
                                                              final pickedFile =
                                                                  await await _picker.getImage(
                                                                      source: ImageSource
                                                                          .camera,
                                                                      imageQuality:
                                                                          80);
                                                              viewModel
                                                                  .changeImage(
                                                                      pickedFile);
                                                              Navigator.pop(
                                                                  context);
                                                            } catch (e) {
                                                              print(e);
                                                            }
                                                          },
                                                          icon: Icon(
                                                              Icons.camera_alt))
                                                    ],
                                                  )
                                                ],
                                              );
                                            });
                                      }),
                                ),
                              ),
                            ),
                          ),
                          // viewModel.image == null
                          //     ? Spacer(flex: 13)
                          //     : Container()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
