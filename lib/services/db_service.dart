import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  static Future<List<DocumentSnapshot>> getCoupons(
      {required String userId}) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("coupons")
        .where("available_to", arrayContains: userId)
        .get();
    return querySnapshot.docs;
  }
}
