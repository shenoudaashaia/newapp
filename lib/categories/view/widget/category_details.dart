// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/sources/view/widget/sources_tab.dart';
import 'package:newapp/sources/view_modle/sources_states.dart';
import 'package:newapp/sources/view_modle/sources_view_modle.dart';
import 'package:newapp/shared/widget/error_indigator.dart';
import 'package:newapp/shared/widget/loading_indigator.dart';

class CategoriesDetails extends StatefulWidget {
  final String categoryId;
   CategoriesDetails({super.key, required this.categoryId});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  final viewModle = SourcesViewModle();

  @override
  void initState() {
    super.initState();
    viewModle.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return 
    BlocProvider(
      create: (_) => viewModle,
      child: BlocBuilder<SourcesViewModle, SourcesState>(
        builder: (context, state) {
          if (state is GetSourcesLoading) {
            return const LoadingIndigator();
          } else if (state is GetSourcesError) {
            return ErrorIndigator(state.errorMassage);
          } else if (state is GetSourcesSuccess) {
            return SourcesTab(state.sources);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
