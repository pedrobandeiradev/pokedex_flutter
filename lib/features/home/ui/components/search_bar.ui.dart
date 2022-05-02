import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  late String searchText;

  SearchBar({Key? key}) : super(key: key);

  void _onSearchTextSubmission(String text) async {
    if (text.isEmpty) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(
          24.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _searchTextField,
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _submitButton,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _searchTextField {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                24.0,
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search Pokemon',
        ),
        enabled: true,
        onChanged: (text) {
          searchText = text;
        },
        onSubmitted: (text) => _onSearchTextSubmission(text),
      ),
    );
  }

  Widget get _submitButton {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.red,
        backgroundColor: Colors.white,
      ),
      child: SizedBox(
        width: 80.0,
        child: Row(
          children: [
            Container(
              height: 24,
              width: 24,
              padding: const EdgeInsets.only(
                right: 4.0,
              ),
              child: const Image(
                image: AssetImage(
                  'assets/pokeball.png',
                ),
              ),
            ),
            const Text('Submit'),
          ],
        ),
      ),
      onPressed: () => _onSearchTextSubmission(searchText),
    );
  }
}
