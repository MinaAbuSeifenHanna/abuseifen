import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hypelify_v2/Core/Handler/auth_handler.dart';
import 'package:hypelify_v2/Core/Services/media_service.dart';
import 'package:hypelify_v2/Features/AddPost/Data/DataSources/add_posts_data_source.dart';
import 'package:hypelify_v2/Features/AddPost/Data/Repositories/add_posts_repository_impl.dart';
import 'package:hypelify_v2/Features/AddPost/Domain/Repositories/add_posts_repository.dart';
import 'package:hypelify_v2/Features/AddPost/Presentation/Bloc/add_post_bloc.dart';
import 'package:hypelify_v2/Features/AddReels/Data/DataSources/add_reel_data_source.dart';
import 'package:hypelify_v2/Features/AddReels/Data/Repositories/add_reel_repository_impl.dart';
import 'package:hypelify_v2/Features/AddReels/Domain/Repositories/add_reel_repository.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/Bloc/add_reels_bloc.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/Auth%20Bloc/RegisterBloc/register_bloc.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/Auth%20Bloc/auth_bloc.dart';
import 'package:hypelify_v2/Features/CameraView/Presentation/Bloc/camera_bloc.dart';

import 'package:hypelify_v2/Features/Profile/Data/DataSources/profile_remote_data_source.dart';
import 'package:hypelify_v2/Features/Profile/Presentation/Bloc/profile_bloc.dart';
import 'package:hypelify_v2/Features/Reels/Data/DataSources/reels_remote_data_source.dart';
import 'package:hypelify_v2/Features/Reels/Domain/Repositories/reels_repository.dart';
import 'package:hypelify_v2/Features/Reels/Domain/UseCases/get_reels_usecase.dart';
import 'package:hypelify_v2/Features/Reels/Presentation/bloc/reels_bloc.dart';

import '../../../Core/Services/auth_service.dart';
import '../../../Core/Services/network_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/AddReels/Presentation/Bloc/CameraBloc/reels_camera_bloc.dart';
import '../../Features/Authentication/Data/DataSources/auth_data_source.dart';
import '../../Features/Authentication/Data/Repositories/auth_repository_impl.dart';
import '../../Features/Authentication/Domain/Repositories/auth_repository.dart';
import '../../Features/CreateAdvertiserAccount/Domain/Repository/advertiser_repository.dart';
import '../../Features/CreateAdvertiserAccount/Domain/UseCases/create_advertiser_useCases.dart';
import '../../Features/Post/Data/DataSource/post_data_source.dart';
import '../../Features/Post/Data/Repository/post_repository_impl.dart';
import '../../Features/Post/Domain/Repository/post_repository.dart';
import '../../Features/Post/Domain/UseCases/getAllComment_usecases.dart';
import '../../Features/Post/Domain/UseCases/getAllLikes_usescases.dart';
import '../../Features/Post/Domain/UseCases/getAllPost_usecase.dart';
import '../../Features/Post/Presentation/bloc/Comment Bloc/bloc/post_comment_bloc.dart';
import '../../Features/Post/Presentation/bloc/Like Bloc/bloc/post_like_bloc.dart';
import '../../Features/Post/Presentation/bloc/Post Bloc/post_bloc_bloc.dart';
import '../../Features/Profile/Data/Repositories/profile_repository_impl.dart';
import '../../Features/Profile/Domain/Repositories/profile_repository.dart';
import '../../Features/Reels/Data/Repositories/reels_repository_impl.dart';

class DependencyInjectionHelper {
  final sl = GetIt.instance; // sl = service locator

  /// Registering all components to be able to use them later in the app
  /// Note: don't forget to call this in main.dart
  Future<void> init() async {
    await _registerCoreDependencies();
    await _registerDataSources();
    await _registerRepositories();
    await _registerUseCases();
    await _registerBloc();
  }

