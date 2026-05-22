import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../pertemuan/pertemuan8.dart';
import '../pertemuan/pertemuan9.dart';
import 'profile.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Beranda"),
            selectedColor: Colors.deepPurple,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> meetings = [
      {
        "title": "Pertemuan 8",
        "icon": Icons.auto_awesome,
        "page": const AutocompletespinPage(),
      },
      {
        "title": "Pertemuan 9",
        "icon": Icons.date_range,
        "page": const Pertemuan9Page(),
      },
      {
        "title": "Pertemuan 10",
        "icon": Icons.mobile_friendly,
      },
      {
        "title": "Pertemuan 11",
        "icon": Icons.code,
      },
      {
        "title": "Pertemuan 12",
        "icon": Icons.storage,
      },
      {
        "title": "Pertemuan 13",
        "icon": Icons.cloud,
      },
      {
        "title": "Pertemuan 14",
        "icon": Icons.school,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mobile Programming Online",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: meetings.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = meetings[index];

            return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                if (item["page"] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => item["page"],
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${item["title"]} belum tersedia"),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple,
                      Colors.purple.shade400,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item["icon"],
                      color: Colors.white,
                      size: 50,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      item["title"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}