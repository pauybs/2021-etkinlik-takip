import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  @observable
  TabController? tabController;

  @observable
  int isTabSelectedValue = 1;

  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
