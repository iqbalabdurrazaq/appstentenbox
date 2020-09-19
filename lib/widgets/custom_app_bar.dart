import 'dart:ui';
import 'package:flutter/material.dart';
import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      color:
          Colors.red.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(
                    left: 5.0, right: 5.0, bottom: 10.0, top: 5.0),
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    shape: BoxShape.rectangle),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Image.asset(
                      "assets/images/icons/search2.png",
                      height: 22.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      left: 10.0,
                    )),
                    Padding(
                      padding: EdgeInsets.only(top: 1.0),
                      child: Text("Search", style: Assets.styleFont2),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(
                  Icons.shopping_cart,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
