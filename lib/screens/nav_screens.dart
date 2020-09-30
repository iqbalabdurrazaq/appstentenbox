import 'package:appstentenbox/cubits/app_bar/app_bar_cubit.dart';
import 'package:appstentenbox/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int _currentIndex = 0;

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Playlist': Icons.queue_play_next,
    'Subscribe': Icons.subscriptions,
    'Profile': Icons.account_circle
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.redAccent,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11.5,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 11.5,
        onTap: (index) => setState(() => _currentIndex = index),
        items: _icons
            .map(
              (title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                  icon: Icon(
                    icon,
                    size: 28.0,
                  ),
                  title: Text(
                    title,
                    style:
                        TextStyle(fontSize: 11.5, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
