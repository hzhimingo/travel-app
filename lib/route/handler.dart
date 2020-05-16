import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/answer_detail/answer_detail_bloc.dart';
import 'package:travel/presentation/blocs/answer_pool/answer_pool_bloc.dart';
import 'package:travel/presentation/blocs/edit_answer/edit_answer_bloc.dart';
import 'package:travel/presentation/blocs/edit_moment/edit_moment_bloc.dart';
import 'package:travel/presentation/blocs/edit_question/edit_question_bloc.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';
import 'package:travel/presentation/blocs/moment_detail/moment_detail_bloc.dart';
import 'package:travel/presentation/blocs/question_detail/question_detail_bloc.dart';
import 'package:travel/presentation/blocs/search_history/search_history_bloc.dart';
import 'package:travel/presentation/blocs/simple_spot_pool/simple_spot_pool_bloc.dart';
import 'package:travel/presentation/blocs/spot_pool/spot_pool_bloc.dart';
import 'package:travel/presentation/blocs/topic_detail/topic_detail_bloc.dart';
import 'package:travel/presentation/components/picture_selector.dart';
import 'package:travel/presentation/pages/pages.dart';
import 'package:travel/presentation/pages/spot_selector/spot_selector.dart';

var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Root();
  },
);

var loginHandler = Handler(
  type: HandlerType.function,
  //ignore: missing_return
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return BlocProvider<LoginBloc>(
            create: (context) => getIt.get<LoginBloc>(),
            child: Login(),
          );
        },
      ),
    );
  },
);

var popHandler = Handler(
  type: HandlerType.function,
  //ignore: missing_return
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return Pop();
        },
      ),
    );
  },
);

var settingsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Settings();
  },
);

var momentDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String momentId = params['momentId'].first;
    int userId;
    if (params['userId'] != null) {
      userId = int.parse(params['userId'].first);
    }
    print(momentId);
    return BlocProvider<MomentDetailBloc>(
      create: (context) => getIt.get<MomentDetailBloc>()
        ..add(FetchMomnetDetail(momentId: int.parse(momentId), userId: userId)),
      child: MomentDetail(),
    );
  },
);

var topicDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String topicId = params['topicId'].first;
    return BlocProvider<TopicDetailBloc>(
      create: (context) => getIt.get<TopicDetailBloc>()
        ..add(LoadTopicDetail(topicId: int.parse(topicId))),
      child: TopicDetail(),
    );
  },
);

var questionDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String questionId = params['questionId'].first;
    int userId;
    if (params['userId'] != null) {
      userId = int.parse(params['userId'].first);
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<QuestionDetailBloc>()
            ..add(InitializeQuestionDetail(questionId: int.parse(questionId))),
        ),
        BlocProvider(
          create: (context) => getIt.get<AnswerPoolBloc>()
            ..add(InitializeAnswerPool(questionId: int.parse(questionId), userId: userId)),
        ),
      ],
      child: QuestionDetail(),
    );
  },
);

var devSettingHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return DevSetting();
  },
);

var answerDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String answerId = params['answerId'].first;
    String question = params['question'].first;
    int userId;
    if (params['userId'] != null) {
      userId = int.parse(params['userId'].first);
    }
    return BlocProvider(
      create: (context) => getIt.get<AnswerDetailBloc>()
        ..add(FetchAnswerDetail(answerId: int.parse(answerId), userId: userId)),
      child: AnswerDetail(
        question: question,
      ),
    );
  },
);

var searchHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return BlocProvider(
      create: (context) =>
          getIt.get<SearchHistoryBloc>()..add(ResumeSearchHistory()),
      child: Search(),
    );
  },
);

var spotPoolHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return BlocProvider(
      create: (context) => getIt.get<SpotPoolBloc>()..add(InitializeSpotPool()),
      child: SpotPage(),
    );
  },
);

var spotDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SpotDetail();
  },
);

var travelNoteHanlder = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return TravelNote();
  },
);

var citySelectorHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CitySelector();
  },
);

var pictureSelectorHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PictureSelector();
  },
);

var editMomentHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return BlocProvider(
      create: (context) => EditMomentBloc(
        momentService: getIt(),
      ),
      child: EditMomnet(),
    );
  },
);


var editAnswerHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String questionId = params['questionId'].first;
    return BlocProvider(
      create: (context) => EditAnswerBloc(
        answerService: getIt(),
      ),
      child: EditAnswer(
        question: int.parse(questionId),
      ),
    );
  },
);

var commentPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CommentPage();
  },
);

var replyHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ReplyPage();
  },
);

var editTravelNoteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return EditTravelNote();
  },
);

var editQuestionHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return BlocProvider(
      create: (context) => EditQuestionBloc(questionService: getIt()),
      child: EditQuestion(),
    );
  },
);

var historyHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return History();
  },
);

var followHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Follow();
  },
);

var favoriteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Favorite();
  },
);

var messageCenterHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MessageCenter();
  },
);

var collectHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Collect();
  },
);

var pictureAlbumHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PictureAlbum();
  },
);

var spotMapHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SpotMap();
  },
);

var pictureAlbumDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PictureAlbumDetail();
  },
);

var spotSelectorHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return BlocProvider(
      create: (context) => SimpleSpotPoolBloc(
        spotService: getIt(),
      )..add(FetchSimpleSpot(city: 28314)),
      child: SpotSelector(),
    );
  },
);
