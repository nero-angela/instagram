import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/page/camera_page.dart';
import 'package:instagram/page/favorite_page.dart';
import 'package:instagram/page/home_page.dart';
import 'package:instagram/page/my_page.dart';
import 'package:instagram/page/search_page.dart';

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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 현재 활성화된 탭의 index를 기록해두는 변수
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold는 기본적인 레이아웃의 기본을 잡아줍니다.
    return Scaffold(
      // body : appBar 하단 부분
      body: IndexedStack(
        // selectedIndex에 해당하는 위젯이 최상위에 노출됩니다.
        index: selectedIndex,
        // children의 순서가 중요합니다.
        children: [
          HomePage(),
          SearchPage(),
          // 순서를 유지하기 위해 CameraPage 대신 빈 컨테이너를 넣어줍니다.
          Container(),
          FavoritePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 현재 활성화된 탭 index
        currentIndex: selectedIndex,
        // 탭 선택시 호출되는 함수로 선택된 탭의 index가 넘어옵니다.
        onTap: (index) {
          // camera index
          final cameraPageIndex = 2;
          if (index == cameraPageIndex) {
            // CameraPage 띄우기
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraPage()),
            );
          } else {
            // selectedIndex를 유저가 선택한 index로 업데이트하고, setState로 화면 갱신을 요청합니다.
            return setState(() => selectedIndex = index);
          }
        },
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
