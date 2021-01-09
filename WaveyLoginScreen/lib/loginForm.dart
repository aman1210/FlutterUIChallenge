import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final Function scrollFunction;
  final bool signup;
  LoginForm({this.scrollFunction, this.signup});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment:
            signup ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration:
                  InputDecoration(hintText: 'Email', border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
              ),
            ),
          ),
          if (signup)
            SizedBox(
              height: 20,
            ),
          if (signup)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  border: InputBorder.none,
                ),
              ),
            ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 60,
            width: 120,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(40)),
            child: Center(
              child: Text(
                !signup ? 'Login' : 'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              signup
                  ? scrollFunction()
                  : scrollFunction(MediaQuery.of(context).size.height);
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  // color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: Text(
                  signup ? 'Login' : 'Sign Up',
                  style: TextStyle(fontSize: 16, color: Colors.purple),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
