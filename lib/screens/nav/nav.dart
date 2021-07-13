import 'package:animalapp/screens/favorite_animals/bloc/favorite_bloc.dart';
import 'package:animalapp/screens/favorite_animals/favrite_animals.dart';
import 'package:animalapp/screens/home/home.dart';
import 'package:animalapp/screens/more/more.dart';
import 'package:animalapp/screens/search_page/cubit/search_cubit.dart';
import 'package:animalapp/screens/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavView extends StatefulWidget {
  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: SearchPage(),
    ),
    BlocProvider(
      create: (context) => FavoriteBloc()..add(LoadFavorite()),
      child: FavoriteAnimals(),
    ),
    More(),
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        icon: Icon(Icons.home),
        activeColorPrimary: Colors.greenAccent.shade400,
        title: ("Home"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        icon: Icon(Icons.search),
        activeColorPrimary: Colors.greenAccent.shade400,
        title: ("Search"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        icon: Icon(Icons.favorite),
        activeColorPrimary: Colors.greenAccent.shade400,
        title: ("Saved"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        icon: Icon(Icons.account_circle),
        activeColorPrimary: Colors.greenAccent.shade400,
        title: ("Profile"),
      ),
    ];
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        this.context,
        controller: _controller,
        screens: _widgetOptions,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.grey.shade900,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }
}
