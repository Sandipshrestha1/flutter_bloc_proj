import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_proj/fetaures/cart/ui/cart_screen.dart';
import 'package:flutter_bloc_proj/fetaures/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_proj/fetaures/wishlist/ui/wishlist.dart';

import 'product_tile_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// passing bloc

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
// It listerns only when it get action State

      listenWhen: (previous, current) => current is HomeActionState,

// It only work when
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartScreen()));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishList()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          //   break;
          case HomeLoadedSucessState:
          final sucessState = state as HomeLoadedSucessState;
            //  break;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text("Bloc Project"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigatedEvent());
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigatedEvent());
                      },
                      icon: Icon(Icons.shopping_bag_rounded))
                ],
              ),

body: ListView.builder(
  
  itemCount: sucessState.products.length,
  
  itemBuilder: (context, index) {
return ProductTileWidget(productDataModel:sucessState.products[index] );


}),


            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text("Error")));
          default:
            return SizedBox();
        }
      },
    );
  }
}
