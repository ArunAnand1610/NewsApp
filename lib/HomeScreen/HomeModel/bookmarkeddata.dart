import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttersocial_app/HomeScreen/HomeModel/newsmodel.dart';
import 'package:fluttersocial_app/HomeScreen/viewlinkpage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jiffy/jiffy.dart';

class ViewBookMarkData extends StatefulWidget {
  const ViewBookMarkData({super.key});

  @override
  State<ViewBookMarkData> createState() => _ViewBookMarkDataState();
}

class _ViewBookMarkDataState extends State<ViewBookMarkData> {
  final dataadd = Hive.box('News_App');
  List<NewsListModel> _item = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = dataadd.keys.map((e) {
    print("My item is:${e}");
      final items = dataadd.get(e);
      print("My item is:${items}");
      return items;
    }).toList();
    setState(() {
      //_item = data.reversed
    });
    
  }

  @override
  Widget build(BuildContext context) {
    print("the name is${_item}");
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: _item.length,
      itemBuilder: (BuildContext context, int index) {
        final newslist = _item[index];
        print("the name is${_item[0].title}");
        return _item.isNotEmpty
            ? Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                margin: const EdgeInsets.only(bottom: 24),
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Hero(
                            tag: 'image-${newslist.urlToImage}',
                            child: CachedNetworkImage(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              imageUrl: newslist.urlToImage,
                              placeholder: (context, url) => Image(
                                image: const AssetImage(
                                    'images/dotted-placeholder.jpg'),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                newslist.title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                newslist.content,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "${Jiffy(newslist.publishedAt).format("dd MMMM yyyy")}",
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12.0)),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewNewsWebpage(
                                              url: newslist.url),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.lightGreen),
                                      child: const Center(
                                        child: Text("View Link"),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("No data available"),
                    TextButton(
                      child: const Text('Retry Now!'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ));
      },
    );
  }
}
