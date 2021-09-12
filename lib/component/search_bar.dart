import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function callback;

  SearchBar(this.callback);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: _myController,
        autofocus: false,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Search for Movies',
          suffixIcon: _myController.text.isEmpty
              ? Icon(
                  Icons.search,
                  color: Colors.black,
                )
              : IconButton(
                  onPressed: () {
                    _myController.clear();
                    FocusScope.of(context).unfocus();
                    widget.callback('');
                  },
                  icon: Icon(Icons.clear),
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
