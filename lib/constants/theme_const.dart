import 'package:flutter/cupertino.dart';

TextStyle overfLowTextStyle(
        {required double deviceWidth, required double deviceHeight}) =>
    TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: deviceWidth > 400 ? 18.0 : 12.0);
