import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hypelify_v2/Core/Handler/error_handler.dart';
import 'package:hypelify_v2/Features/CreateAdvertiserAccount/Data/DataSource/advertiser_datasource.dart';
import '../../../../Core/Failures/failures.dart';
import '../../../../Features/CreateAdvertiserAccount/Domain/Repository/advertiser_repository.dart';
import '../../Domain/Entities/create_advertiser_entity.dart';

class CreateAdvertiserRepositoryImpl implements AdvertiserRepository {
  AdvertiserDatasource advertiserDatasource;

  CreateAdvertiserRepositoryImpl({
    required this.advertiserDatasource,
  });

  @override
  Future<Either<Failure, CreateAdvertiserEntity>> createAdvertiser(
      {required String firstName,
      required String lastName,
      required String companyName,
      required String brandName,
      required String weblink,
      required String email,
      required String phone,
      required File commercialDocument}) async {
    try {
      final data = await advertiserDatasource.createAdvertiser(
        firstName: firstName,
        lastName: lastName,
        companyName: companyName,
        brandName: brandName,
        weblink: weblink,
        email: email,
        phone: phone,
        commercialDocument: commercialDocument,
      );
      final response = CreateAdvertiserEntity.fromJson(data.data);
      print("Response Data >>>>> ${data.data}");
      return Right(response);
    } catch (e) {
      print("Response Data >>>>> $e");
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
