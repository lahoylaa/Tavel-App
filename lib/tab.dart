import 'package:flutter/material.dart';
import 'main.dart';

class PubDrawer extends StatefulWidget{
  const PubDrawer({super.key});

  @override
  _myTabState createState() => _myTabState();
}

class _myTabState extends State<PubDrawer>{
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    /* Tab UI */
    /* FIX: Not finished */
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Text('Menu'),
        ),
        ListTile(
            title: const Text('Home'),
            selected: selectedIndex == 0,
            onTap: () {
              onItemTapped(0);
            }),
        ListTile(
            title: const Text('Saved Locations'),
            selected: selectedIndex == 1,
            onTap: () {
              onItemTapped(1);
            }),
        ListTile(
            title: const Text('Account Settings'),
            selected: selectedIndex == 2,
            onTap: () {
              onItemTapped(2);
            }),
        ListTile(
            title: const Text('Sign Out'),
            selected: selectedIndex == 3,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const MyApp();
                  },
                ),
                (route) => false,
              );
            })
      ],
    ));
  }
}