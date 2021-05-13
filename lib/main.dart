import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text('Instagram')),
      // body : appBar 하단 부분
      body: Center(
        child: Text('👋 Welcome'),
      ),
    );
  }
}
