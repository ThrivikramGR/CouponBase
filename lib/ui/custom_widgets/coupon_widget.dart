import 'package:flutter/material.dart';

import '../../models/coupon.dart';

class CouponWidget extends StatefulWidget {
  const CouponWidget({super.key, required this.coupon});
  final Coupon coupon;

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: widget.coupon.stores.map((store) => Text(store)).toList(),
          ),
        ],
      ),
    );
  }
}
