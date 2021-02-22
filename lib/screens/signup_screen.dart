
import 'package:budget_tracker_ui_clone/screens/dasboard.dart';
import 'package:budget_tracker_ui_clone/screens/login_screen.dart';
import 'package:budget_tracker_ui_clone/screens/on_boarding.dart';
import 'package:budget_tracker_ui_clone/utils/colors.dart';
import 'package:budget_tracker_ui_clone/utils/validators.dart';
import 'package:budget_tracker_ui_clone/view/base_view.dart';
import 'package:budget_tracker_ui_clone/view_model/signup_view_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Validators validate = Validators();
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _name;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return BaseView<SignUpViewModel>(onModelReady: (model) {
      _email = TextEditingController();
      _password = TextEditingController();
      _name = TextEditingController();
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
                    LoginScreen()), (Route<dynamic> route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Login", style: TextStyle(color: primary, fontSize: 16),),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: model.signUpKey,
            child: Column(
              children: [
                Center(child: Image.asset("asset/boarding.png", scale: 1,)),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign up to Budget tracker",
                        style: TextStyle(color: Colors.black,
                            fontSize: 22, fontWeight: FontWeight.bold
                        ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Keep your financial data store to our server so that you"
                            " can access from anywhere you want.",
                        style: TextStyle(color: Colors.grey,
                          fontSize: 14,
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
                        "Your Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff67727d)),
                      ),
                      TextFormField(
                        controller: _name,
                        cursorColor: black,
                        validator: validate.validateName,
                        autovalidate:model.autoValidate,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,
                            color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Your Name", /*border: InputBorder.none*/),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff67727d)),
                      ),
                      TextFormField(
                        controller: _email,
                        cursorColor: black,
                        validator: validate.validateEmail,
                        autovalidate:model.autoValidate,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,
                            color: Colors.black),
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
                              if (model.signUpKey.currentState.validate()) {
                                model.clearData(context);
                                _email.clear();
                                _password.clear();
                                _name.clear();
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    LoginScreen()), (Route<dynamic> route) => false);
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
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),

      );
    }
    );
  }
}
