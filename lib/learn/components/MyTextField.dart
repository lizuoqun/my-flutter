import 'package:flutter/material.dart';

void main() {
  runApp(MyLogin());
}

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  // 构建两个控制器
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("登录"))),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "请输入用户名",
                  fillColor: Color.fromARGB(255, 255, 255, 207),
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 20),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onChanged: (value) {
                  print("用户名 onChanged：$value");
                },
                onSubmitted: (value) {
                  print("用户名 onSubmitted：$value");
                },
              ),
              TextField(
                obscureText: true, // 不显示实际内容
                controller: _pwdController,
                decoration: InputDecoration(
                  hintText: "请输入密码",
                  fillColor: Color.fromARGB(255, 255, 255, 207),
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 20),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  onPressed: () {
                    print("登录${_nameController.text} ${_pwdController.text}");
                  },
                  child: Text("登录", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