  /// Registers all core components like services
  Future<void> _registerCoreDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => flutterSecureStorage);
    sl.registerLazySingleton<AuthService>(
      () => AuthService(sl()),
    );
    sl.registerLazySingleton<NetworkService>(
      () {
        final Dio public = Dio();
        final Dio private = Dio();
        return NetworkService(
          publicDio: public,
          privateDio: private,
        );
      },
    );

    sl.registerSingleton<AuthHandlerInterface>(AuthHandler(secureStorage: sl<FlutterSecureStorage>()));
  }

  /// Registers any [DATA SOURCE]
  Future<void> _registerDataSources() async {
    sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSource(sl<NetworkService>().publicDio),
    );
    sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSource(sl<NetworkService>().privateDio),
    );
    sl.registerLazySingleton<ReelsRemoteDataSource>(
      () => ReelsRemoteDataSource(sl<NetworkService>().privateDio),
    );
    sl.registerLazySingleton<AddReelDataSource>(
      () => AddReelDataSource(sl<NetworkService>().privateDio),
    );
    sl.registerLazySingleton<PostDataSource>(
      () => PostDataSource(sl<NetworkService>().privateDio),
    );
    sl.registerLazySingleton<AddPostsDataSource>(
      () => AddPostsDataSource(sl<NetworkService>().privateDio),
    );
  }

  /// Registers any [REPOSITORY]
  Future<void> _registerRepositories() async {
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl<AuthDataSource>()),
    );
    sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(sl<ProfileRemoteDataSource>()),
    );
    sl.registerLazySingleton<ReelsRepository>(
      () => ReelsRepositoryImpl(
        sl<ReelsRemoteDataSource>(),
      ),
    );

    sl.registerLazySingleton<AddReelRepository>(
      () => AddReelRepositoryImpl(sl<AddReelDataSource>()),
    );
    sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(postDataSource: sl<PostDataSource>()),
    );
    sl.registerLazySingleton<AddPostsRepository>(
      () => AddPostsRepositoryImpl(source: sl<AddPostsDataSource>()),
    );
  }

  /// Registers any [USE CASE]
  Future<void> _registerUseCases() async {
    sl.registerLazySingleton<CreateAdvertiserUsecases>(
      () => CreateAdvertiserUsecases(repo: sl<AdvertiserRepository>()),
    );
    sl.registerLazySingleton<GetReelsUsecase>(
      () => GetReelsUsecase(reelsRepository: sl<ReelsRepository>()),
    );
    sl.registerLazySingleton<GetallpostUsecase>(
      () => GetallpostUsecase(postRepository: sl<PostRepository>()),
    );
    sl.registerLazySingleton<GetallcommentUsecases>(
      () => GetallcommentUsecases(postRepository: sl<PostRepository>()),
    );
    sl.registerLazySingleton<GetalllikesUsescases>(
      () => GetalllikesUsescases(postRepository: sl<PostRepository>()),
    );
  }

  /// Registers any [Bloc]
  Future<void> _registerBloc() async {
    sl.registerLazySingleton(
      () => AuthBloc(sl<AuthRepository>()),
    );
    sl.registerFactory(
      () => RegisterBloc(
        authRepository: sl<AuthRepository>(),
      ),
    );
    sl.registerFactory(
      () => ProfileBloc(
        profileRepository: sl<ProfileRepository>(),
      ),
    );
    sl.registerFactory(
      () => ReelsBloc(),
    );
    sl.registerFactory(() => AddReelsBloc(MediaService(), sl<AddReelRepository>()));
    sl.registerFactory(() => ReelsCameraBloc());
    sl.registerFactory(() => PostBlocBloc());
    sl.registerFactory(() => PostCommentBloc());
    sl.registerFactory(() => PostLikeBloc());
    sl.registerFactory(
      () => CameraBloc(),
    );
    sl.registerFactory(
          () =>
          AddPostBloc(
            MediaService(),
            sl<AddPostsRepository>(),
          ),
    );
  }
}
