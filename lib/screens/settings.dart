import 'package:flutter/material.dart';
import 'home_page.dart'; // ✅ استيراد الصفحة الرئيسية

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color purple = const Color(0xFFCE7ED6);
    final Color borderColor = const Color(0xFFB14ABA);
    final double cardWidth = MediaQuery.of(context).size.width / 2 - 27;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 40,
              ), // ✅ زيادة المسافة بين العنوان والبطاقات
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSettingCard(
                          context,
                          width: cardWidth,
                          icon: Icons.person,
                          title: 'Account Info',
                          subtitle: 'Edit personal info or delete your account',
                          color: purple,
                          borderColor: borderColor,
                        ),
                        _buildSettingCard(
                          context,
                          width: cardWidth,
                          icon: Icons.notifications_active,
                          title: 'Device & Alerts',
                          subtitle:
                              'Set up device connections and notifications',
                          color: purple,
                          borderColor: borderColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSettingCard(
                          context,
                          width: cardWidth,
                          icon: Icons.lock,
                          title: 'Security & Data',
                          subtitle:
                              'Manage your password and login preferences',
                          color: purple,
                          borderColor: borderColor,
                        ),
                        _buildSettingCard(
                          context,
                          width: cardWidth,
                          icon: Icons.wb_sunny,
                          title: 'Terms&Policies',
                          subtitle: 'View the app terms and policies',
                          color: purple,
                          borderColor: borderColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSettingCard(
                          context,
                          width: cardWidth,
                          icon: Icons.logout,
                          title: 'Logout',
                          subtitle: 'Sign out of your account',
                          color: purple,
                          borderColor: borderColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: purple,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white, // ✅ لون أبيض
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Reminders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_amber_outlined),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  static Widget _buildSettingCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Color borderColor,
    required double width,
  }) {
    return SizedBox(
      width: width,
      height: 160, // ✅ ارتفاع مريح لحجم النص
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: borderColor.withOpacity(0.05)),
        ),
        elevation: 2,
        shadowColor: borderColor.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(
                height: 18,
              ), // ✅ زيادة المسافة بين الأيقونة والعنوان
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Text(
                  subtitle,
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
