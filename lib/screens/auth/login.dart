import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:async'; // <-- Import statement
import '../../controllers/menu_app_controller.dart';
import '../main/components/side_menu.dart';
import '../main/main_screen.dart';

class Login extends StatefulWidget {
  //const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final storage = new LocalStorage('AppLK');
  final _txtController = TextEditingController();
  var _isObscureText = true;
  var UserLogin = '';
  var Password = '';

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var StatusLogin = storage.getItem('StatusLogin');
    if(StatusLogin =='1'){
       print('Async done');
       //navigateToSubPage(context);
    }
  Future navigateToSubPage(context) async {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                        create: (context) => MenuAppController(), child: MainScreen()),
                  ),
            );
    }
    Future.delayed(Duration(seconds:1), (){
      print("Wait for 1 seconds");
      navigateToSubPage(context);
    });
      return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100.spMin),
                _buildUserNameTextField(),
                SizedBox(height: 20.spMin),
                _buildPasswordTextField(),
                SizedBox(height: 30.spMin),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserNameTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 312.sp,
        height: 60.spMin,
        child: TextField(
          controller: _txtController,
          style: TextStyle(fontSize: 18.spMin, height: 2.5.spMin),
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle_outlined),
            hintText: 'ชื่อผู้ใช้งาน',
            fillColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onChanged: (value) {
            UserLogin = value;
          },
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 312.sp,
        height: 60.spMin,
        child: TextField(
          obscureText: _isObscureText,
          textCapitalization: TextCapitalization.none,
          style: TextStyle(fontSize: 18.spMin, height: 2.5.spMin),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: 'รหัสผ่าน',
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                      _isObscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isObscureText = !_isObscureText;
                    });
                  })),
          onChanged: (value) {
            Password = value;
          },
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        //if (UserLogin == 'admin' && Password == '12345678') {
        if (Password == '12345678') {
          storage.setItem('UserLogin',UserLogin);
          storage.setItem('StatusLogin','1');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                  create: (context) => MenuAppController(), child: MainScreen()),
            ),
          );
        } else {
           storage.setItem('StatusLogin','0');
          Fluttertoast.showToast(
              msg: "ชื่อผูู้ใช้ หรือ รหัสผ่าน ไม่ถูกต้อง",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      },
      style: ElevatedButton.styleFrom(
          fixedSize: Size(306.sp, 50.spMin), backgroundColor: Colors.blue),
      child: Text('Login',
          style: TextStyle(fontSize: 20.spMin, color: Colors.black)),
    );
  }
}
