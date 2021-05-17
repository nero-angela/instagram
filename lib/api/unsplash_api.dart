import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/models/feed_model.dart';

// UnsplashAPI class는 static 메소드와 속성을 갖도록 구현합니다.
// static으로 된 메소드나 속성은 class 인스턴스를 만들지 않고도 접근할 수 있습니다.
class UnsplashAPI {
  // Unsplash에서 발급받은 access key를 입력해주세요.
  // _로 시작하는 변수는 private 변수로 해당 class 밖에서는 호출할 수 없습니다. (내부에서만 쓰이는 변수를 만들 때 사용)
  static final _accessKey = env['UNSPLASH_ACCESS_KEY'];
  static final _headers = {"Authorization": "Client-ID ${_accessKey}"};

  // class 하위에 static 메소드로 구현시, 사용하는 곳에서 메소드명을 중복되지 않고 아래와 같이 호출하여 쓸 수 있습니다.
  // UnsplashAPI.getFeedModels();
  static Future<List<FeedModel>?> getFeedModels({int page = 1}) async {
    final url = Uri.parse('https://api.unsplash.com/photos?page=$page');

    // GET 메소드로 통신하며, headers에 인증키를 전달합니다.
    // http 통신 요청에 대한 응답이 res 변수에 담깁니다.
    final res = await http.get(url, headers: _headers);
    
    if (res.statusCode == 200) {
      // success
			// jsonString인 res.body를 decode를 통해 dart의 데이터 타입으로 파싱합니다.
      final jsonList = json.decode(res.body);
      final List<FeedModel> feedModels = []; // 최종 응답해줄 FeedModel List를 생성합니다.

      // Postman에서 본 응답 결과가 배열로 넘어오기 때문에, 반복문을 돌립니다.
			for (final json in jsonList) {
				// 하나씩 배열의 원소를 꺼내서 FeedModel로 파싱한 뒤 feedModels에 추가합니다.
        feedModels.add(FeedModel.fromJson(json));
      }
      return feedModels;
    } else {
      // fail
      print('error ${res.statusCode} / ${res.body}');
      return null;
    }
  }
}
