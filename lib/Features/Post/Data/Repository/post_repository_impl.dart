import 'package:dartz/dartz.dart';
import '../../../../Core/Failures/failures.dart';

import '../../../../Core/Handler/error_handler.dart';
import '../../Domain/Repository/post_repository.dart';
import '../DataSource/post_data_source.dart';
import '../Model/comment_mode.dart';
import '../Model/like_post_model.dart';
import '../Model/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  PostDataSource postDataSource;
  PostRepositoryImpl({
    required this.postDataSource,
  });

  @override
  Future<Either<Failure, PostModel>> getAllPost({required int pageNo}) async {
    try {
      final res = await postDataSource.getAllPost(pageNo: pageNo);
      print('Post Data >>>>>>>>>>>>>> ${res.data}');
      if (res.statusCode == 200) {
        return Right(PostModel.fromJson(
          res.data,
        ));
      } else {
        return Left(Failure(
          code: res.statusCode!,
          message: res.statusMessage!,
        ));
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, CommentModel>> getAllComment(
      {required int pageNo, required int postID}) async {
    try {
      final res = await postDataSource.getAllPostComment(
          pageNo: pageNo, postID: postID);
      print('Post Data Comment >>>>>>>>>>>>>> ${res.data}');
      if (res.statusCode == 200) {
        return Right(CommentModel.fromJson(
          res.data,
        ));
      } else {
        return Left(Failure(
          code: res.statusCode!,
          message: res.statusMessage!,
        ));
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, PostLikeModel>> getAllLikes(
      {required int pageNo, required int postID}) async {
    try {
      final res =
          await postDataSource.getAllPostLike(pageNo: pageNo, postID: postID);
      print('Post Data Comment >>>>>>>>>>>>>> ${res.data}');
      if (res.statusCode == 200) {
        return Right(PostLikeModel.fromJson(
          res.data,
        ));
      } else {
        return Left(Failure(
          code: res.statusCode!,
          message: res.statusMessage!,
        ));
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
