import 'package:flutter/material.dart';
class AppIcon {

  static String _path = 'assets/images';

  static Image homeOutline = _outlineIcon(path: '$_path/home_out.png');
  static Image home = _icon(path: '$_path/home.png');

  static Image clipOutline = _outlineIcon(path: '$_path/shorts_out.png');
  static Image clip = _icon(path: '$_path/shorts.png');

  static Image subscribeOutline = _outlineIcon(path: '$_path/subscribe_out.png');
  static Image subscribe = _icon(path: '$_path/subscribe.png');

  static Image personOutline = _outlineIcon(path: '$_path/person_out.png');
  static Image person = _icon(path: '$_path/person.png');


  static Image saveOutline = _outlineIcon(path: '$_path/save_out.png',size: 20,color: Colors.blueGrey);
  static Image save = _icon(path: '$_path/save.png',size: 20,color: Colors.blueGrey);

  static Image share = _icon(path: '$_path/share.png',size: 20,color: Colors.blueGrey);

  static Image _outlineIcon({required String path, double? size,Color? color}){
    return Image.asset(path,width: size??24,color: color??Colors.blueGrey,);
  }

  static Image _icon({required String path, double? size,Color? color}){
    return Image.asset(path,width: size??24,color: color??Colors.blue,);
  }

}