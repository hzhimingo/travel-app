import 'package:flutter/material.dart';

class CitySelectorLeft extends StatelessWidget {
  final int currentIndex;
  final ValueChanged onTap;
  final List<String> tabs;
  const CitySelectorLeft({
    Key key,
    @required this.tabs,
    @required this.onTap,
    @required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey[100],
        child: ListView.builder(
          itemCount: tabs.length,
          itemBuilder: (context, index) => _CitySelectorLeftItem(
            text: tabs[index],
            isSelected: currentIndex == index,
            onPressed: () {
              onTap(index);
            },
          ),
        ),
      ),
    );
  }
}

class _CitySelectorLeftItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  const _CitySelectorLeftItem({
    Key key,
    @required this.text,
    @required this.onPressed,
    bool isSelected,
  })  : isSelected = isSelected ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[100],
          border: Border(
            left: BorderSide(
              width: 3.0,
              color: isSelected ? Colors.blueAccent : Colors.white,
            ),
          ),
        ),
        alignment: Alignment.center,
        height: 50.0,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}