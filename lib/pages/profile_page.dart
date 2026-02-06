import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      const routes = [
        '/dashboard',
        '/cart',
        '/notifications',
        '/feedback',
        '/profile',
      ];
      final target = routes[index];
      final current = ModalRoute.of(context)?.settings.name;
      if (current != target) {
        Navigator.pushReplacementNamed(context, target);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 4,
        onItemTapped: onItemTapped,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -80,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF48C7BB),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(160),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 12),
                Text(
                  'My Profile',
                  style: TextStyle(
                    color: Color(0xFF48C7BB),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: 60,
                  height: 2,
                  color: Color(0xFF8ECFF4),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cahaya Dewi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '@reallygreatsite',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Hello, I'm Cahaya Dewi! Welcome to my profile!",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF48C7BB),
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage(
                                'assets/images/ian.jpg',
                              ),
                              backgroundColor: Color(0xFFEFF6F5),
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                color: Color(0xFF48C7BB),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _StatItem(value: '5.397', label: 'Following'),
                      _StatItem(value: '321', label: 'Products'),
                      _StatItem(value: '9.920', label: 'Followers'),
                    ],
                  ),
                ),
                SizedBox(height: 22),
                _SectionHeader(title: 'General Settings'),
                _SettingsTile(
                  icon: Icons.settings,
                  title: 'Mode',
                  subtitle: 'Dark & Light',
                  trailing: Switch(
                    value: true,
                    onChanged: (_) {},
                    activeColor: Color(0xFF48C7BB),
                  ),
                ),
                _DividerLine(),
                _SettingsTile(
                  icon: Icons.key,
                  title: 'Change Password',
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                ),
                _DividerLine(),
                _SettingsTile(
                  icon: Icons.translate,
                  title: 'Language',
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                ),
                SizedBox(height: 18),
                _SectionHeader(title: 'Information'),
                _SettingsTile(
                  icon: Icons.info_outline,
                  title: 'About App',
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                ),
                _DividerLine(),
                _SettingsTile(
                  icon: Icons.description_outlined,
                  title: 'Terms & Conditions',
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                ),
                SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Color(0xFFF2F2F2),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget trailing;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Color(0xFFEFF6F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Color(0xFF48C7BB), size: 20),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: Color(0xFFE6E6E6));
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF48C7BB),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
