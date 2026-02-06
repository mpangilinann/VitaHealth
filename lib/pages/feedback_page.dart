import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

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
        selectedIndex: 3,
        onItemTapped: onItemTapped,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xFF48C7BB),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  'FeedBack',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 28),
              Text(
                'Rate Your Experience!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                'Are you satisfied with the service?',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Color(0xFF48C7BB), size: 28),
                  SizedBox(width: 6),
                  Icon(Icons.star, color: Color(0xFF48C7BB), size: 28),
                  SizedBox(width: 6),
                  Icon(Icons.star, color: Color(0xFF48C7BB), size: 28),
                  SizedBox(width: 6),
                  Icon(Icons.star, color: Color(0xFF48C7BB), size: 28),
                  SizedBox(width: 6),
                  Icon(Icons.star_border, color: Colors.grey, size: 28),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 1.2,
                color: Color(0xFF48C7BB),
              ),
              SizedBox(height: 20),
              Text(
                'Tell us what can be improved?',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _FeedbackChip(
                    label: 'Overall Service',
                    filled: true,
                  ),
                  _FeedbackChip(
                    label: 'Customer Support',
                    filled: false,
                  ),
                  _FeedbackChip(
                    label: 'Speed and Efficiency',
                    filled: false,
                  ),
                  _FeedbackChip(
                    label: 'Quality',
                    filled: true,
                  ),
                  _FeedbackChip(
                    label: 'Pickup and Delivery Service',
                    filled: true,
                  ),
                  _FeedbackChip(
                    label: 'Transparency',
                    filled: false,
                  ),
                ],
              ),
              SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF48C7BB),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeedbackChip extends StatelessWidget {
  final String label;
  final bool filled;

  const _FeedbackChip({required this.label, required this.filled});

  @override
  Widget build(BuildContext context) {
    final Color fillColor = filled ? Color(0xFF48C7BB) : Color(0xFFE0E0E0);
    final Color textColor = filled ? Colors.white : Colors.black87;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, color: textColor),
      ),
    );
  }
}
