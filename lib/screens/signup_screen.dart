// ignore_for_file: deprecated_member_use

import 'package:ecomapp/provider/modelHud.dart';
import 'package:ecomapp/screens/login_screen.dart';
import 'package:ecomapp/screens/user/homePage.dart';
import 'package:ecomapp/widgets/cutsom_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'package:ecomapp/services/auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'SignupScreen';
  String? _email, _password;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              CustomLogo(),
              SizedBox(
                height: height * .1,
              ),
              TextFormField(
                onSaved: (value) {},
                // icon: Icons.perm_identity,
                // hint: 'Enter your name',
              ),
              SizedBox(
                height: height * .02,
              ),
              TextFormField(
                onSaved: (value) {
                  _email = value;
                },
                // hint: 'Enter your email',
                // icon: Icons.email,
              ),
              SizedBox(
                height: height * .02,
              ),
              TextFormField(
                onSaved: (value) {
                  _password = value;
                },
                // hint: 'Enter your password',
                // icon: Icons.lock,
              ),
              SizedBox(
                height: height * .05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Builder(
                  builder: (context) => FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () async {
                      final modelhud =
                          Provider.of<ModelHud>(context, listen: false);
                      modelhud.changeisLoading(true);
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                        try {
                          final authResult = await _auth.signUp(
                              _email!.trim(), _password!.trim());
                          modelhud.changeisLoading(false);
                          Navigator.pushNamed(context, HomePage.id);
                        } on PlatformException catch (e) {
                          modelhud.changeisLoading(false);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(e.message!),
                          ));
                        }
                      }
                    },
                    color: Colors.black,
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Do have an account ? ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
