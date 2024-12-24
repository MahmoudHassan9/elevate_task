part of '../cubit/products_cubit.dart';

sealed class ProductsState {}

final class GetProductsInitial extends ProductsState {}

final class GetProductsLoading extends ProductsState {}

final class GetProductsSuccess extends ProductsState {
  List<ProductEntity> products;

  GetProductsSuccess({required this.products});
}

final class GetProductsError extends ProductsState {
  ServerError? serverError;
  Error? error;

  GetProductsError({this.serverError, this.error});
}
