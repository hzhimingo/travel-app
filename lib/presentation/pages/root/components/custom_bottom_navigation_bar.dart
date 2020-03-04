import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/presentation/components/extended_icon.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<CustomBottomNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final Widget center;
  final Color activeColor;
  final Color defaultColor;
  final double iconSize;
  final double labelSize;
  final double defaultLabelSize;

  CustomBottomNavigationBar({
    Key key,
    this.items,
    this.onTap,
    this.center,
    Color activeColor,
    Color defaultColor,
    double iconSize,
    double labelSize,
    double defaultLabelSize,
  })  : activeColor = activeColor ?? Colors.blue,
        defaultColor = defaultColor ?? Colors.grey,
        iconSize = iconSize ?? 24.0,
        labelSize = labelSize ?? 14.0,
        defaultLabelSize = labelSize ?? 12.0,
        super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  AuthorizationBloc _authorizationBloc;

  @override
  void initState() {
    super.initState();
    _authorizationBloc = BlocProvider.of<AuthorizationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            minHeight: kBottomNavigationBarHeight +
                MediaQuery.of(context).padding.bottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildChildren(),
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.items.length; i++) {
      widgets.add(
        Expanded(
          child: InkResponse(
            onTap: () => _handleOnTap(i),
            child: Container(
              alignment: Alignment.center,
              height: kBottomNavigationBarHeight,
              child: _currentIndex == i
                  ? ExtendedIcon(
                      icon: Icon(
                        widget.items[i].activeIcon,
                        color: widget.activeColor,
                        size: widget.iconSize,
                      ),
                      gap: 0.0,
                      text: Text(
                        widget.items[i].label,
                        style: TextStyle(
                          color: widget.activeColor,
                          fontSize: widget.labelSize,
                        ),
                      ),
                    )
                  : ExtendedIcon(
                      icon: Icon(
                        widget.items[i].icon,
                        color: widget.defaultColor,
                        size: widget.iconSize,
                      ),
                      gap: 0.0,
                      text: Text(
                        widget.items[i].label,
                        style: TextStyle(
                          color: widget.defaultColor,
                          fontSize: widget.defaultLabelSize,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      );
    }
    if (widget.center != null) {
      widgets.insert(2, widget.center);
    }
    return widgets;
  }

  _handleOnTap(int index) {
    //如果没有登录授权的话，如果index=3也就是点击了"我的"按钮就保持原来的状态
    if (!(index == 3 && _authorizationBloc.state is UnAuthorized)) {
      setState(() {
        _currentIndex = index;
      });
    }
    widget.onTap(index);
  }
}

class CustomBottomNavigationBarItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  CustomBottomNavigationBarItem({
    @required this.icon,
    IconData activeIcon,
    @required this.label,
  }) : activeIcon = activeIcon ?? icon;
}
