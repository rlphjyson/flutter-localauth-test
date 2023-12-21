import 'package:flutter/material.dart';
import 'package:local_auth_test/components/button.dart';
import 'package:local_auth_test/components/email_textfield.dart';
import 'package:local_auth_test/components/password_textfield.dart';
import 'package:local_auth_test/pages/home_page.dart';
import 'package:local_auth_test/services/local_auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 
  TextEditingController passwordController = TextEditingController();
  
  @override
  void initState() {
    //add api call to check if user allow login via biotmetrics
    //let's assume user allowed biometrics
    showLoginViaBiotmetric();
    super.initState();
  }

  void showLoginViaBiotmetric ()async{
    final authenticate = await LocalAuth.authenticate();
    if(mounted && authenticate){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      body: Padding(
        padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const EmailTextField(),
            const SizedBox(height: 20,),
            PasswordInput(textEditingController: passwordController, hintText: 'Password'),
            const SizedBox(height: 20,),
            LoginButton(text: 'Login', onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            })
          ]),
        ),
      ),
    );
  }
}