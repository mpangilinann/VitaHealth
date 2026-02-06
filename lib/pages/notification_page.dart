import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  final List<_NotificationItem> _items = const [
    _NotificationItem(
      name: 'Claudia Alves',
      message: 'Added a product to cart.',
      time: '3m ago',
      avatar: 'assets/images/kris.jpg',
    ),
    _NotificationItem(
      name: 'Ian Cruz',
      message: 'Places an order.',
      time: '5m ago',
      avatar: 'assets/images/ian.jpg',
    ),
    _NotificationItem(
      name: 'Claudia Alves',
      message: 'Order delivered.',
      time: '2h ago',
      avatar: 'assets/images/kris.jpg',
    ),
    _NotificationItem(
      name: 'Ian Cruz',
      message: 'Inquires a product price.',
      time: '3h ago',
      avatar: 'assets/images/ian.jpg',
    ),
    _NotificationItem(
      name: 'Claudia Alves',
      message: 'Started following you.',
      time: '5h ago',
      avatar: 'assets/images/kris.jpg',
    ),
    _NotificationItem(
      name: 'Ian Cruz',
      message: 'Shared your product.',
      time: '7h ago',
      avatar: 'assets/images/ian.jpg',
    ),
    _NotificationItem(
      name: 'Claudia Alves',
      message: 'Added a product to cart.',
      time: 'Yesterday',
      avatar: 'assets/images/kris.jpg',
    ),
  ];

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
        selectedIndex: 2,
        onItemTapped: onItemTapped,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    top: -60,
                    left: -60,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFF48C7BB),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(140),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 16,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.chevron_left, color: Colors.black87),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Mail & Notifications',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: 60,
                          height: 2,
                          color: Color(0xFF8ECFF4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mark all read',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Text(
                    'Sort by time ▼',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _items.length,
                separatorBuilder: (_, __) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xFFEDEDED)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(item.avatar),
                              backgroundColor: Color(0xFFEFF6F5),
                            ),
                            Positioned(
                              bottom: 2,
                              left: 0,
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: Color(0xFF48C7BB),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                item.message,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.more_horiz,
                              color: Color(0xFF48C7BB),
                              size: 18,
                            ),
                            SizedBox(height: 10),
                            Text(
                              item.time,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _NotificationItem {
  final String name;
  final String message;
  final String time;
  final String avatar;

  const _NotificationItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
  });
}
