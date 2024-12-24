import 'package:elevate_task/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/cubit/products_cubit.dart';
import '../widget/error_widget.dart';
import '../widget/loading_widget.dart';
import '../widget/products_grid_view.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<ProductsCubit>()..getProducts(),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            switch (state) {
              case GetProductsInitial():
              case GetProductsLoading():
                return const LoadingWidget();
              case GetProductsSuccess():
                return CategoryGridView(
                  products: state.products,
                );
              case GetProductsError():
                return MyErrorWidget(
                  error: state.error,
                  serverError: state.serverError,
                  retryText: 'Retry',
                  onCLick: () {
                    BlocProvider.of<ProductsCubit>(context).getProducts();
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
