import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/entity/moment_cover.dart';
import 'package:extended_image/extended_image.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/route/routes.dart';

class MomentCoverCard extends StatelessWidget {
  final MomentCover momentCover;
  const MomentCoverCard({Key key, this.momentCover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CurrentUserBloc _userBloc = BlocProvider.of<CurrentUserBloc>(context);
    return GestureDetector(
      onTap: () {
        final currentState = _userBloc.state;
        if (currentState is CurrentUserLoaded) {
          GlobalRoute.router.navigateTo(
            context,
            '/momentDetail?momentId=${momentCover.momentId}&userId=${currentState.currentUser.userId}',
            transition: TransitionType.cupertino,
          );
        } else {
          GlobalRoute.router.navigateTo(
            context,
            '/momentDetail?momentId=${momentCover.momentId}',
            transition: TransitionType.cupertino,
          );
        }
      },
      child: Card(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio:
                  momentCover.coverImage.width / momentCover.coverImage.height,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExtendedNetworkImageProvider(
                      momentCover.coverImage.url,
                    ),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 8.0,
                      bottom: 10.0,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 5.0,
                          right: 5.0,
                          bottom: 2.0,
                          top: 2.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 3),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 14.0,
                              ),
                            ),
                            LimitedBox(
                              maxWidth: MediaQuery.of(context).size.width / 4,
                              child: Text(
                                momentCover.location,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 5.0,
                bottom: 5.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    momentCover.coverText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: ExtendedNetworkImageProvider(
                              momentCover.authorAvatar,
                            ),
                            radius: 12.0,
                          ),
                          SizedBox(width: 3.0),
                          LimitedBox(
                            maxWidth: 80.0,
                            child: Text(
                              momentCover.authorName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.favorite_border,
                            color: Colors.black54,
                            size: 20.0,
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            '${momentCover.favoriteNum}',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
