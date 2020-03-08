import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/pwd_form/pwd_form_bloc.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({Key key}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  PwdFormBloc _pwdFormBloc;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _pwdFormBloc = BlocProvider.of<PwdFormBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 55.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.6),
        borderRadius: BorderRadius.circular(55.0),
      ),
      padding: EdgeInsets.only(
        left: 20.0,
        right: 10.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              obscureText: true,
              onChanged: (text) {
                _pwdFormBloc.add(PasswordChanged(password: text));
              },
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
              maxLines: 1,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.0,
                ),
                hintText: '请输入密码',
                border: InputBorder.none,
              ),
            ),
          ),
          Offstage(
            offstage: false,
            child: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _pwdFormBloc.add(PasswordChanged(password: null));
                _controller.clear();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}