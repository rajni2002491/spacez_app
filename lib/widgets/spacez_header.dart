import 'package:flutter/material.dart';

class SpacezHeader extends StatelessWidget {
  final VoidCallback? onMenuTap;

  const SpacezHeader({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFEDE6DE))),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 56,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logo1.png',
                      height: 24,
                      width: 24,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.home, size: 24);
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'SPACEZ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: Color(0xFF8B4513),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onMenuTap,
                  behavior: HitTestBehavior.opaque,
                  child: const SizedBox(
                    height: 24,
                    width: 24,
                    child: Icon(Icons.menu, color: Color(0xFF8B4513), size: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
