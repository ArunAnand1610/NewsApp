

import 'package:flutter/material.dart';
import 'package:fluttersocial_app/HomeScreen/HomeModel/newsmodel.dart';

class NewsProvider extends ChangeNotifier{
   List<NewsListModel> subchapdata = [];

  List<NewsListModel> get getsubchapter => subchapdata;

  set subchap(List<NewsListModel> subchaplist) {
    subchapdata = subchaplist;
    notifyListeners();
  }
}