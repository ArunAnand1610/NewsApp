import 'dart:convert';
import 'dart:io';
import 'package:fluttersocial_app/core/networkutils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

Future getsubNews() async {
  String? apiKey = "bcc70c0546254b1c8323d10cb8a12cdb";

  var url =
      "https://newsapi.org/v2/everything?q=apple&from=2023-03-16&to=2023-03-16&sortBy=popularity&apiKey=${apiKey}";
  return handleResponse(await http.get(
    Uri.parse(url),
  ));
}
