import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/sms_form/sms_form_bloc.dart';

class PhoneNumberTextField extends StatefulWidget {
  @override
  _PhoneNumberTextFieldState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  TextEditingController _controller;
  SmsFormBloc _smsFormBloc;
  bool editable;

  @override
  void initState() {
    super.initState();
    editable = true;
    _controller = TextEditingController();
    _smsFormBloc = BlocProvider.of<SmsFormBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '+',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              Text(
                '86',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                ],
                enabled: editable,
                onChanged: (text) {
                  if (text.length == 11) {
                    _smsFormBloc.add(MakeFormValidated(phoneNumber: text));
                  } else {
                    if (_smsFormBloc.state is SmsFormValidated) {
                      _smsFormBloc.add(MakeFormUnValidated());
                    }
                  }
                },
                controller: _controller,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                  hintText: "请输入手机号",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: false,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _smsFormBloc.add(MakeFormUnValidated());
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
