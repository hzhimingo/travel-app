import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:extended_image/extended_image.dart';


class PictureFlow extends StatelessWidget {
  final List<PictureItem> images;
  final int displayMax;
  final double singleGridSize;
  final EdgeInsets margin;
  final double scale;
  final double physicalWidth = window.physicalSize.width;
  final double physicalHeight = window.physicalSize.height;

  PictureFlow({
    Key key,
    @required this.images,
    EdgeInsets margin,
    double singleGridSize,
    int displayMax,
    double scale,
  })  : assert(images != null),
        singleGridSize = singleGridSize ?? 90.0,
        displayMax = displayMax ?? 9,
        margin = margin ?? EdgeInsets.all(1.0),
        scale = scale ?? 0.7,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flow(
        delegate: PictureFlowDelegate(
          dispalyMax: displayMax,
          margin: margin,
          totalWidth: _getTotalWidth(context),
          totalHeight: _getTotalHeight(context),
        ),
        children: _buildImageChildren(context),
      ),
    );
  }

  ///图片
  List<Widget> _buildImageChildren(BuildContext context) {
    List<Widget> imageWidget = [];
    if (images.length == 1) {
      //只有一张图片缩放
      Size imageSize = _getSingleSize(context, images[0].width, images[0].height);
      imageWidget.add(Container(
        width: imageSize.width,
        height: imageSize.height,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: ExtendedNetworkImageProvider(images[0].url),
          ),
        ),
      ));
      return imageWidget;
    } else {
      //多张图片的时候固定一个大小
      for (int i = 0; i < images.length; i++) {
        imageWidget.add(_gridImage(images[i].url, i));
      }
      return imageWidget;
    }
  }

  ///当图片数量大于1时的单张图片
  Widget _gridImage(String url, int index) {
    if (images.length > displayMax && index == displayMax - 1) {
      return _gridImageWithShadow(url);
    } else {
      return _gridImageWithoutShadow(url);
    }
  }

  ///单张图片没有阴影文字
  Widget _gridImageWithoutShadow(String url) {
    return Container(
      width: singleGridSize,
      height: singleGridSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExtendedNetworkImageProvider(url),
        ),
      ),
    );
  }

  ///单张图片有阴影文字
  Widget _gridImageWithShadow(String url) {
    return Container(
      width: singleGridSize,
      height: singleGridSize,
      child: Stack(
        children: <Widget>[
          _gridImageWithoutShadow(url),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Color.fromRGBO(0, 0, 0, 0.4),
            ),
            child: Center(
              child: Text(
                '${images.length - 9}+',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///计算总宽度
  double _getTotalHeight(context) {
    var total = 0.0;
    if (images.length == 1) {
      total = _getSingleSize(context, images[0].width, images[0].height).height;
    } else if (images.length == 4) {
      for (int i = 0; i < images.length; i = i + 2) {
        total += singleGridSize + margin.top + margin.bottom;
      }
    } else {
      for (int i = 0; i < images.length; i = i + 3) {
        if (i + 1 <= displayMax) {
          total += singleGridSize + margin.top + margin.bottom;
        }
      }
    }
    return total;
  }

  ///计算总高度
  double _getTotalWidth(BuildContext context) {
    var total = 0.0;
    if (images.length == 1) {
      total = _getSingleSize(context, images[0].width, images[0].height).width;
    } else if (images.length == 2) {
      total = (singleGridSize + margin.left + margin.right) * 2;
    } else {
      total = (singleGridSize + margin.left + margin.right) * 3;
    }
    return total;
  }

  ///计算图片尺寸
  Size _getSingleSize(
      BuildContext context, int imageWidth, int imageHeight) {
    Size initalSize = _getInitalSize(context, imageWidth, imageHeight);
    print('initalSizeSize: width:${initalSize.width}, height:${initalSize.height}');
    Size afterScaleSize =_calScaleSize(context, initalSize, imageWidth, imageHeight);
    print('afterScaleSize: width:${afterScaleSize.width}, height:${afterScaleSize.height}');
    return afterScaleSize;
  }

  ///递归调用该方法计算出满足条件的图片尺寸
  Size _calScaleSize(
      BuildContext context, Size size, int imageWidth, int imageHeight) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (size.width < screenWidth * 0.8 && size.height < screenWidth) {
      //size.width以及size.height都小于屏幕宽度，不需要缩放
      return size;
    } else {
      //size.width大于屏幕宽，按照宽度缩放
      if (size.width >= screenWidth * 0.8) {
        double tempWidth = size.width * scale;
        double tempHeight = (imageHeight * tempWidth) / imageWidth;
        //按照宽度缩放完之后的size,但是没有判断是否此时的size满足要求
        size = Size(tempWidth, tempHeight);
      }
      //size.height大于屏幕宽，按照高度缩放
      if (size.height >= screenWidth) {
        double tempHeight = size.width * scale;
        double tempWidth = (imageWidth * tempHeight) / imageHeight;
        size = Size(tempWidth, tempHeight);
      }
      //递归判断计算
      return _calScaleSize(context, size, imageWidth, imageHeight);
    }
  }

  ///按照屏幕像素值与屏幕宽度高度比例将图片像素值转换为屏幕宽高大小
  Size _getInitalSize(
      BuildContext context, int imageWidth, int imageHeight) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double displayWidth = 0.0;
    double displayHeight = 0.0;
    if (imageWidth >= imageHeight) {
      displayWidth = (screenWidth * imageWidth) / physicalWidth;
      displayHeight = (imageHeight * displayWidth) / imageWidth;
    } else {
      displayHeight = (screenHeight * imageHeight) / physicalHeight;
      displayWidth = (imageWidth * displayHeight) / imageHeight;
    }
    return Size(displayWidth, displayHeight);
  }
}

class PictureItem {
  String url;
  int width;
  int height;

  PictureItem({this.url, this.width, this.height});
}

///FlowDelegate
class PictureFlowDelegate extends FlowDelegate {
  final int dispalyMax;
  final double totalWidth;
  final double totalHeight;
  final EdgeInsets margin;

  PictureFlowDelegate(
      {this.dispalyMax, this.totalWidth, this.totalHeight, this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    if (context.childCount == 1) {
      context.paintChild(0,
          transform: Matrix4.translationValues(0.0, 0.0, 0.0));
    } else if (context.childCount == 4) {
      paintFour(context);
    } else {
      paintNormal(context);
    }
  }

  void paintFour(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      if ((i + 1) % 2 == 0) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      } else {
        x = margin.left;
        if (i != 0) {
          y += context.getChildSize(i).height + margin.top + margin.bottom;
        }
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  void paintNormal(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      if (i + 1 <= dispalyMax) {
        var width = context.getChildSize(i).width + x + margin.right;
        if (width <= context.size.width) {
          context.paintChild(i,
              transform: Matrix4.translationValues(x, y, 0.0));
          x = width + margin.left;
        } else {
          x = margin.left;
          y += context.getChildSize(i).height + margin.top + margin.bottom;
          context.paintChild(i,
              transform: Matrix4.translationValues(x, y, 0.0));
          x += context.getChildSize(i).width + margin.left + margin.right;
        }
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return this != oldDelegate;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(totalWidth, totalHeight);
  }
}
