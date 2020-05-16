import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/entity/answer_cover.dart';
import 'package:travel/entity/picture.dart';
import 'package:travel/entity/question_cover.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/route/routes.dart';
import 'package:extended_image/extended_image.dart';

class QuestionCoverCard extends StatelessWidget {
  final QuestionCover questionCover;
  const QuestionCoverCard({Key key, this.questionCover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentState = BlocProvider.of<CurrentUserBloc>(context).state;
        if (currentState is CurrentUserLoaded) {
          GlobalRoute.router.navigateTo(
            context,
            '/questionDetail?questionId=${questionCover.questionId}&userId=${currentState.currentUser.userId}',
            transition: TransitionType.cupertino,
          );
        } else {
          GlobalRoute.router.navigateTo(
            context,
            '/questionDetail?questionId=${questionCover.questionId}',
            transition: TransitionType.cupertino,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0),
        margin: EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200],
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Text(
                questionCover.title,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildAnswerAuthor(questionCover.answer),
            _buildContent(questionCover),
            Container(
              width: double.infinity,
              height: 30.0,
              //color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        _tag('问题'),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 6.0),
                        _numberAndText(
                          questionCover.answerNum,
                          '回答',
                        ),
                        SizedBox(width: 6.0),
                        _numberAndText(
                          questionCover.followNum,
                          '关注',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _numberAndText(int number, String text) {
    return Row(
      children: <Widget>[
        Text(
          '$number',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        SizedBox(width: 3.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }

  _tag(String text) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 90.0,
      ),
      margin: EdgeInsets.only(left: 2.0, right: 2.0),
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.black38,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _buildContent(QuestionCover questionCover) {
    if (questionCover.answer == null) {
      return Container();
    } else {
      if (questionCover.answer.pictures != null) {
        if (questionCover.answer.pictures.length != 0) {
          if (questionCover.answer.pictures.length <= 2) {
            return _buildContentHasImageLessThanTwo(
                questionCover.answer.content, questionCover.answer.pictures);
          } else {
            return _buildContentHasImageMoreThanThree(
                questionCover.answer.content, questionCover.answer.pictures);
          }
        }
      }
      return _buildContentWithoutImage(questionCover.answer.content);
    }
  }

  _buildContentHasImageLessThanTwo(String text, List<Picture> pictures) {
    return Container(
      height: 110.0,
      margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
      padding: EdgeInsets.only(left: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 110.0,
              margin: EdgeInsets.only(right: 10.0),
              child: Text(
                text,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          ExtendedImage.network(
            pictures.first.url,
            cache: true,
            width: 150.0,
            height: 110.0,
            fit: BoxFit.cover,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ],
      ),
    );
  }

  _buildContentHasImageMoreThanThree(String text, List<Picture> pictures) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
      padding: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            margin: EdgeInsets.only(bottom: 5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ExtendedImage.network(
                    pictures[0].url,
                    cache: true,
                    height: 120.0,
                    fit: BoxFit.cover,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.0, right: 3.0),
                    child: ExtendedImage.network(
                      pictures[1].url,
                      cache: true,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: ExtendedImage.network(
                    pictures[2].url,
                    cache: true,
                    height: 120.0,
                    fit: BoxFit.cover,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildContentWithoutImage(text)
        ],
      ),
    );
  }

  _buildContentWithoutImage(String text) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Text(
        text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black54,
        ),
      ),
    );
  }

  _buildAnswerAuthor(AnswerCover answerCover) {
    if (answerCover == null) {
      return Container();
    } else {
      return Container(
        width: double.infinity,
        height: 40.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 15.0,
              backgroundImage: ExtendedNetworkImageProvider(
                questionCover.answer.avatar,
              ),
            ),
            SizedBox(width: 5.0),
            Text(
              questionCover.answer.nickname,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5.0),
            Text(
              '的回答',
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ],
        ),
      );
    }
  }
}
