import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_me/features/search/data/repo/search_repo_imple.dart';
import 'package:glow_me/features/search/presentation/controller/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepoImple searchRepoImple;
  SearchCubit({required this.searchRepoImple}) : super(InitalSearchState());

  TextEditingController searchConroller = TextEditingController();
  Timer? _debounce;

  void onTextChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (query.trim().isNotEmpty) {
        searchProduct(query.trim());
      } else {
        emit(InitalSearchState());
      }
    });
  }

  Future<void> searchProduct(String query) async {
    emit(LoadingSearchState());

    List<String> validTypes = [
      'blush',
      'bronzer',
      'eyebrow',
      'eyeliner',
      'eyeshadow',
      'foundation',
      'lip_liner',
      'lipstick',
      'mascara',
      'nail_polish',
    ];

    String? productType = validTypes.contains(query.toLowerCase())
        ? query.toLowerCase()
        : null;
    String? productBrand = productType == null ? query : null;

    final result = await searchRepoImple.searchProduct(
      productType: productType,
      productBrand: productBrand,
    );

    result.fold(
      (error) => emit(FailureSearchState(errormsg: error)),
      (list) => emit(LoadedSearchState(product: list)),
    );
  }
}
