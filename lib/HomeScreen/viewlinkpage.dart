import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:path_provider/path_provider.dart';

class ViewNewsWebpage extends StatefulWidget {
  final String url;
  const ViewNewsWebpage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  _ViewNewsWebpageState createState() => _ViewNewsWebpageState();
}

class _ViewNewsWebpageState extends State<ViewNewsWebpage> {
  String? localPath;
  bool loading = true;

  String? localpath1;
  late InAppWebViewController _webViews;
  InAppWebView? webViews;

  var pptinfo = {};
  @override
  void initState() {
    super.initState();

    setState(() {
      localPath = widget.url;
    });
    print("mypath $localpath1");

    webViews = InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(localPath!)),
      onReceivedServerTrustAuthRequest: (controller, challenge) async {
        print(challenge);
        print("loaing$loading");
        controller = _webViews;
        return ServerTrustAuthResponse(
            action: ServerTrustAuthResponseAction.PROCEED);
      },
    );
  }

  var indexes = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
                body: localPath != null
                    ? RefreshIndicator(
                        onRefresh: () async {
                          await Future.delayed(
                              const Duration(seconds: 1));
                        },
                        child: webViews!)
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
    );
  }
}
