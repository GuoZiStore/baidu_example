import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPageExample extends StatefulWidget {
  @override
  _LoginPageExampleState createState() => _LoginPageExampleState();
}

class _LoginPageExampleState extends State<LoginPageExample> {
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Image.asset('assets/images/baiduLogo.png'),
          Text(
            '欢迎登录百度账户',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: '请输入手机号/用户名/邮箱',
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          contentPadding: EdgeInsets.only(left: 8),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }

  Widget _buildPwdInput() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: '请输入密码',
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          contentPadding: EdgeInsets.only(left: 8),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      child: RaisedButton(
        onPressed: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        },
        child: Text(
          '登录',
          style: TextStyle(fontSize: 18.0),
        ),
        color: Colors.blue,
        textColor: Colors.red,
        disabledColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页面'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            _buildLogo(),
            _buildInput(),
            _buildPwdInput(),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }
}
