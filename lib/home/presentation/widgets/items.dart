import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesing/home/presentation/logic/home/holder_cubit.dart';
import 'package:tesing/common/app_constants.dart';
import 'package:tesing/common/app_colors.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        context.read<HolderCubit>().loadData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HolderCubit, HolderState>(
      buildWhen: (previous, current) =>
          previous.placeHolderLists != current.placeHolderLists ||
          previous.errorMessage != current.errorMessage ||
          previous.isAllLoaded != current.isAllLoaded,
      builder: (_, state) {
        return ListView.separated(
          controller: _scrollController,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemCount: state.placeHolderLists.length + 1,
          itemBuilder: (_, index) {
            if (index == state.placeHolderLists.length) {
              return Center(
                child: state.isAllLoaded || state.errorMessage != null
                    ? Text(state.errorMessage ?? AppConstants.noData)
                    : const CircularProgressIndicator(),
              );
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: AppColors.shared.orange,
              ),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(state.placeHolderLists[index].id.toString()),
                ),
                title: Text(state.placeHolderLists[index].title.toString()),
                subtitle: Text(state.placeHolderLists[index].body.toString()),
              ),
            );
          },
        );
      },
    );
  }
}
