import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/widgets/feed.dart';

// dart에서는 main() 함수를 호출하도록 약속되어 있습니다.
void main() {
  // runApp() 함수는 전달받은 Widget을 루트로 만듭니다.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // build 함수는 하위 Widget을 반환합니다.
  @override
  Widget build(BuildContext context) {
    // AOS의 Material 디자인을 기본으로 구현합니다.
    return MaterialApp(
      title: 'instagram',
      debugShowCheckedModeBanner: false,
      // home은 처음 시작하는 위젯을 의미합니다.
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold는 기본적인 레이아웃의 기본을 잡아줍니다.
    return Scaffold(
      // appBar : 상단의 띠
      // appBar는 Scaffold 밑에 넣어주시면 됩니다.
      appBar: AppBar(
        // assets/images 밑에 저장한 인스타그램 로고를 불러옵니다
        title: Image.asset(
          'assets/images/logo.png',
          height: 32,
        ),
        // 배경 색상을 흰색으로
        backgroundColor: Colors.white,
        // AppBar의 왼쪽(leading)에 카메라 아이콘 버튼을 만들어요
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.camera,
            color: Colors.black,
          ),
          onPressed: () {}, // 클릭 이벤트를 받는 함수인데, 일단 비워둡시다.
        ),
        // AppBar의 오른쪽에는 여러개의 버튼이 올 수 있어서 actions라는 배열로 표시해요
        actions: [
          // 종이비행기 아이콘 버튼
          IconButton(
            icon: Icon(
              CupertinoIcons.paperplane,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      // body : appBar 하단 부분
      body: ListView.builder(
        // builder의 경우 동적으로 아이템을 생성합니다.
        itemCount: 5, // 전체 아이템의 개수
        itemBuilder: (context, index) {
          return Feed(); // 각 index 별 Feed
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, // 선택된 버튼의 label 안보이게
        showUnselectedLabels: false, // 선택되지 않은 버튼의 label 안보이게
        selectedItemColor: Colors.black, // 선택된 아이콘 색상
        unselectedItemColor: Colors.grey.withOpacity(0.5), // 선택되지 않은 아이콘 색상
        type: BottomNavigationBarType.fixed, // fixed로 하면 모든 버튼의 간격을 동일하게 (shifting으로 하면 선택된 버튼이 크게 보임)
        items: [
          // 각각의 버튼들
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.house_fill), label: 'home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.camera), label: 'camera'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: 'favorite'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'person'),
        ],
      ),
    );
  }
}
