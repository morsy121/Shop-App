import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/search_model.dart';
import 'package:shopapp/modules/search/cubit/states.dart';
import 'package:shopapp/shared/components/constance.dart';
import 'package:shopapp/shared/network/end_point.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(url: SEARCH, data: {'text': text}, token: token)
        .then((value) {
      model = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error);
      emit(SearchErrorState());
    });
  }
}
