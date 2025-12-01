import 'package:bloc/bloc.dart';
import 'package:electrum/core/types/exception/base.dart';
import 'package:electrum/core/types/result.dart';
import 'package:electrum/features/promotion/domain/entities/promotion.dart';
import 'package:electrum/features/promotion/domain/usecases/get_promotions_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'promotion_list_state.dart';

@injectable
class PromotionListCubit extends Cubit<PromotionListState> {
  final GetPromotionsUsecase _getPromotionsUsecase;

  PromotionListCubit(this._getPromotionsUsecase)
    : super(const PromotionListLoading());

  Future<void> loadPromotions() async {
    emit(const PromotionListLoading());

    final result = await _getPromotionsUsecase();

    switch (result) {
      case Success(data: final promotions):
        emit(PromotionListSuccess(promotions));
      case Failure(exception: final exception):
        emit(PromotionListError(exception));
    }
  }
}
