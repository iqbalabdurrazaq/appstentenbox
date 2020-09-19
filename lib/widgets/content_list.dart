import 'package:appstentenbox/models/content_model.dart';
import 'package:flutter/material.dart';
import '../assets.dart';

class ContentList extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Content> contentList;

  const ContentList({Key key, this.title, this.subtitle, this.contentList})
      : super(key: key);
  @override
  _ContentListState createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
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
          height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.only(bottom: 25.0),
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
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Stack(
                    children: [
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              content.imageUrl,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              content.name,
                              style: Assets.styleSubTitle,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 2.0,
                        top: 25.0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.026,
                          width: MediaQuery.of(context).size.width * 0.16,
                          decoration: new BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3.5),
                            boxShadow: <BoxShadow>[
                              new BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                offset: new Offset(1.5, 1.5),
                              ),
                            ],
                          ),
                          child: Text(
                            content.categoryShop,
                            style: Assets.styleCategory,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10.0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.12,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(content.restaurantsUrl),
                              fit: BoxFit.contain,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.0),
                            boxShadow: <BoxShadow>[
                              new BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                offset: new Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
