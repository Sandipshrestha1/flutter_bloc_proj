import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_proj/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishlistButtonClickedEvent>(
    homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigatedEvent>(homeCartButtonNavigatedEvent);
    on<HomeWishlistButtonNavigatedEvent>(homeWishlistButtonNavigatedEvent);
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
