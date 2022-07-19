import 'package:ahmed_test_flutter/route/routes.dart';
import 'package:ahmed_test_flutter/util/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../util/util.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();

    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    final media = MediaQuery.of(context).size;
    final height = media.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              SizedBox(height: media.height * 0.1),
              SvgPicture.asset("assets/icons/Component 36 – 2.svg"),
              SizedBox(height: media.height * 0.02),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Welcome back to ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                      fontSize: 22),
                  children: [
                    TextSpan(
                      text: "Care Pro!",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                          fontSize: 22),
                    )
                  ],
                ),
              ),
              SizedBox(height: media.height * 0.005),
              Center(
                child: Text(
                  "Join 1+ millions doctors for free",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: media.height * 0.03),
              Text(
                "Email Address",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blueColor,
                    fontSize: 15),
              ),
              SizedBox(height: media.height * 0.01),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                  ),
                  suffixIcon: SvgPicture.asset(
                    "assets/Component 6 – 2.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                onFieldSubmitted: (valu) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, phoneFocusNode);
                },
              ),
              SizedBox(height: media.height * 0.03),
              Text(
                "Mobile Phone",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blueColor,
                    fontSize: 15),
              ),
              SizedBox(height: media.height * 0.01),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            "assets/united-states-of-america (1).svg",
                            fit: BoxFit.scaleDown,
                          ),
                          Text(
                            "+1",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                                fontSize: 17),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "|",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                            fontSize: 17),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        focusNode: emailFocusNode,
                        decoration: InputDecoration(border: InputBorder.none),
                        onFieldSubmitted: (valu) {
                          Utils.fieldFocusChange(
                              context, phoneFocusNode, passwordFocusNode);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: media.height * 0.03),
              Text(
                "Password",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blueColor,
                    fontSize: 15),
              ),
              SizedBox(height: media.height * 0.01),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      focusNode: passwordFocusNode,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                        ),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility)),
                      ),
                    );
                  }),
              SizedBox(
                height: height * .05,
              ),
              RichText(
                text: TextSpan(
                    text: "By clicking Sign Up you are agreeing to the ",
                    style: TextStyle(color: AppColors.blackColor, fontSize: 15),
                    children: [
                      TextSpan(
                        text: "Terms of use & Privacy Policy",
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 15),
                      )
                    ]),
              ),
              SizedBox(height: media.height * 0.05),
              Container(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Colors.lightBlue,
                      AppColors.blueColor,
                    ],
                  ),
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.home);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                        fontSize: 17),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(media.width, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    // elevation: MaterialStateProperty.all(3),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.05),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColors.blackColor, thickness: 2),
                  ),
                  Text(
                    " Or Continue ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(color: AppColors.blackColor, thickness: 2),
                  ),
                ],
              ),
              SizedBox(height: media.height * 0.03),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      icon: SvgPicture.asset("assets/icons/Shape.svg"),
                      onPressed: () {},
                      label: Text(
                        "Continue With",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize:
                            MaterialStateProperty.all(Size(media.width, 40)),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.blackColor),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: SvgPicture.asset("assets/icons/Group.svg",
                          alignment: Alignment.center, fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      child: SvgPicture.asset("assets/icons/Path.svg",
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              SizedBox(height: media.height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: media.width * 0.3),
                child: Divider(
                    color: AppColors.blackColor, thickness: 5, height: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
