import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesing/home/data/datasources/holder_data_source.dart';
import 'package:tesing/home/domain/repositories/holder_repository.dart';
import 'package:tesing/home/presentation/logic/home/holder_cubit.dart';
import 'package:tesing/home/presentation/widgets/items.dart';
import 'package:tesing/common/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HolderCubit(HolderRepository(HolderDataSource())),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appBarTitle),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Items(),
      ),
    );
  }
}
