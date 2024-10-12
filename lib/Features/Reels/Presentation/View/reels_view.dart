import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypelify_v2/Features/Reels/Presentation/Widget/reels_content.dart';
import 'package:hypelify_v2/Features/Reels/Presentation/bloc/reels_bloc.dart';

class ReelsView extends StatefulWidget {
  const ReelsView({super.key});

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
  late ReelsBloc reelsBloc = context.read<ReelsBloc>();

  @override
  void initState() {
    reelsBloc.add(GetReelsData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ReelsBloc, ReelsState>(
          builder: (context, state) {
            if (state is ReelsHaveDataState) {
              return Stack(
                children: [
                  Swiper(
                    itemCount: state.reelsDataModel.length,
                    scrollDirection: Axis.vertical,
                    loop: false,
                    itemBuilder: (context, index) => ReelsContent(
                      src: state.reelsDataModel[index].reelPath!,
                      caption: state.reelsDataModel[index].caption ?? '',
                      audience: state.reelsDataModel[index].audience ?? '',
                      like: state.reelsDataModel[index].likes ?? '',
                      comment: state.reelsDataModel[index].comments!,
                      share: state.reelsDataModel[index].shares!,
                      name: state.reelsDataModel[index].reelsUserEntity!.name!,
                      image: state.reelsDataModel[index].reelsUserEntity!.image!,
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(), SizedBox(height: 10), Text('Loading...')],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
