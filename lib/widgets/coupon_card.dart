import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  static const _brandColor = Color(0xFFC16B3E);

  final String discount;
  final String title;
  final String description;
  final VoidCallback? onApply;

  const CouponCard({
    super.key,
    required this.discount,
    required this.title,
    required this.description,
    this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 345,
        height: 184,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFBF8),
            borderRadius: BorderRadius.zero,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 12,
                color: Color(0x14000000),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CouponStub(discount: discount),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 20, 20, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2D1F14),
                            ),
                          ),
                          _ApplyButton(onTap: onApply),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: Color(0xFF5C4B3D),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(
                        'Read more',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CouponStub extends StatelessWidget {
  const _CouponStub({required this.discount});

  final String discount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Stack(
        children: [
          Positioned.fill(child: Container(color: CouponCard._brandColor)),
          Center(
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                discount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: DottedLine(
                  direction: Axis.vertical,
                  lineLength: double.infinity,
                  lineThickness: 2,
                  dashLength: 6,
                  dashGapLength: 13,
                  dashColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: CouponCard._brandColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.local_offer_outlined,
              size: 16,
              color: CouponCard._brandColor,
            ),
            SizedBox(width: 6),
            Text(
              'Apply',
              style: TextStyle(
                color: CouponCard._brandColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
