import 'package:bloc/bloc.dart';
import 'package:elevate_task/core/utils/result.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/product_model.dart';
import '../../../domain/entity/product_entity.dart';
import '../../../domain/usecase/get_products_use_case.dart';

part '../state/products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  @factoryMethod
  ProductsCubit({required this.useCase}) : super(GetProductsInitial());
  GetProductsUseCase useCase;

  void getProducts() async {
    emit(GetProductsLoading());
    var result = await useCase.execute();
    switch (result) {
      case Success<List<ProductEntity>>():
        emit(GetProductsSuccess(products: result.data));
      case ServerError<List<ProductEntity>>():
        emit(GetProductsError(serverError: result));
      case Error<List<ProductEntity>>():
        emit(GetProductsError(error: result));
    }
  }
}
