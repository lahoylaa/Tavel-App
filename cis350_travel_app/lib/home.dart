import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _myHomeState createState() => _myHomeState();
}

class _myHomeState extends State<Home> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Travel App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.blue,
          centerTitle: true,

          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.menu),
          //     color: Colors.white,
          //     onPressed: (){
          //       // Do something
          //       Scaffold.of(context).openDrawer();
          //     }
          //   )
          // ]
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('Drawer Header'),
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
                })
          ],
        )),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/testpic1.jpg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Explore',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
