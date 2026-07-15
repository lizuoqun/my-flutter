import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/utils/TokenManager.dart';

import '../../stores/UserController.dart';
import '../../types/user.dart';
import '../../utils/Message.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserController userController = Get.find<UserController>();

  Widget _buildUsernameField() {
    return TextFormField(
      controller: usernameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请输入用户名';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: '用户名',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请输入密码';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: '密码',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (!_formKey.currentState!.validate()) {
          return;
        }
        print(usernameController.text);
        print(passwordController.text);
        if (usernameController.text == "admin" &&
            passwordController.text == "123456") {
          MessageUtils.showMessage(context, '登录成功');
          Navigator.pushNamed(context, "/main");
          userController.updateUserInfo(
            UserInfo(
              username: "admin",
              password: "123456",
              email: "admin@example.com",
            ),
          );
          // 写入一个token测试
          tokenManager.setToken(
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbm5hbWUiOiJnbF9nempnIiwiZXhwIjoxNzg0MDgyOTI1LCJpYXQiOjE3ODQwNzkzMjV9.c4Sp3m2OvnpET8myG7lkbPFqClMwcfBEKKr1jeqTJnE",
          );
        } else {
          MessageUtils.showMessage(context, '登录失败');
        }
      },
      child: const Text('登录'),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "登录",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(30),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildUsernameField(),
              SizedBox(height: 20),
              _buildPasswordField(),
              SizedBox(height: 20),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
