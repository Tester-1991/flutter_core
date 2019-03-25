import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ASSwipter extends StatefulWidget {
  @override
  _ASSwipterState createState() => _ASSwipterState();
}

class _ASSwipterState extends State<ASSwipter> {
  List<String> urlList = [];

  @override
  void initState() {
    super.initState();

    urlList.add(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554108733&di=550833f022d3656990d1847456c1e6c8&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fitbbs%2F1502%2F16%2Fc43%2F3135816_1424086014931_mthumb.jpg");
    urlList.add(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554108733&di=550833f022d3656990d1847456c1e6c8&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fitbbs%2F1502%2F16%2Fc43%2F3135816_1424086014931_mthumb.jpg");
    urlList.add(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554108733&di=550833f022d3656990d1847456c1e6c8&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fitbbs%2F1502%2F16%2Fc43%2F3135816_1424086014931_mthumb.jpg");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Swiper Example'),
      ),
      body: Container(
        width: double.infinity,
        height: 180.0,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              urlList.elementAt(index),
              fit: BoxFit.fill,
            );
          },
          itemCount: urlList.length,
          pagination: new SwiperPagination(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              activeColor: Colors.black,
              space: 5.0,
            ),
          ),
          control: SwiperControl(
            color: Colors.black,
            disableColor: Colors.white,
            iconPrevious: Icons.arrow_left,
            iconNext: Icons.arrow_right,
          ),
          autoplay: true,
        ),
      ),
    );
  }
}
