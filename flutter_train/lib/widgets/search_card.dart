import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  SearchCard({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextField(
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.black
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.white
              )
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: 'Search...',
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            suffixIcon: const Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
            hintStyle: const TextStyle(
              fontSize: 15.0,
              color: Colors.black
            )
          ),
          maxLines: 1,
          controller: _searchController,
        ),
      ),
    );
  }
}
