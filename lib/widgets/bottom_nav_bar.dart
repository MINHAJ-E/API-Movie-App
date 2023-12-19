import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/controller/bottom_bar_provider.dart';
import 'package:movie_app/view/home_screen.dart';
import 'package:movie_app/view/movies_scree.dart';
import 'package:movie_app/view/search_screen.dart';
import 'package:movie_app/view/tv_show.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}
class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomBarProvider>(
      builder: (context, value, child) => Scaffold(
        body: _pages[value.selectedindex],
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 10),
            child: GNav(
              gap: 4,
              onTabChange: (index) {
                context.read<BottomBarProvider>().pageNavigator(index);
              },
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Color.fromARGB(255, 0, 61, 110),
              tabs: [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.search, text: 'Search'),
                GButton(icon: Icons.movie_sharp, text: 'Movie'),
                GButton(icon: Icons.tv_off_sharp, text: 'tv Show'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Widget> _pages = [
  HomeScreen(),
  SearchScreen(),
  MovieScreen(),
  TvShowScreen(),
];
