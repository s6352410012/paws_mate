import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final List<String> typeFilters = ['Type 1', 'Type 2', 'Type 3'];
  final List<String> petFilters = ['Cat', 'Dog', 'Other']; // New filter options

  String? selectedTypeFilter;
  String? selectedPetFilter; // Variable to store the selected pet filter

  void _showTypeFilterDialog() {
    _showFilterDialog(
      filters: typeFilters,
      selectedFilter: selectedTypeFilter,
      onSelected: (value) {
        setState(() {
          selectedTypeFilter = value;
        });
      },
    );
  }

  void _showPetFilterDialog() {
    _showFilterDialog(
      filters: petFilters,
      selectedFilter: selectedPetFilter,
      onSelected: (value) {
        setState(() {
          selectedPetFilter = value;
        });
      },
    );
  }

  // Updated to include an onSelected callback
  void _showFilterDialog({
    required List<String> filters,
    required String? selectedFilter,
    required void Function(String?) onSelected,
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
                  onSelected(value);
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
      appBar: AppBar(), // Removed the leading icon
      backgroundColor: Color.fromARGB(255, 216, 231, 255), // Background color
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Image.asset(
              'assets/images/pawsMate logo resize.png',
              width: 200,
              height: 100,
            ),
            Container(
              color: Color.fromARGB(255, 216, 231, 255),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisSize:
                      MainAxisSize.min, // Make row as wide as the children
                  mainAxisAlignment: MainAxisAlignment
                      .start, // Align children to the start of the row
                  children: [
                    // Existing type filter chip
                    FilterChip(
                      avatar: Icon(Icons.filter_alt), // Add the icon
                      label: Text('Filter'),
                      selected: selectedTypeFilter != null,
                      onSelected: (_) => _showTypeFilterDialog(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),

                    SizedBox(width: 8),
                    FilterChip(
                      label: Text('Pet'),
                      selected: selectedPetFilter != null,
                      onSelected: (_) => _showPetFilterDialog(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    SizedBox(width: 8),
                    FilterChip(
                      label: Text('Dog'),
                      selected: selectedPetFilter != null,
                      onSelected: (_) => _showPetFilterDialog(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    SizedBox(width: 8),
                    FilterChip(
                      label: Text('Cat'),
                      selected: selectedPetFilter != null,
                      onSelected: (_) => _showPetFilterDialog(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    SizedBox(width: 8),
                    FilterChip(
                      label: Text('Other'),
                      selected: selectedPetFilter != null,
                      onSelected: (_) => _showPetFilterDialog(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
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
