import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypelify_v2/Core/Helpers/dependency_injection_helper.dart';
import 'package:hypelify_v2/Features/AddPost/Domain/Repositories/add_posts_repository.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/View/add_reels_screen.dart';
import 'package:hypelify_v2/Features/Home/Presentation/View/home_screen.dart';
import 'package:hypelify_v2/Features/Reels/Presentation/View/reels_view.dart';
import 'package:hypelify_v2/Features/Reels/Presentation/bloc/reels_bloc.dart';
import '../../Features/AddPost/Presentation/Bloc/add_post_bloc.dart';
import '../../Features/AddPost/Presentation/View/add_post_screen.dart';
import '../../Features/AddReels/Presentation/Bloc/add_reels_bloc.dart';
import '../../Features/Post/Presentation/bloc/Post Bloc/post_bloc_bloc.dart';
import '../../Features/Profile/Presentation/Bloc/profile_bloc.dart';
import '../../Features/Profile/Presentation/View/profile_screen.dart';
import '../../Features/UploadLongVideo/Presentation/Logic/Bloc/upload_long_videos_bloc.dart';
import '../../Features/UploadLongVideo/Presentation/Logic/TrimCubit/trim_video_cubit.dart';
import '../../Features/UploadLongVideo/Presentation/View/trim_videos_screen.dart';
import '../../Features/UploadLongVideo/Presentation/View/upload_long_video_screen.dart';
import '../Services/media_service.dart';
//configuring a BlocProvider for a specific type of Bloc, along with its corresponding screen.

class BlocProviders {
  // Instantiates ProfileBloc using its default constructor.
  static BlocProvider<ProfileBloc> get provideBlocProfileWithProfileScreen => BlocProvider<ProfileBloc>(
        create: (context) => DependencyInjectionHelper().sl<ProfileBloc>()..add(GetProfileEvent()),
        child: const ProfileScreen(),
      );

  // Instantiates AddReelsBloc with a MediaService dependency and immediately adds a FetchMediaEvent to trigger an initial data fetch.
  static BlocProvider<AddReelsBloc> get provideAddReelsBlocWithAddReels => BlocProvider<AddReelsBloc>(
        create: (context) => DependencyInjectionHelper().sl<AddReelsBloc>()..add(FetchMediaEvent()),
        child: const AddReelsScreen(),
      );

  //Instantiates AddPostBloc similar to AddReelsBloc and adds a FetchMediaPostsEvent.
  static BlocProvider<AddPostBloc> get provideAddPostBlocWithAddPost => BlocProvider<AddPostBloc>(
        create: (context) => AddPostBloc(
          MediaService(),
          DependencyInjectionHelper().sl<AddPostsRepository>(),
        )..add(FetchMediaPostsEvent()),
        child: AddPostScreen(),
      );

  //Instantiates UploadLongVideosBloc and adds a FetchMediaUploadLongVideosEvent.
  static BlocProvider<UploadLongVideosBloc> get provideUploadLongVideosBlocWithUploadLongVideo =>
      BlocProvider<UploadLongVideosBloc>(
        create: (context) => UploadLongVideosBloc(MediaService())..add(FetchMediaUploadLongVideosEvent()),
        child: const UploadLongVideoScreen(),
      );

  //Instantiates TrimVideoCubit and calls loadVideo with the video file from the provided data map.
  static BlocProvider<TrimVideoCubit> provideTrimVideoCubitWithTrimVideosScreen(Map<String, dynamic> data) =>
      BlocProvider<TrimVideoCubit>(
        create: (context) => TrimVideoCubit()..loadVideo(data['video']),
        child: TrimVideosScreen(
          duration: data['duration'],
          video: data['video'],
        ),
      );

  //Instantiates TrimVideoCubit and calls loadVideo with the video file from the provided data map.
  static BlocProvider<ReelsBloc> get provideReelsScreen => BlocProvider<ReelsBloc>(
        create: (context) => ReelsBloc(),
        child: const ReelsView(),
      );

  //Instantiates PostsBloc and calls loadVideo with the video file from the provided data map.
  static BlocProvider<PostBlocBloc> get providehomeScreen => BlocProvider<PostBlocBloc>(
        create: (context) => PostBlocBloc(),
        child: HomeScreen(),
      );
}
