import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String s = "Welcome";
  int currentIndex = 0;
  List<String> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Let's Make a Note",
            style: TextStyle(color: Colors.white, shadows: [
              Shadow(color: Colors.black),
              Shadow(color: Colors.white)
            ]),
          ),
        ),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: currentIndex,
        onTabTapped: (int index) async {
          if (index == 1) {
            List<String>? result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NextPage()),
            );

            if (result != null) {
              setState(() {
                itemList.addAll(result);
              });
            }
          }
        },
      ),
      body: Center(
        child: itemList.isEmpty
            ? const Text(
                "Welcome to Notes",
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(color: Colors.black),
                  Shadow(color: Colors.white)
                ]),
              )
            : ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: const CircleBorder(eccentricity: 0),
                    textColor: Colors.white,
                    hoverColor: Colors.black,
                    titleTextStyle: const TextStyle(fontSize: 20, shadows: [
                      Shadow(color: Colors.white),
                      Shadow(color: Colors.black)
                    ]),
                    visualDensity: const VisualDensity(
                        horizontal: sqrt1_2, vertical: sqrt1_2),
                    title: Text(itemList[index]),
                  );
                },
              ),
      ),
      drawer: const Drawer(
        elevation: 100,
        shadowColor: Colors.black,
        backgroundColor: Colors.black,
        child: Column(
          children: [
            ColoredBox(
              color: Colors.white,
            ),
            UserAccountsDrawerHeader(
              accountName: Text(
                'Sherma Thangam S',
                style: TextStyle(
                  color: Colors.black,
                  shadows: [
                    Shadow(color: Colors.black),
                    Shadow(color: Colors.white)
                  ],
                ),
              ),
              accountEmail: Text(
                "sst@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                  shadows: [
                    Shadow(color: Colors.black),
                    Shadow(color: Colors.white)
                  ],
                ),
              ),
              arrowColor: Colors.white,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.headphones_outlined, color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(color: Colors.black),
                  Shadow(color: Colors.white)
                ]),
              ),
              leading: Icon(Icons.home_outlined, color: Colors.white),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(color: Colors.black),
                  Shadow(color: Colors.white)
                ]),
              ),
              leading: Icon(Icons.face, color: Colors.white),
            ),
            Divider(
              height: 0.3,
            ),
            ListTile(
              title: Text(
                "Events",
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(color: Colors.black),
                  Shadow(color: Colors.white)
                ]),
              ),
              leading:
                  Icon(Icons.event_available_outlined, color: Colors.white),
            ),
            Divider(
              height: 0.3,
            ),
            ListTile(
              title: Text(
                "Notification",
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(color: Colors.black),
                  Shadow(color: Colors.white)
                ]),
              ),
              leading: Icon(Icons.notifications_active_outlined,
                  color: Colors.white),
            ),
            Divider(
              height: 0.3,
            ),
            ListTile(
              title: Text(
                "Version  1.0.0",
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(color: Colors.black),
                  Shadow(color: Colors.white)
                ]),
              ),
            ),
            Divider(
              height: 0.3,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);
  final int currentIndex;
  final ValueChanged<int> onTabTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 59,
      selectedFontSize: 20,
      unselectedItemColor: Colors.black,
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            backgroundColor: Colors.black,
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_comment_outlined, color: Colors.black),
            label: "Add",
            backgroundColor: Colors.black),
      ],
      currentIndex: currentIndex,
      onTap: onTabTapped,
    );
  }
}

class NextPage extends StatelessWidget {
  final TextEditingController inputController = TextEditingController();

  NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add notes'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: inputController,
              decoration: const InputDecoration(
                hintText: 'Enter a note',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String newItem = inputController.text;
              Navigator.pop(context, [newItem]);
            },
            child: const Text('Add Item'),
          ),
        ],
      ),
    );
  }
}
