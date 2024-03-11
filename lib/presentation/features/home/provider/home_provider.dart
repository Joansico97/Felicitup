import 'package:felicitup/core/router/router.dart';
import 'package:felicitup/infraestructure/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_provider.freezed.dart';
part 'home_provider.g.dart';

final homeProvider = StateNotifierProvider<HomeFeatureEvents, HomeFeatureModel>(
  (ref) => HomeFeatureEvents(ref),
);

@freezed
class HomeFeatureModel with _$HomeFeatureModel {
  const factory HomeFeatureModel({
    required String uid,
    required int currentIndex,
    required List<bool> listBoolsTap,
  }) = _HomeFeatureModel;

  factory HomeFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$HomeFeatureModelFromJson(json);
}

class HomeFeatureEvents extends StateNotifier<HomeFeatureModel> {
  HomeFeatureEvents(this.ref)
      : super(
          const HomeFeatureModel(
            uid: '',
            currentIndex: 0,
            listBoolsTap: [
              true,
              false,
              false,
            ],
          ),
        );

  final Ref ref;
  final PageController pageController = PageController();

  Future<void> getUid() async {
    final uid = await ref.read(userProvider).getUserId();
    uid.fold((left) => '', (right) => state = state.copyWith(uid: right));
  }

  void logOut() {
    ref.read(userProvider).logOut();
    ref.read(routerProvider).go(RouterPaths.home);
  }

  void changeActive(int index) {
    final listProv = [...state.listBoolsTap];
    for (var i = 0; i < listProv.length; i++) {
      listProv[i] = false;
    }
    listProv[index] = true;
    pageController.jumpToPage(index);
    state = state.copyWith(listBoolsTap: listProv);
  }

  void changePage(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
