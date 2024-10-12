import 'package:dio/dio.dart';

class PostDataSource {
  Dio _dio;
  PostDataSource(this._dio);

  Future<Response> getAllPost({required int pageNo}) => _dio.get(
        'posts/get-all?per_page=50&page=$pageNo',
      );

  Future<Response> getAllPostComment(
          {required int pageNo, required int postID}) =>
      _dio.get(
        'posts/comments/get?per_page=50&page=$pageNo&post_id=$postID',
      );

  Future<Response> getAllPostLike({required int pageNo, required int postID}) =>
      _dio.get(
        'posts/likes/get?per_page=50&page=$pageNo&post_id=$postID',
      );
}
