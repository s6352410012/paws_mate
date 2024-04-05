import 'package:flutter/material.dart';
import 'package:paws_mate/login.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  // Example data for filters
  final List<String> typeFilters = ['Type 1', 'Type 2', 'Type 3'];

  // Variable to store the selected filter
  String? selectedTypeFilter;

  // Show filter dialog
  void _showFilterDialog({
    required List<String> filters,
    required String? selectedFilter,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Filter'),
        content: SingleChildScrollView(
          child: ListBody(
            children: filters.map((filter) {
              return RadioListTile<String>(
                title: Text(filter),
                value: filter,
                groupValue: selectedFilter,
                onChanged: (String? value) {
                  setState(() {
                    selectedFilter = value;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the LoginUI screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginUI()),
            );
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 216, 231, 255), // Background color
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10), // Add some space
            Image.asset(
              'assets/images/pawsMate logo resize.png', // Path to the image
              width: 200, // You can adjust the size
              height: 100, // You can adjust the size
            ),
            Container(
              color: const Color.fromARGB(255, 216, 231, 255),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterChip(
                      label: Text('All'),
                      selected: selectedTypeFilter == null,
                      onSelected: (value) {
                        setState(() {
                          selectedTypeFilter = null;
                        });
                      },
                    ),
                    FilterChip(
                      label: Text('Type'),
                      selected: selectedTypeFilter != null,
                      onSelected: (value) {
                        _showFilterDialog(
                          filters: typeFilters,
                          selectedFilter: selectedTypeFilter,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Welcome to Home Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
