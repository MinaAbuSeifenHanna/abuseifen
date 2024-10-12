import 'package:dartz/dartz.dart';
import 'package:hypelify_v2/Features/Reels/Domain/Repositories/reels_repository.dart';

import '../../../../Core/Failures/failures.dart';
import '../Entities/reel.dart';

class GetReelsUsecase {
  ReelsRepository reelsRepository;
  GetReelsUsecase({
    required this.reelsRepository,
  });

  Future<Either<Failure, ReelsEntity>> call({required int pageNo}) async {
    print('Reels Data RR >>>>>>>>>>> GetReelsUseCases');
    return await reelsRepository.getReels(pageNo: pageNo);
  }
}
