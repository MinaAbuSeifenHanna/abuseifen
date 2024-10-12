import 'package:dio/dio.dart';
import 'package:hypelify_v2/Core/Constants/apis.dart';

class AddPostsDataSource {
  final Dio dio;

  const AddPostsDataSource(this.dio);

  Future<Response> addPosts(FormData data) async {
    return await dio.post(
      Apis.postPosts,
      data: data,
    );
  }
}
