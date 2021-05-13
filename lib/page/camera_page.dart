import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 뒤로가기 버튼 색상 변경
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'camera',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('camera page'),
      ),
    );
  }
}
