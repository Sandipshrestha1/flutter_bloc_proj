import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_proj/fetaures/cart/ui/cart_screen.dart';
import 'package:flutter_bloc_proj/fetaures/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_proj/fetaures/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// passing bloc
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
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text(" Hamro Pasal"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeCartButtonNavigatedEvent());
                  },
                  icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeWishlistButtonNavigatedEvent());
                  },
                  icon: Icon(Icons.shopping_cart))
            ],
          ),
        );
      },
    );
  }
}
