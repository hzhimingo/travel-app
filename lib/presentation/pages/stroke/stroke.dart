import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/question_pool/question_pool_bloc.dart';
import 'package:travel/presentation/components/common_sliver_delegate.dart';
import 'package:travel/presentation/pages/explore/components/hot_question.dart';
import 'package:travel/presentation/pages/explore/components/question_cover_card_pool.dart';

class Stroke extends StatefulWidget {
  Stroke({Key key}) : super(key: key);

  @override
  _StrokeState createState() => _StrokeState();
}

class _StrokeState extends State<Stroke> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: NestedScrollView(
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
          create: (context) =>
              getIt.get<QuestionPoolBloc>()..add(InitializeQuestionPool()),
          child: QuestionPool(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
