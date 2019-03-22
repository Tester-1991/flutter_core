import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';

class TestImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ///圆形图片
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://picsum.photos/250?image=9",
            ),
            radius: 40.0,
          ),

          ///圆形图片
          ClipOval(
            child: Image.network(
              "https://airspace-test.oss-cn-beijing.aliyuncs.com/247027718087118848/8ecdf25bd2a428cbbe8715e3c1fb84ec.png",
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              fit: BoxFit.fill,
            ),
          ),

          ///圆形图片
          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            foregroundColor: Colors.red,
            child: Text('AH'),
          ),

          ///圆形图片
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://airspace-test.oss-cn-beijing.aliyuncs.com/247027718087118848/8ecdf25bd2a428cbbe8715e3c1fb84ec.png"),
              ),
              shape: BoxShape.circle,
            ),
          ),

          ///圆角图片
          ClipRRect(
            child: Image.network(
              "https://picsum.photos/250?image=9",
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),

          ///圆角图片
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                  'https://picsum.photos/250?image=9',
                ),
              ),
            ),
          ),

          ///缓存图片
          FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/250?image=9'),

          ///普通网络图片
          Image.network(
            "https://airspace-test.oss-cn-beijing.aliyuncs.com/247027718087118848/8ecdf25bd2a428cbbe8715e3c1fb84ec.png",
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),

          ///本地资源图片
          Image.asset(
            'assets/images/hongqi.jpeg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),

          ///缓存图像
          CachedNetworkImage(
            imageUrl:
                "https://airspace-test.oss-cn-beijing.aliyuncs.com/247027718087118848/8ecdf25bd2a428cbbe8715e3c1fb84ec.png",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            fadeOutDuration: Duration(seconds: 1),
            fadeInDuration: Duration(seconds: 2),
          ),

          ///缓存图像
          CachedNetworkImage(
            imageUrl:
                "https://airspace-test.oss-cn-beijing.aliyuncs.com/247027718087118848/8ecdf25bd2a428cbbe8715e3c1fb84ec.png",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
