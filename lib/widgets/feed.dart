import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: Image.asset(
            'assets/images/cat.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(CupertinoIcons.heart),
              onPressed: () {},
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
                '2 likes',
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
                      text: 'tastycreamery',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' Valentines Day would be extra sweet this year if everyone gave out ice cream bouquets!',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'FEBRUARY 6',
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
