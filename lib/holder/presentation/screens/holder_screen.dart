import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesing/common/app_colors.dart';
import 'package:tesing/common/pagination/cubit/pagination_cubit.dart';
import 'package:tesing/holder/data/datasources/holder_data_source.dart';
import 'package:tesing/holder/data/models/place_holder.dart';
import 'package:tesing/holder/domain/repositories/holder_repository.dart';
import 'package:tesing/common/app_constants.dart';

class HolderScreen extends StatelessWidget {
  const HolderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PaginationCubit<PlaceHolder>(
            HolderRepository(HolderDataSource()),
          ),
        ),
      ],
      child: const HolderScreenView(),
    );
  }
}

class HolderScreenView extends StatelessWidget {
  const HolderScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaginationCubit<PlaceHolder>>();
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<PaginationCubit<PlaceHolder>, PaginationState>(
          listener: (_, state) {
            if (state is PaginationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (_, state) {
            final isError = state is PaginationError;
            final isEndList = state.result.meta.endOfList;
            final length = state.result.list.length;

            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is! ScrollEndNotification) return false;
                final maxScroll = notification.metrics.maxScrollExtent;
                final currentScroll = notification.metrics.pixels;
                final isBottom = currentScroll >= maxScroll * 0.9;
                if (isBottom && isEndList == false) {
                  cubit.loadDataOnScroll();
                }
                return false;
              },
              child: RefreshIndicator(
                onRefresh: cubit.loadFreshData,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemCount: length + 1,
                  itemBuilder: (_, index) {
                    if (index == length) {
                      return Center(
                        child: isEndList || isError
                            ? Text(isError
                                ? AppConstants.unexpectedError
                                : AppConstants.noData)
                            : const CircularProgressIndicator(),
                      );
                    }

                    final item = state.result.list[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: AppColors.shared.orange,
                      ),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(item.id.toString()),
                        ),
                        title: Text(item.title),
                        subtitle: Text(item.body),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
