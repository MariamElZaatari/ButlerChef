import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: double.infinity,
      height: 40,
      child: const Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search recipes...',
            prefixIcon: Icon(Icons.search_rounded,
                color: AppColors.green,
          ),
        ),
      ),
    ),
    );
  }
}