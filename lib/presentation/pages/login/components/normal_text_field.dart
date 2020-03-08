import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/core/util/validators.dart';
import 'package:travel/presentation/blocs/pwd_form/pwd_form_bloc.dart';

class NormalTextField extends StatefulWidget {
  NormalTextField({Key key}) : super(key: key);

  @override
  _NormalTextFieldState createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {

  bool hasText;
  TextEditingController _controller;
  PwdFormBloc _pwdFormBloc;

  @override
  void initState() {
    super.initState();
    hasText = false;
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
              obscureText: false,
              onChanged: (text) {
                _pwdFormBloc.add(AccountChanged(account: text));
              },
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
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
                hintText: '请输入手机号或邮箱',
                border: InputBorder.none,
              ),
            ),
          ),
          Offstage(
            offstage: hasText,
            child: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _pwdFormBloc.add(AccountChanged(account: null));
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
