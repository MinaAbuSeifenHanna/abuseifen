import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';
import 'package:hypelify_v2/Features/CreateAdvertiserAccount/Domain/Entities/create_advertiser_entity.dart';

abstract class AdvertiserRepository {
  Future<Either<Failure, CreateAdvertiserEntity>> createAdvertiser({
    required String firstName,
    required String lastName,
    required String companyName,
    required String brandName,
    required String weblink,
    required String email,
    required String phone,
    required File commercialDocument,
  });
}
