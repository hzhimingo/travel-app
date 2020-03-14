import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/question_pool/question_pool_bloc.dart';

import '../components/components.dart';

class QuestionTabView extends StatefulWidget {
  QuestionTabView({Key key}) : super(key: key);

  @override
  _QuestionTabViewState createState() => _QuestionTabViewState();
}

class _QuestionTabViewState extends State<QuestionTabView> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverPersistentHeader(
            delegate: CommonSliverPersistentHeaderDelegate(
              height: 250.0,
              child: HotQuestion(),
            ),
          ),
        ];
      },
      body: BlocProvider(
        create: (context) => getIt.get<QuestionPoolBloc>()..add(InitializeQuestionPool()),
        child: QuestionPool(),
      ),
    );
  }
}

class CommonSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  CommonSliverPersistentHeaderDelegate({this.child, this.height});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }

}
