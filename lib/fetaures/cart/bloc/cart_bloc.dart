import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_proj/data/cart_items.dart';
import 'package:flutter_bloc_proj/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSucessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {


    cartItems.remove(event.productDataModel);
    emit(CartSucessState(cartItems: cartItems));
  // get your cartItems
  // check is  your product model  there  is  your cartItems -true
  // run  a function to remove  that product model from that cartItem
  // emit cartItemRemovedState
  
  
  }
}
