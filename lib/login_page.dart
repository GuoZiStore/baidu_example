import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // final _biggerFont =
  //     const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600);

  // final _normalFont = const TextStyle(fontSize: 18.0);
  // final _borderRadius = BorderRadius.circular(6);

  String _accountText = '';
  String _pwdText = '';
  bool _isEnableLogin = false;
  bool _obscureText = true;
  var _accountController = TextEditingController();
  var _pwdController = TextEditingController();

  void _checkUserInput() {
    if (_accountText.isNotEmpty && _pwdText.isNotEmpty) {
      if (_isEnableLogin) return;
    } else {
      if (!_isEnableLogin) return;
    }

    setState(() {
      _isEnableLogin = !_isEnableLogin;
    });
  }

  _getLoginButtonPressed() {
    if (!_isEnableLogin) return null;

    return () async {
      final SharedPreferences prefs = await _prefs;
      prefs.setString(Constant.userAccount, _accountText);
      prefs.setString(Constant.userPassword, _pwdText);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    };
  }

  @override
  void initState() {
    super.initState();
    _prefs.then((prefs) {
      _accountText = prefs.getString(Constant.userAccount) ?? '';
      _accountController.text = _accountText;
      _pwdText = prefs.getString(Constant.userPassword) ?? '';
      _pwdController.text = _pwdText;
      _checkUserInput();
    });
  }

  Widget _buildTopWidget() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/images/baiduLogo.png'),
          Text(
            '欢迎登陆百度账户',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountEditTextField() {
    return Container(
      margin: EdgeInsets.only(top: 80),
      child: TextField(
        key: Key('AccountTextField'),
        controller: _accountController,
        onChanged: (text) {
          _accountText = text;
          _checkUserInput();
        },
        style: TextStyle(fontSize: 18.0),
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

  Widget _buildPwdEditTextField() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: TextField(
        controller: _pwdController,
        onChanged: (text) {
          _pwdText = text;
          _checkUserInput();
        },
        style: TextStyle(fontSize: 18.0),
        obscureText: _obscureText,
        decoration: InputDecoration(
            hintText: '请输入登陆密码',
            filled: true,
            fillColor: Color.fromARGB(255, 240, 240, 240),
            contentPadding: EdgeInsets.only(left: 8),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6)),
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscureText = !_obscureText),
              icon: Image.asset(
                _obscureText
                    ? 'assets/images/closeEye.png'
                    : 'assets/images/openEye.png',
                width: 20,
                height: 20,
              ),
              splashColor: Colors.transparent, // 去掉点击阴影效果
              highlightColor: Colors.transparent, // 去掉点击阴影效果
            )),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      margin: EdgeInsets.only(top: 70),
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: RaisedButton(
        child: Text("登 录", style: TextStyle(fontSize: 18.0)),
        color: Colors.blue,
        disabledColor: Colors.black12,
        textColor: Colors.white,
        disabledTextColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        onPressed: _getLoginButtonPressed(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('登录'),
      ),
      // 方法1
      body: Container(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTopWidget(),
            _buildAccountEditTextField(),
            _buildPwdEditTextField(),
            _buildLoginButton(),
          ],
        ),
      ),

      // 方法2
      // body: SingleChildScrollView(
      //   padding: EdgeInsets.only(left: 25, right: 25),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       _buildTopWidget(),
      //       _buildAccountEditTextField(),
      //       _buildPwdEditTextField(),
      //       _buildLoginButton(),
      //     ],
      //   ),
      // ),
    );
  }
}
