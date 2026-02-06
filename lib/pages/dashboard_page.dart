import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static const Color primaryColor = Color(0xFF48c7bb);

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
      body: _dashboardHome(),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onItemTapped: onItemTapped,
      ),
    );
  }

  // =========================
  // DASHBOARD HOME
  // =========================
  Widget _dashboardHome() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== HEADER =====
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dashboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/cart');
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Search products',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ===== DISCOUNT BANNER =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '20% discount',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Use this Special Voucher to get a discount for any product.',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.local_offer, color: Colors.white, size: 48),
                ],
              ),
            ),
          ),

          const SizedBox(height: 28),

          // ===== PRODUCTS HEADER =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                HoverableText(
                  text: 'View More →',
                  onTap: () => Navigator.pushNamed(context, '/error'),
                  normalColor: primaryColor,
                  hoverColor: Colors.blueAccent,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ===== PRODUCT GRID =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _ProductCard(
                  name: 'B-Complex',
                  imagePath: 'assets/images/b_complex.png',
                ),
                _ProductCard(
                  name: 'Zinc Copper',
                  imagePath: 'assets/images/zinc_copper.png',
                ),
                _ProductCard(
                  name: 'Magnesium',
                  imagePath: 'assets/images/magnesium.png',
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // ===== FEATURED =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Featured',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Divider(color: Colors.black, thickness: 1),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/magnesium.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '\$200.00',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text('Magnesium'),
                      const SizedBox(height: 8),
                      HoverableText(
                        text: 'More Details →',
                        onTap: () => Navigator.pushNamed(context, '/error'),
                        normalColor: primaryColor,
                        hoverColor: Colors.blueAccent,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// =========================
// PRODUCT CARD WIDGET
// =========================
class _ProductCard extends StatelessWidget {
  final String name;
  final String imagePath;

  const _ProductCard({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            height: 90,
            width: 90,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(name),
        const SizedBox(height: 4),
        HoverableText(
          text: 'See Details',
          onTap: () => Navigator.pushNamed(context, '/error'),
          normalColor: _DashboardPageState.primaryColor,
          hoverColor: Colors.blueAccent,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

// =========================
// HOVERABLE TEXT WIDGET
// =========================
class HoverableText extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color normalColor;
  final Color hoverColor;
  final TextStyle? style;

  const HoverableText({
    required this.text,
    required this.onTap,
    required this.normalColor,
    required this.hoverColor,
    this.style,
    super.key,
  });

  @override
  State<HoverableText> createState() => _HoverableTextState();
}

class _HoverableTextState extends State<HoverableText> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style:
              widget.style?.copyWith(
                color: _isHovering ? widget.hoverColor : widget.normalColor,
                decoration: _isHovering
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ) ??
              TextStyle(
                color: _isHovering ? widget.hoverColor : widget.normalColor,
                decoration: _isHovering
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
        ),
      ),
    );
  }
}
