import 'package:flutter/material.dart';
import 'package:flutterrecipe/helpers/dynamic_theme.dart';

class SearchScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
            //color: Colors.black,
            ),
        title: Text(
          'Search',
          style: TextStyle(
            color: isThemeDark(context) ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey[500], width: 1.5),
          ),
          child: _buildChild(),
        ),
      ),
    );
  }

  Widget _buildChild() {
    return TextField(
      cursorColor: Colors.red[900],
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        hintText: "Enter ingredient",
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
