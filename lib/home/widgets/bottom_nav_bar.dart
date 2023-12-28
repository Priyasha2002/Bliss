import 'package:bliss_app/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.purple.shade200,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(

          label: 'Home',

          // icon: Icon(
          //   Icons.home,
          // ),
          icon: IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(
                IndexChangedEvent(
                  selectedIndex: 0,
                ),
              );
            },
            icon: const Icon(
              Icons.home,
              size: 40,
              color: Colors.deepPurple,
            ),
          ),
        ),
        BottomNavigationBarItem(

          label: '',
          // icon: Icon(
          //   Icons.message,
          // ),
          icon: IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(
                IndexChangedEvent(
                  selectedIndex: 1,
                ),
              );
            },
            icon: const Icon(
              Icons.message,
            ),
          ),
        ),
      ],
    );
  }
}