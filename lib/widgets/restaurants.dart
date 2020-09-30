import 'package:appstentenbox/models/content_model.dart';
import 'package:flutter/material.dart';
import '../assets.dart';

class Restaurants extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Content> contentList;

  const Restaurants({Key key, this.title, this.subtitle, this.contentList})
      : super(key: key);

  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: Assets.styleFont2,
              ),
              GestureDetector(
                onTap: () {
                  print('Selengkapnya');
                },
                child: Text(
                  widget.subtitle,
                  style: Assets.styleSubTitle,
                ),
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            scrollDirection: Axis.horizontal,
            itemCount: widget.contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = widget.contentList[index];
              return GestureDetector(
                onTap: () {
                  print(content.name);
                },
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                        // border: Border.all(color: Colors.white, width: 1.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6.0,
                            offset: new Offset(0.0, 2.8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
