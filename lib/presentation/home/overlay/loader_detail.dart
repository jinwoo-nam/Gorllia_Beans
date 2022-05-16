import 'package:flutter/material.dart';

class LoaderDetail {
  static final LoaderDetail appLoader = LoaderDetail();
  ValueNotifier<bool> loaderShowingNotifier = ValueNotifier(false);
  ValueNotifier<String> loaderTextNotifier = ValueNotifier('error message');

  void showLoader() {
    loaderShowingNotifier.value = true;
  }

  void hideLoader() {
    loaderShowingNotifier.value = false;
  }

  void setImage() {
    // same as that of setText //
  }
}
