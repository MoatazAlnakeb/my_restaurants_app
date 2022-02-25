import 'package:conditional_builder/conditional_builder.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_restaurant_app/authentication/login/cubit/cubit.dart';
import 'package:my_restaurant_app/authentication/login/cubit/states.dart';
import 'package:my_restaurant_app/authentication/register/register_screen.dart';
import 'package:my_restaurant_app/general/general_constants.dart';
import 'package:my_restaurant_app/layout/shop_layout.dart';
import 'package:my_restaurant_app/network/local/cach_helper.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:my_restaurant_app/shared/constants.dart';
import 'package:my_restaurant_app/shared/widgets/custom_button.dart';
import 'package:my_restaurant_app/shared/widgets/custom_test_field.dart';
import 'package:my_restaurant_app/shared/widgets/show_toast.dart';

class LoginViewBody extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
      @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(),

      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
      listener: (BuildContext context , ShopLoginStates state){
        // listener: (context,state){
        if(state is ShopLoginSuccessState){
          //الحالتين اللي تحت هو ف ال success state
          //بس حالة منهم ب true وهيدخل علي ال layout.home page
          //والحالة التانية ب false وهيفضل موجود ف ال login screen
          if(state.loginModel.status) {
            print(state.loginModel.message);
            print(state.loginModel.data.token);
            showToast(text: state.loginModel.message,
                state: ToastState.SUCCESS
            );
            CashHelper.saveData(
                key: 'token',
                value: state.loginModel.data.token
            ).then((value) {
              token = state.loginModel.data.token;
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ShopLayOutScreen()));
            });
          }else{
            print(state.loginModel.message);
            showToast(text: state.loginModel.message,
                state: ToastState.ERROR
            );

          }
        }
        },
        builder: (BuildContext context , ShopLoginStates state){
        // builder: (context,state){
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    General.sizeBoxVerical(height*.03),
                    Center(
                      child: SizedBox(
                          height: height*.2,
                          child:Image.asset('assets/images/base_logo.png')),
                    ),
                    General.sizeBoxVerical(height*.05),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: defaultTextFormField(
                          controller: emailController,
                          keboardType: TextInputType.emailAddress,
                          validate: (String value){
                            print("value issss=$value");
                            if(value.isEmpty)
                              return "email must not to be empty";
                          },
                          label: "Enter email address",
                          prefix:  Icons.email,
                        prefixcolor: General.kSecondaryColor,
                      ),
                    ),

                    // CustomTextField(
                    // controller: emailController,
                    //   onClick: (value) {
                    //     print("emailController value =$value");
                    //     emailController = value;
                    //   },
                    //   hint: 'Enter User Name',
                    //   prefixIcon: Icons.email,
                    // ),
                    General.sizeBoxVerical(20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: defaultTextFormField(
                        controller: passwordController,
                        keboardType: TextInputType.visiblePassword,
                        isPassword: ShopLoginCubit.get(context).isPassword,
                        label: "Enter Password",
                        prefix:  Icons.lock,
                        prefixcolor: General.kSecondaryColor,
                        suffix: ShopLoginCubit.get(context).suffix,
                        suffixPressed: (){
                          ShopLoginCubit.get(context).changePasswordVisibility();
                        },
                        validate: (String value){
                          // print("value issss=$value");
                          if(value.isEmpty)
                            return "password must not to be empty";
                        },
                      ),
                    ),
                    // CustomTextField(
                    //   controller: passwordController,
                    //   onClick: (value) {
                    //     print("passwordController value =$value");
                    //     passwordController = value;
                    //   },
                    //   hint: 'Enter your password',
                    //   prefixIcon: Icons.lock,
                    //   suffixIcon: Icons.remove_red_eye_outlined,
                    // ),
                    General.sizeBoxVerical(15.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: (){
                        },
                        child: Text(
                          'Forgot password!',
                          style: Theme.of(context).textTheme.bodyText1,
                          // style: TextStyle(
                          //   fontFamily: 'SFProDisplay-Regular',
                          //   fontSize: 15,
                          //   color: const Color(0xff8f9bb3),
                          //   height: 1.0666666666666667,
                          // ),
                          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                          softWrap: false,
                        ),
                      ),
                    ),
                    General.sizeBoxVerical(25.0),
                    ConditionalBuilder(
                      condition: state is! ShopLoginLoadingState,
                      builder: (context)=>Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CustomGeneralButton(text:"Sign In",
                          backgroungColor: General.kSecondaryColor,
                          width: width,
                          onTap: (){
                          if(formKey.currentState.validate()){
                            ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                          },
                        ),
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
                    ),
                    General.sizeBoxVerical(25.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: CustomButtonWithIcon(text: 'Log in with',
                                  color: Color(0xFFdb3236),
                                  iconData: FontAwesomeIcons.googlePlusG,
                                  onTap: ()async{
                                    print("login with google");
                                    await loginWithGoogleMethod();
                                  },
                                ),

                              )),

                          Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: CustomButtonWithIcon(text: 'Log in with',
                                  color: Color(0xFF4267B2),
                                  iconData: FontAwesomeIcons.facebookF,
                                  onTap: ()async{
                                    print("login with facebook");
                                    await facebookSignInMethod();
                                  },
                                ),

                              )),
                        ],
                      ),
                    ),

                    General.sizeBoxVerical(100.0),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                      },
                      child: Text.rich(
                        TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          // style: TextStyle(
                          //   fontFamily: 'SFProDisplay-Regular',
                          //   fontSize: 15,
                          //   color: const Color(0xff222b45),
                          //   height: 1.0666666666666667,
                          // ),
                          children: [
                            TextSpan(
                              text: 'You don’t have an account? ',
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: General.kSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<Either<Exception,UserCredential>> loginWithGoogleMethod() async{
 try{
   // Trigger the authentication flow
   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

   // Obtain the auth details from the request
   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

   // Create a new credential
   final credential = GoogleAuthProvider.credential(
     accessToken: googleAuth.accessToken,
     idToken: googleAuth.idToken,
   );

   // Once signed in, return the UserCredential
   UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
   print("UserCredential is ${userCredential.user}");
   return Right(await FirebaseAuth.instance.signInWithCredential(credential));
 }catch(e){
   Left(Exception('something went wrong $e'));
 }

  }

  Future<Either<Exception,UserCredential>> facebookSignInMethod()async{
  // Future<UserCredential> facebookSignInMethod()async{
        // FacebookLoginResult result = await _facebookLogin.logIn(['email']);
        //
        // final accessToken = result.accessToken.token;
        //
        // if(result.status == FacebookLoginStatus.loggedIn){
        //   final faceCredential = FacebookAuthProvider.credential(accessToken);
        //
        //   await _auth.signInWithCredential(faceCredential);
        // }

    // Trigger the sign-in flow
   try{
     final LoginResult loginResult = await FacebookAuth.instance.login();

     // Create a credential from the access token
     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);
     if(facebookAuthCredential==null){
       print("loginResult.accessToken.token is = null");
     }
     print("facebookAuthCredential is ${facebookAuthCredential.accessToken}");
     // Once signed in, return the UserCredential
     return Right(await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential));
   }catch(e){
     Left(Exception('something went wrong $e'));
   }
  }
}
