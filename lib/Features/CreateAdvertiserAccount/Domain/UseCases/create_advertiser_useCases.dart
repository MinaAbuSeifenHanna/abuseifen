import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../Core/Failures/failures.dart';
import '../../../../Features/CreateAdvertiserAccount/Domain/Entities/create_advertiser_entity.dart';
import '../../../../Features/CreateAdvertiserAccount/Domain/Repository/advertiser_repository.dart';

class CreateAdvertiserUsecases {
  AdvertiserRepository repo;

  CreateAdvertiserUsecases({
    required this.repo,
  });

  Future<Either<Failure, CreateAdvertiserEntity>> call({
    required String firstName,
    required String lastName,
    required String companyName,
    required String brandName,
    required String weblink,
    required String email,
    required String phone,
    required File commercialDocument,
  }) {
    return repo.createAdvertiser(
      firstName: firstName,
      lastName: lastName,
      companyName: companyName,
      brandName: brandName,
      weblink: weblink,
      email: email,
      phone: phone,
      commercialDocument: commercialDocument,
    );
  }
}
