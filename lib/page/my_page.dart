import 'package:flutter/material.dart';
import 'package:instagram/widgets/statistic.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  final List<String> dummyUrls = [
    'https://images.unsplash.com/photo-1594000033503-51ac2b9adf7b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218fHx8fHx8fHwxNjIwNjMzMDg5&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit',
    'https://images.unsplash.com/photo-1599277062739-e1878f97c79a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218fHx8fHx8fHwxNjIwNjMzMDg0&ixlib=rb-1.2.1&q=80&w=1080&utm_source=unsplash_source&utm_medium=referral&utm_campaign=api-credit',
    'https://images.unsplash.com/photo-1618826600407-504c12fe83a4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
    'https://images.unsplash.com/photo-1618130087539-48980a31d2cd?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
    'https://images.unsplash.com/photo-1619958405058-7acc496227db?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
    'https://images.unsplash.com/photo-1619590495690-c6e26ee899ff?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
    'https://images.unsplash.com/photo-1619843010095-9933770bd91d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
    'https://images.unsplash.com/photo-1619233450241-e3b85ff1547d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevStory', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0, // appbar의 높이를 0으로 해주면 그림자가 사라집니다.
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
										// CircleAvatar는 원형 이미지를 만들기 좋습니다.
                    CircleAvatar(
                      radius: 38,
                      backgroundImage: Image.asset('assets/images/cat.jpg').image,
                    ),
										// ContentCount는 직접 만든 위젯입니다!
                    Expanded(child: Statistic(count: '669', title: '게시물')),
                    Expanded(child: Statistic(count: '1,613만', title: '팔로워')),
                    Expanded(child: Statistic(count: '0', title: '팔로잉')),
                  ],
                ),
                SizedBox(height: 16),
                Text('Nero', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          SizedBox(height: 8),
					// Expanded는 child가 남은 공간을 최대한 확장하여 차지하도록 해줍니다.
          Expanded(
						// GridView는 타일 형태의 레이아웃을 쉽게 구성하도록 도와줍니다.
            child: GridView.count(
              crossAxisCount: 3, // 세로 라인 수
							// List.generate 문법이 궁금하면 dart List.generate라고 검색해보세요!
              children: List.generate(100, (index) {
                return Container(
                  // 이미지에 검정색 테두리를 넣었어요.
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Image.network(
										// index가 dummyUrls 보다 넘치지 않도록 dummyUrls.length로 나눈 나머지값을 index로 합니다.
                    dummyUrls[index % dummyUrls.length],
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
