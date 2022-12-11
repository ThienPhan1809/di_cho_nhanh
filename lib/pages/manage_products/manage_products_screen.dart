import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constraints/styles.dart';
import '../../widgets/app_widget.dart';
import 'products.dart';

class ManageProductsScreen extends StatelessWidget {
  const ManageProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userId = '';
    if (FirebaseAuth.instance.currentUser != null) {
      userId = FirebaseAuth.instance.currentUser!.uid;
    }
    Query<Map<String, dynamic>> product = FirebaseFirestore.instance
        .collection('products')
        .where('seller', isEqualTo: userId);
    CollectionReference<Map<String, dynamic>> allProducts =
        FirebaseFirestore.instance.collection('products');
    return Scaffold(
      appBar: titleAppBar('Hàng hóa của bạn'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: product.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return snapshot.hasData
                  ? GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 20,
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 3),
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index];
                        return Product(
                          name: data.get('name'),
                          image: data.get('image'),
                          price: data.get('price'),
                          onSelectedTap: () {},
                          onDeleteTap: () {
                            deleteTap(context, allProducts, data);
                          },
                        );
                      },
                    )
                  : const Center(child: Text('Không có sản phẩm'));
            }
          },
        ),
      ),
    );
  }
}

deleteTap(
    BuildContext context,
    CollectionReference<Map<String, dynamic>> storage,
    QueryDocumentSnapshot<Map<String, dynamic>> data) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        elevation: 24,
        content: const Text('Bạn có chắc chắn muốn xóa món hàng này không?'),
        actions: [
          TextButton(
              onPressed: () {
                storage.doc(data.id).delete().then(
                      (value) => Navigator.of(context).pop(),
                    );
              },
              child: const Text('Có')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Không'))
        ],
      );
    },
  );
}
