import 'package:ecomapp/constants.dart';
import 'package:ecomapp/models/product.dart';
import 'package:ecomapp/provider/adminMode.dart';
import 'package:ecomapp/provider/cartItem.dart';
import 'package:ecomapp/provider/modelHud.dart';
import 'package:ecomapp/screens/admin/OrdersScreen.dart';
import 'package:ecomapp/screens/admin/addProduct.dart';
import 'package:ecomapp/screens/admin/adminHome.dart';
import 'package:ecomapp/screens/admin/editProduct.dart';
import 'package:ecomapp/screens/admin/manageProduct.dart';
import 'package:ecomapp/screens/admin/order_details.dart';
import 'package:ecomapp/screens/login_screen.dart';
import 'package:ecomapp/screens/signup_screen.dart';
import 'package:ecomapp/screens/user/CartScreen.dart';
import 'package:ecomapp/screens/user/homePage.dart';
import 'package:ecomapp/screens/user/productInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Loading....'),
              ),
            ),
          );
        } else {
          isUserLoggedIn = snapshot.data!.getBool(kKeepMeLoggedIn) ?? false;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ModelHud>(
                create: (context) => ModelHud(),
              ),
              ChangeNotifierProvider<CartItem>(
                create: (context) => CartItem(),
              ),
              ChangeNotifierProvider<AdminMode>(
                create: (context) => AdminMode(),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: isUserLoggedIn ? HomePage.id : LoginScreen.id,
              routes: {
                OrderDetails.id: (context) => OrderDetails(),
                OrdersScreen.id: (context) => OrdersScreen(),
                CartScreen.id: (context) => CartScreen(),
                ProductInfo.id: (context) => ProductInfo(),
                EditProduct.id: (context) => EditProduct(),
                ManageProducts.id: (context) => ManageProducts(),
                LoginScreen.id: (context) => LoginScreen(),
                SignupScreen.id: (context) => SignupScreen(),
                HomePage.id: (context) => HomePage(),
                AdminHome.id: (context) => AdminHome(),
                AddProduct.id: (context) => AddProduct(),
              },
            ),
          );
        }
      },
    );
  }
}
