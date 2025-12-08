import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/widgets/custom_text_form_filed.dart';
import 'package:glow_me/core/widgets/product_container_shimmer.dart';
import 'package:glow_me/features/home/presentation/views/widgets/custom_gridview_alll_brands.dart';
import 'package:glow_me/features/search/presentation/controller/cubit/search_cubit.dart';
import 'package:glow_me/features/search/presentation/controller/cubit/search_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearched = false;

  @override
  @override
  Widget build(BuildContext context) {
    final read = context.read<SearchCubit>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Search Field
              CustomTextFormFiled(
                isHidden: false,
                label: "Search for a brand",
                icon: const Icon(Icons.search_rounded),
                controller: read.searchConroller,
                onChanged: (value) {
                  setState(() => isSearched = value.isNotEmpty);
                  read.onTextChanged(value);
                },
              ),

              const SizedBox(height: 16),

              // Expanded area for results
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (!isSearched) {
                      return Center(
                        child: Text(
                          "Search for anything now",
                          style: AppFont.text18,
                        ),
                      );
                    }

                    if (state is LoadingSearchState) {
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        shrinkWrap: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 13,
                              childAspectRatio: 0.8,
                            ),
                        itemCount: 6,
                        itemBuilder: (_, __) => const ProductContainerShimmer(),
                      );
                    }

                    if (state is FailureSearchState) {
                      return Center(
                        child: Text(
                          "Error: ${state.errormsg}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }

                    if (state is LoadedSearchState) {
                      final products = state.product;
                      if (products.isEmpty) {
                        return Center(
                          child: Text(
                            "No products found",
                            style: AppFont.text16,
                          ),
                        );
                      }
                      return CustomGridViewAllBrands(product: products);
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
