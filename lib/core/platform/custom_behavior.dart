import 'dart:io';

import 'package:flutter/cupertino.dart';

class CutsomBehavior extends ScrollBehavior {
@override
 Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if(Platform.isAndroid||Platform.isFuchsia){
     return child;
  }else{
    return super.buildViewportChrome(context,child,axisDirection);
    }
 }

}