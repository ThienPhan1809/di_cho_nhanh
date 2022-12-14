import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:di_cho_nhanh/models/agruments/product_type.dart';
import 'package:di_cho_nhanh/utilities/get_user_id.dart';
import 'package:flutter/material.dart';

import '../../../models/add_to_cart_model.dart';
import '../../../models/agruments/product_agrument.dart';
import 'item.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    Key? key,
    required this.type,
  }) : super(key: key);
  final ProductType type;
  @override
  Widget build(BuildContext context) {
    Query<Map<String, dynamic>> products = FirebaseFirestore.instance
        .collection('products')
        .where('type', isEqualTo: productCategories(type));

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: products.snapshots(),
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
                      QueryDocumentSnapshot<Map<String, dynamic>> data =
                          snapshot.data!.docs[index];
                      return Item(
                        name: data.get('name'),
                        imageURL: data.get('image'),
                        price: data.get('price'),
                        onTap: () {
                          Navigator.pushNamed(context, '/product',
                              arguments: ProductAgrument(data.id));
                        },
                        onBuyTap: () {
                          CollectionReference cart = FirebaseFirestore.instance
                              .collection('users')
                              .doc(getUserId())
                              .collection('cart');
                          cart
                              .add(
                                AddToCart(
                                  id: data.id,
                                  name: data['name'],
                                  image: data['image'],
                                  price: data['price'],
                                  quantity: 1.0,
                                ).toMap(),
                              )
                              .whenComplete(() => ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      content: Text('???? th??m v??o gi??? h??ng'))))
                              .catchError((e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Kh??ng th??? th??m h??ng v??o gi???')));
                          });
                        },
                      );
                    },
                  )
                : const Center(child: Text('No data'));
          }
        });
  }
}
