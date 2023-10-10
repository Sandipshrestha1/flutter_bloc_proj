import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_proj/data/grocery_data.dart';
import 'package:flutter_bloc_proj/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEven);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigatedEvent>(homeCartButtonNavigatedEvent);
    on<HomeWishlistButtonNavigatedEvent>(homeWishlistButtonNavigatedEvent);
  }

  FutureOr<void> homeInitialEven(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSucessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist  Product Clicked');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Product Clicked");
  }

  FutureOr<void> homeWishlistButtonNavigatedEvent(
      HomeWishlistButtonNavigatedEvent event, Emitter<HomeState> emit) {
    print(" Wishlist Navigation Clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigatedEvent(
      HomeCartButtonNavigatedEvent event, Emitter<HomeState> emit) {
    print("Cart  Navigation Clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
