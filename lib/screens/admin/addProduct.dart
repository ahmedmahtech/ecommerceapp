import 'package:ecomapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:ecomapp/services/store.dart';

import '../../constants.dart';

class AddProduct extends StatelessWidget {
  static String id = 'AddProduct';
  String? _name, _price, _description, _category, _imageLocation;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                cursorColor: kMainColor,
                decoration: InputDecoration(
                  hintText: 'Enter product name',
                  prefixIcon: Icon(
                    Icons.sell,
                    color: kMainColor,
                  ),
                  filled: true,
                  fillColor: kSecondaryColor,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter product name';
                    // ignore: missing_return
                  }
                },
                onSaved: (value) {
                  _name = value;
                },
                // hint: 'Enter your email',
                // icon: Icons.email,
              ),),


            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                cursorColor: kMainColor,
                decoration: InputDecoration(
                  hintText: 'Enter product price',
                  prefixIcon: Icon(
                    Icons.price_change,
                    color: kMainColor,
                  ),
                  filled: true,
                  fillColor: kSecondaryColor,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter product price';
                    // ignore: missing_return
                  }
                },
                onSaved: (value) {
                  _price = value;
                },
                // hint: 'Enter your email',
                // icon: Icons.email,
              ),),


            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                cursorColor: kMainColor,
                decoration: InputDecoration(
                  hintText: 'Enter product description',
                  prefixIcon: Icon(
                    Icons.description,
                    color: kMainColor,
                  ),
                  filled: true,
                  fillColor: kSecondaryColor,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter producrt description';
                    // ignore: missing_return
                  }
                },
                onSaved: (value) {
                  _description = value;
                },
                // hint: 'Enter your email',
                // icon: Icons.email,
              ),),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                cursorColor: kMainColor,
                decoration: InputDecoration(
                  hintText: 'Enter product category',
                  prefixIcon: Icon(
                    Icons.category,
                    color: kMainColor,
                  ),
                  filled: true,
                  fillColor: kSecondaryColor,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter product category';
                    // ignore: missing_return
                  }
                },
                onSaved: (value) {
                  _category = value;
                },
                // hint: 'Enter your email',
                // icon: Icons.email,
              ),),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                cursorColor: kMainColor,
                decoration: InputDecoration(
                  hintText: 'Enter product image url',
                  prefixIcon: Icon(
                    Icons.image,
                    color: kMainColor,
                  ),
                  filled: true,
                  fillColor: kSecondaryColor,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter product image url';
                    // ignore: missing_return
                  }
                },
                onSaved: (value) {
                  _imageLocation = value;
                },
                // hint: 'Enter your email',
                // icon: Icons.email,
              ),),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  _globalKey.currentState!.save();

                  _store.addProduct(Product(
                      pName: _name,
                      pPrice: _price,
                      pDescription: _description,
                      pLocation: _imageLocation,
                      pCategory: _category));
                }
              },
              child: Text('Add Product'),
            )
          ],
        ),
      ),
    );
  }
}
