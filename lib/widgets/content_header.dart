import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import '../assets.dart';

class ContentHeader extends StatefulWidget {
  final List imgSlider;

  const ContentHeader({Key key, this.imgSlider}) : super(key: key);
  @override
  _ContentHeaderState createState() => _ContentHeaderState();
}

class _ContentHeaderState extends State<ContentHeader> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int slideIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Carousel(
              autoplayDuration: const Duration(seconds: 8),
              showIndicator: false,
              onImageChange: (index, idx) {
                setState(() {
                  slideIndex = idx;
                });
              },
              images: widget.imgSlider,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(widget.imgSlider, (index, url) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: slideIndex == index ? Colors.red : Colors.grey,
                      ),
                    );
                  }),
                ),
                GestureDetector(
                  onTap: () => print('Sign Up Button Pressed'),
                  child: Text('Lihat Semua Promo', style: Assets.styleSubTitle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
