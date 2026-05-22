import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER =================
            Stack(
              clipBehavior: Clip.none,
              children: [
                // FOTO SAMPUL
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/sampulikan.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // FOTO PROFILE
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profilnemo.jpg'),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // NAMA
            const Text(
              "Siti Naylani Safitri",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "NIM: 241011700831",
              style: TextStyle(color: Colors.grey),
            ),

            const Text(
              "Kelas: 04SIFE009",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            // ABOUT ME
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            "About Me",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "A graduated of Office Management Vocational High School who is currently pursuing a Bachelor's degree in Information Systems at Pamulang University. Experienced as a Business Development and Business Development Admin in a construction company.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // INFORMATION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  infoItem(Icons.email, "naylanisafitri@gmail.com"),
                  infoItem(Icons.phone, "+62 812-9974-0373"),
                  infoItem(Icons.cake, "19 Agustus 2006"),
                  infoItem(Icons.work, "Mahasiswa Sistem Informasi"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // SKILLS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Skills & Interests",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      skillChip("Flutter"),
                      skillChip("UI/UX"),
                      skillChip("Laravel"),
                      skillChip("Figma"),
                      skillChip("SQL"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Edit Profile diklik"),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Edit Profile"),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Share Profile diklik"),
                          ),
                        );
                      },
                      child: const Text("Share Profile"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ITEM INFO
Widget infoItem(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, color: Colors.blue, size: 18),
        ),
        const SizedBox(width: 10),
        Text(text),
      ],
    ),
  );
}

// CHIP SKILL
Widget skillChip(String text) {
  return Chip(
    label: Text(text),
    backgroundColor: Colors.grey[200],
  );
}