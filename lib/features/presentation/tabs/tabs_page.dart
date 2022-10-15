import 'package:flutter/material.dart';

// Tabs
import 'package:delivery/features/presentation/tabs/explore_tab/View/explore_tab.dart';
import 'package:delivery/features/presentation/tabs/favourite_tab/View/favourite_tab.dart';
import 'package:delivery/features/presentation/tabs/my_order_tab/View/my_order_tab.dart';
import 'package:delivery/features/presentation/tabs/profile_tab/View/profile_tab.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  // Tabs array options
  final List<Widget> _widgetOptions = [
    const ExploreTab(),
    const MyOrderTab(),
    const FavouriteTab(),
    const ProfileTab()
  ];

  // Select item from my list (array)
  int _selectedItemIndex = 0;

  // Change widget
  void _changeWidget(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  // Widget box items
  Widget _bottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    iconSize: 30.0,
    selectedItemColor: Theme.of(context).colorScheme.secondary,
    unselectedItemColor: Colors.grey,
    currentIndex: _selectedItemIndex, // Render a page tab: 0,1,2,3
    onTap: _changeWidget,
    showUnselectedLabels: true,
    // Automatically detect position when doing onTap
    items: const <BottomNavigationBarItem>[ 
      BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explorar'),
      BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Mi pedido'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
      BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'Mi Perfil')
    ],
  );
}
}


