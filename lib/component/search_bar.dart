import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function callback;

  SearchBar(this.callback);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Search for Movies',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        onChanged: (text) {
          widget.callback(text);
        },
      ),
    );
  }
}
