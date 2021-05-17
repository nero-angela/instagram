import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/models/feed_model.dart';
import 'package:intl/intl.dart';

class Feed extends StatefulWidget {
  const Feed({
    Key? key,
    required this.feedModel,
  }) : super(key: key);

  final FeedModel feedModel;

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          // 이미지 url을 화면에 보여줄 때 Image.network를 사용합니다.
          child: Image.network(
            widget.feedModel.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                CupertinoIcons.heart,
                // likedByUser의 상태에 따라 색상을 다르게 보여줍니다.
                color: widget.feedModel.likedByUser ? Colors.pinkAccent : Colors.black,
              ),
              onPressed: () {
                // 버튼을 클릭하는 경우, 상태가 변경되기 때문에 setState를 통해 화면을 갱신합니다.
                setState(() {
                  // likedByUser
                  widget.feedModel.likedByUser = !widget.feedModel.likedByUser;
                  if (widget.feedModel.likedByUser) {
                    // likedByUser가 true로 바뀐 경우 likes를 1 증가시킵니다.
                    widget.feedModel.likes += 1;
                  } else {
                    // likedByUser가 false로 바뀐 경우 likes를 1 감소시킵니다.
                    widget.feedModel.likes -= 1;
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(CupertinoIcons.chat_bubble),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(CupertinoIcons.paperplane),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(CupertinoIcons.bookmark),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.feedModel.likes} likes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: widget.feedModel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' ${widget.feedModel.description}',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${DateFormat('MMMM dd').format(widget.feedModel.createdAt)}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
