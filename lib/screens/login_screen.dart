
import 'package:budget_tracker_ui_clone/screens/dasboard.dart';
import 'package:budget_tracker_ui_clone/screens/on_boarding.dart';
import 'package:budget_tracker_ui_clone/screens/signup_screen.dart';
import 'package:budget_tracker_ui_clone/utils/colors.dart';
import 'package:budget_tracker_ui_clone/utils/validators.dart';
import 'package:budget_tracker_ui_clone/view/base_view.dart';
import 'package:budget_tracker_ui_clone/view_model/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Validators validate = Validators();
  TextEditingController _emailId;
  TextEditingController _password;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return BaseView<LogInViewModel>(onModelReady: (model) {
      _emailId = TextEditingController();
      _password = TextEditingController();
    }, builder: (_, model, __) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Text("Budget tracker", style: TextStyle(color: Colors.black),),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    SignUpScreen()), (Route<dynamic> route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Sign Up", style: TextStyle(color: primary, fontSize: 16),),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: model.logInKey,
            child: Column(
              children: [
                Center(child: Image.asset("asset/boarding.png", scale: 1,)),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text("Login to your account",
                        style: TextStyle(color: Colors.black,
                            fontSize: 22, fontWeight: FontWeight.bold
                        ),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff67727d)),
                      ),
                      TextFormField(
                        controller: _emailId,
                        cursorColor: black,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,
                            color: Colors.black),
                        validator: validate.validateEmail,
                        autovalidate:model.autoValidate,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "email@gmail.com", /*border: InputBorder.none*/),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (size.width - 140),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Color(0xff67727d)),
                                ),
                                TextFormField(
                                  controller: _password,
                                  cursorColor: black,
                                  obscureText: true,
                                  validator: validate.validatePassword,
                                  autovalidate:model.autoValidate,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: "********",
                                    /*border: InputBorder.none*/),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: (){
                              model.setAutoValidate(true);
                              if (model.logInKey.currentState.validate()) {
                                model.clearData(context);
                                _emailId.clear();
                                _password.clear();
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    Dashboard()), (Route<dynamic> route) => false);
                              }
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                Icons.arrow_forward,
                                color: white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      );
    }
    );
  }
}
