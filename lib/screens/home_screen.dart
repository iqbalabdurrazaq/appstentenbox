import 'package:appstentenbox/cubits/cubits.dart';
import 'package:appstentenbox/data/dataSample.dart';
import 'package:appstentenbox/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 65),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
            return CustomAppBar(
              scrollOffset: scrollOffset,
            );
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(
              imgSlider: [
                AssetImage(Assets.banner1),
                AssetImage(Assets.banner2),
                AssetImage(Assets.banner3),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 2.0),
            sliver: SliverToBoxAdapter(
              child: Restaurants(
                key: PageStorageKey('restaurants'),
                title: 'Restaurants',
                subtitle: 'Selengkapnya',
                contentList: restaurants,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('recomendationProducts'),
              title: 'Recommendation Products',
              subtitle: 'Selengkapnya',
              contentList: productsRecomendaion,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('productsPlatinum'),
              title: 'Products Platinum',
              subtitle: 'Selengkapnya',
              contentList: productsSilver,
            ),
          ),
          SliverToBoxAdapter(
            key: PageStorageKey('productsGold'),
            child: ContentList(
              title: 'Products Gold',
              subtitle: 'Selengkapnya',
              contentList: productsSilver,
            ),
          ),
          SliverToBoxAdapter(
            key: PageStorageKey('productsSilver'),
            child: ContentList(
              title: 'Products Silver',
              subtitle: 'Selengkapnya',
              contentList: productsSilver,
            ),
          ),
        ],
      ),
    );
  }
}
