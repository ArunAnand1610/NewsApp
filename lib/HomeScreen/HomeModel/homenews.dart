import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttersocial_app/HomeScreen/HomeModel/bookmarkeddata.dart';
import 'package:fluttersocial_app/HomeScreen/HomeModel/newsmodel.dart';
import 'package:fluttersocial_app/HomeScreen/viewlinkpage.dart';
import 'package:fluttersocial_app/Provider/newsprovider.dart';
import 'package:fluttersocial_app/core/apiservice.dart';
import 'package:fluttersocial_app/shared/shimmer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeNews extends StatefulWidget {
  const HomeNews({super.key});

  @override
  State<HomeNews> createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  bool _loading = false;
  final bool _articleExists = true;
  late List<NewsListModel> newsdata;
  final dataadd = Hive.box('News_App');
  List<NewsListModel> _item = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() {
    getsubNews().then((value) {
      print("my datat${value["articles"]}");
      context.read<NewsProvider>().subchap =
          List<Map<String, dynamic>>.from(value["articles"])
              .map((e) => NewsListModel.fromJson(e))
              .toList();

      print("Here comes");
      setState(() {
        _loading = true;
      });
      print("Here comes");
    });
  }

  Future<void> _createItem(NewsListModel newitem) async {
    await dataadd.add(newitem);
  }

  @override
  Widget build(BuildContext context) {
    final List<NewsListModel> getnewsdetails =
        context.watch<NewsProvider>().subchapdata;
    return _loading == false
        ? Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ShimmerNewsTile();
              },
            ),
          )
        : RefreshIndicator(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: getnewsdetails.length,
              itemBuilder: (BuildContext context, int index) {
                final newslist = getnewsdetails[index];
                return getnewsdetails.isNotEmpty
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
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        newslist.title,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
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
                                                  color: Colors.grey,
                                                  fontSize: 12.0)),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewNewsWebpage(
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
                                          InkWell(
                                            onTap: () {
                                              _item.add(NewsListModel(
                                                  author: newslist.author,
                                                  content: newslist.content,
                                                  description:
                                                      newslist.description,
                                                  publishedAt:
                                                      newslist.publishedAt,
                                                  source: newslist.source,
                                                  title: newslist.title,
                                                  url: newslist.url,
                                                  urlToImage:
                                                      newslist.urlToImage));
                                              dataadd.add(_item);
                                              
                                              
                                              print(
                                                  "My data is:${dataadd}");
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.lightGreen),
                                              child: const Center(
                                                child: Text("Add BookMark"),
                                              ),
                                            ),
                                          )
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
                              onPressed: () {
                                getNews();
                              },
                            ),
                          ],
                        ),
                      ));
              },
            ),
            onRefresh: () => getNews(),
          );
  }
}
