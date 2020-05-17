import 'package:extended_image/extended_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/entity/answer_cover.dart';
import 'dart:math';

import 'package:travel/entity/picture.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/collect/collect_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/presentation/blocs/thumbup/thumbup_bloc.dart';
import 'package:travel/presentation/components/card_options.dart';
import 'package:travel/presentation/components/user_info_title.dart';
import 'package:travel/route/routes.dart';

class AnswerCoverCard extends StatelessWidget {
  final String question;
  final AnswerCover answerCover;

  AnswerCoverCard({Key key, this.answerCover, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentState = BlocProvider.of<CurrentUserBloc>(context).state;
        int userId;
        if (currentState is CurrentUserLoaded) {
          userId = currentState.currentUser.userId;
          GlobalRoute.router.navigateTo(
            context,
            '/answerDetail?answerId=${answerCover.answerId}&question=${Uri.encodeComponent(question)}&userId=$userId',
            transition: TransitionType.cupertino,
          );
        } else {
          GlobalRoute.router.navigateTo(
            context,
            '/answerDetail?answerId=${answerCover.answerId}&question=${Uri.encodeComponent(question)}',
            transition: TransitionType.cupertino,
          );
        }
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 15.0),
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            UserInfoTitle(
              nickname: answerCover.nickname,
              avatar: answerCover.avatar,
              dateTime: answerCover.date,
            ),
            _buildAnswerCoverContent(
              answerCover.content,
              answerCover.pictures,
            ),
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt.get<ThumbupBloc>(),
                ),
                BlocProvider(
                  create: (context) => getIt.get<CollectBloc>(),
                ),
              ],
              child: CardOptions(
                serviceBusinessId: answerCover.answerId,
                isFav: answerCover.isFav,
                isStar: answerCover.isStar,
                favNum: answerCover.favNum,
                starNum: answerCover.starNum,
                commentNum: answerCover.commentNum,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAnswerCoverOptionInfo(int thumbUpNum, int starNum, int commentNum) {
    double iconSize = 26.0;
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildIconAndNumber(
            Icon(
              Icons.thumb_up,
              size: iconSize,
            ),
            thumbUpNum,
          ),
          _buildIconAndNumber(
            Icon(
              Icons.star_border,
              size: iconSize,
            ),
            starNum,
          ),
          _buildIconAndNumber(
            Icon(
              Icons.comment,
              size: iconSize,
            ),
            commentNum,
          ),
        ],
      ),
    );
  }

  _buildIconAndNumber(Icon icon, int num) {
    List<Widget> children = [
      icon,
      SizedBox(width: 5.0),
    ];
    if (num != 0) {
      String text;
      if (num < 1000) {
        text = "$num";
      } else {
        int digit = "$num".length;
        String s;
        if (digit - 1 == 3) {
          s = "k+";
        } else if (digit - 1 == 4) {
          s = "w+";
        }
        text = "${(num / pow(10, (digit - 1))).ceil()}$s";
      }
      children.add(
        Text(
          text,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return Row(
      children: children,
    );
  }

  _buildAnswerCoverContent(String text, List<Picture> pictures) {
    List<Widget> children = [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
      ),
    ];
    if (pictures.length >= 3) {
      children.add(Container(
        height: 130.0,
        margin: EdgeInsets.only(top: 15.0),
        child: GridView.builder(
          itemCount: 3,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
          ),
          itemBuilder: _buildAnswerCoverCardPicture,
        ),
      ));
    }
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildAnswerCoverCardPicture(BuildContext context, int index) {
    Radius radius = Radius.circular(6.0);
    BoxShape shape = BoxShape.rectangle;
    String picture = answerCover.pictures[index].url;
    BoxFit boxFit = BoxFit.cover;
    if (index == 1) {
      return ExtendedImage.network(
        picture,
        height: 130.0,
        fit: boxFit,
      );
    }
    if (index == 2) {
      return Stack(
        children: <Widget>[
          ExtendedImage.network(
            picture,
            shape: shape,
            fit: boxFit,
            height: 130.0,
            borderRadius: BorderRadius.only(
              topRight: radius,
              bottomRight: radius,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              borderRadius: BorderRadius.only(
                topRight: radius,
                bottomRight: radius,
              ),
            ),
            child: Text(
              '+${answerCover.pictures.length - 3}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }
    return ExtendedImage.network(
      picture,
      shape: shape,
      fit: boxFit,
      borderRadius: BorderRadius.only(
        topLeft: radius,
        bottomLeft: radius,
      ),
    );
  }
}
