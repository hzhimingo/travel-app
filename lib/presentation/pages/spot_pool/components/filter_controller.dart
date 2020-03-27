import 'package:flutter/widgets.dart';

class FilterController {
  ValueNotifier<int> current;
  ValueNotifier<bool> isOpen;

  FilterController() {
    current = ValueNotifier(0);
    isOpen = ValueNotifier(false);
  }

  open(int index) {
    if (isOpen.value) {
      current.value = index;
    } else {
      isOpen.value = true;
      current.value = index;
    }
  }
}