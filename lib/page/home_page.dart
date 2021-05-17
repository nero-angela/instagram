import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/api/unsplash_api.dart';
import 'package:instagram/models/feed_model.dart';
import 'package:instagram/page/camera_page.dart';
import 'package:instagram/widgets/feed.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 화면에 보여줄 feedModel 목록
  List<FeedModel> _feedModels = [];

  // 현재 page
  int _page = 1;

  @override
  void initState() { 
    super.initState();
    // 페이지가 시작될 때 feedModel 불러오도록 호출
    fetchFeedModels(_page);
  }

  // feedModel 불러오기 함수
  void fetchFeedModels(int page) async {
    final feedModels = await UnsplashAPI.getFeedModels(page: page);
    if (feedModels != null) {
      print('fetch feed models : page = $page, total = ${feedModels.length}');
      setState(() => _feedModels.addAll(feedModels));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 32,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.camera,
            color: Colors.black,
          ),
          onPressed: () {
            // CameraPage 띄우기
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraPage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.paperplane,
              color: Colors.black,
            ),
            onPressed: () async {
              final feedModels = await UnsplashAPI.getFeedModels();
              if (feedModels != null) {
                print(feedModels[0].likes);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _feedModels.length,
        itemBuilder: (context, index) {
          return Feed(feedModel: _feedModels[index]);
        },
      ),
    );
  }
}
