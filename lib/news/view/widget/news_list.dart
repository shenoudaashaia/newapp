import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/news/view_modle/news_states.dart';
import 'package:newapp/news/view_modle/news_view_modles.dart';
import 'package:newapp/news/view/widget/news_item.dart';
import 'package:newapp/shared/widget/error_indigator.dart';
import 'package:newapp/shared/widget/loading_indigator.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.sourceID, {super.key});
  final String sourceID;
  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();


  @override
  Widget build(BuildContext context) {
     viewModel.getNews(widget.sourceID,1);
   
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(
        builder: (context, state) {
        if (state is GetNewsLoading) {
          return const LoadingIndigator();
        } else if (state is GetNewsError) {
          return ErrorIndigator(state.error);
        } else if (state is GetNewsSuccess) {
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(state.newsList[index]),
            itemCount: state.newsList.length,
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
