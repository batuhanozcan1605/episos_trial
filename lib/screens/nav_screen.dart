import 'package:episos_trial/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = {
    "Home" : Icons.home,
    "Notifications" : Icons.notifications,
     "Profile" : Icons.person,
};

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0x6603101a),
        items: _icons
          .map((title, icon) => MapEntry(title,
        BottomNavigationBarItem(
            icon: Icon(icon, size: 30.0),
            label: title,
          )
        )
       ).values.toList(),
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFFDEB992),
        unselectedItemColor: Colors.white54,
        onTap: (index) => setState(() {
          _currentIndex = index;
        },
        ),
      ),
    );
  }
}
