part of 'promotion_list_cubit.dart';

abstract class PromotionListState extends Equatable {
  const PromotionListState();

  @override
  List<Object?> get props => [];

  bool get isLoading => this is PromotionListLoading;
}

class PromotionListInitial extends PromotionListState {
  const PromotionListInitial();
}

class PromotionListLoading extends PromotionListState {
  const PromotionListLoading();
}

class PromotionListSuccess extends PromotionListState {
  final List<Promotion> promotions;

  const PromotionListSuccess(this.promotions);

  @override
  List<Object?> get props => [promotions];
}

class PromotionListError extends PromotionListState {
  final BaseException exception;

  const PromotionListError(this.exception);

  @override
  List<Object?> get props => [exception];
}
