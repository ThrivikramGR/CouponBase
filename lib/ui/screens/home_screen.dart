import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coupon_base/services/db_service.dart';
import 'package:flutter/material.dart';

import '../../models/coupon.dart';
import '../custom_widgets/coupon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Coupon> couponList = [];
  bool isLoading = true;

  Future<void> getCoupons() async {
    setState(() {
      isLoading = true;
      couponList = [];
    });
    List<DocumentSnapshot> documentSnapshotList =
        await DBService.getCoupons(userId: "aARjZWxfaIFrTQMYZ4Sk");
    for (DocumentSnapshot documentSnapshot in documentSnapshotList) {
      couponList.add(
        Coupon.fromJSON(
          documentSnapshot.data() as Map<String, dynamic>,
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCoupons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.discount,
            ),
            Text("Coupon Base"),
          ],
        ),
      ),
      body: isLoading
          ? Center()
          : ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return CouponWidget(
                  coupon: couponList[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: couponList.length,
            ),
    );
  }
}
