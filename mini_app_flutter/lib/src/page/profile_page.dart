import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/widgets/button_custom.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF6600),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                "Alex Sterling",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 6),
            Center(
              child: Text(
                "alex.sterling@example.com",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
            SizedBox(height: 6),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ButtonCustom(
                name: "Edit profile",
                onTap: () {},
                color: 0xFFFF6600,
              ),
            ),
            SizedBox(height: 20),
            sectionTitle("Personal Information"),
            SizedBox(height: 12),
            Container(
              decoration: _cardDecoration(),
              child: Column(
                children: [
                  _buildMenuItem(Icons.location_on, "Addresses"),
                  _buildDivider(),
                  _buildMenuItem(Icons.payment, "Payment Methods"),
                  _buildDivider(),
                  _buildMenuItem(Icons.notifications, "Notification Settings"),
                ],
              ),
            ),
            SizedBox(height: 12),
            sectionTitle("Support & Legal"),
            SizedBox(height: 12),
            Container(
              decoration: _cardDecoration(),
              child: Column(
                children: [
                  _buildMenuItem(Icons.help_center, "Help Center"),
                  _buildDivider(),
                  _buildMenuItem(Icons.gavel, "Terms of Service"),
                  _buildDivider(),
                  _buildMenuItem(Icons.privacy_tip, "Privacy Policy"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(color: Colors.grey.shade100, height: 1, thickness: 1),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Icon(icon, color: const Color(0xFFB84000), size: 22),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
}
