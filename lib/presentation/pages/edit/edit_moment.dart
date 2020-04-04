import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class EditMomnet extends StatefulWidget {
  EditMomnet({Key key}) : super(key: key);

  @override
  _EditMomnetState createState() => _EditMomnetState();
}

class _EditMomnetState extends State<EditMomnet> {
  List<Asset> images = List<Asset>();
  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            GlobalRoute.router.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              bottom: 12.0,
            ),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 15.0),
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 5.0,
                bottom: 5.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.grey[300],
                ),
              ),
              child: Text(
                '存草稿',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              bottom: 12.0,
            ),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 15.0),
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 5.0,
                bottom: 5.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blueAccent,
              ),
              child: Text(
                '发布',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                controller: _title,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  hintText: '添加标题更容易被推荐哦（选填）',
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[400],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[300],
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                controller: _content,
                maxLines: 6,
                style: TextStyle(
                  fontSize: 17.0,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '你的记录约详细就越容易被推荐',
                  hintStyle: TextStyle(
                    fontSize: 17.0,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 10.0,
                bottom: 20.0,
              ),
              height: (MediaQuery.of(context).size.width / 5) + 30.0,
              child: _buildImageListView(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Colors.white,
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 19.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '你在哪里',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "(必填·越详细越容易被推荐)",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 19.0,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.share,
                            size: 19.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '添加话题',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            '(带话题能获得更多赞)',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 19.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadAssets() async {
    setState(() {
      if (images.length == 0) {
        images = List<Asset>();
      }
    });
    List<Asset> resultList;
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        materialOptions: MaterialOptions(
          allViewTitle: '全部照片/视频',
          actionBarTitle: '全部照片/视频',
          startInAllView: true,
        ),
      );
    } on Exception catch (e) {}

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
       if (resultList.length != 0) {
        images.addAll(resultList);
      } else {
        images = resultList;
      }
      
    });
  }

  _buildImageListView() {
    List<Widget> children = List<Widget>();
    children.add(GestureDetector(
      onTap: () {
        loadAssets();
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        child: Icon(
          Icons.add,
          color: Colors.grey[300],
          size: 40.0,
        ),
      ),
    ));
    images.forEach((item) {
      children.insert(0, _singlePictureItem(item));
    });
    return ListView(
      scrollDirection: Axis.horizontal,
      children: children,
    );
  }

  _singlePictureItem(Asset asset) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: AssetThumb(
        asset: asset,
        width: 500,
        height: 500,
      ),
    );
  }
}
