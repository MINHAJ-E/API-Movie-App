import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/controller/bottom_bar_provider.dart';
import 'package:movie_app/view/pages/home_screen.dart';
import 'package:movie_app/view/pages/movies_scree.dart';
import 'package:movie_app/view/pages/search_screen.dart';
import 'package:movie_app/view/pages/tv_show.dart';
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
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 10),
            child: GNav(
              gap: 4,
              onTabChange: (index) {
                context.read<BottomBarProvider>().pageNavigator(index);
              },
              // backgroundColor:  Color(0xff5b0070),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor:  const Color.fromARGB(92, 31, 0, 92),
              tabs: const [
                GButton(icon: Icons.home, text: 'Home',),
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
  const HomeScreen(),
  const SearchScreen(),
   const MovieScreen(),
  const TvShowScreen(),
];
