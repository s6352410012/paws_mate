import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';
import 'package:random_color_scheme/random_color_scheme.dart';
import 'package:badges/badges.dart' as badges;

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final List<String> filters = [
    'Good with Other Animals',
    'Good with Kids',
    'Well-Trained',
    'Good with Other Dogs',
    'Small dogs',
    'Special Needs',
    'Vaccinated',
    'Girl',
    'Boy',
    'Active',
    'Long Hair',
    'Short Hair',
    'Cat',
    'Dog',
    'Other'
  ];
  List<String> selectedFilters = [];

  Future<void> _openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(context),
      headlineText: 'Select Filters',
      height: 500,
      listData: filters,
      selectedListData: selectedFilters,
      choiceChipLabel: (item) => item,
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      onItemSearch: (filter, query) {
        return filter.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedFilters = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 216, 231, 255),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon pressed
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 216, 231, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 1),
              Image.asset(
                'assets/images/pawsMate logo resize.png',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  badges.Badge(
                    badgeContent: Text(
                      selectedFilters.length.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: FilterChip(
                      avatar: Icon(Icons.filter_alt),
                      label: Text(
                        'Filters',
                        style: TextStyle(color: Colors.black),
                        ),
                      onSelected: (_) => _openFilterDialog(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Color.fromARGB(232, 246, 194, 194),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  FilterChip(
                    label: Text(
                      'All', 
                      style: TextStyle(color: Colors.black),
                    ),
                    onSelected: (value) {
                      setState(() {
                        selectedFilters = filters;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Color.fromARGB(232, 244, 244, 244),
                  ),
                  SizedBox(width: 8.0),
                  FilterChip(
                    label: Text(
                      'Cat',
                      style: TextStyle(color: Colors.black),
                    ),
                    onSelected: (value) {
                      setState(() {
                        selectedFilters = ['Cat'];
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Color.fromARGB(232, 244, 244, 244),
                  ),
                  SizedBox(width: 8.0),
                  FilterChip(
                    label: Text(
                      'Dog',
                      style: TextStyle(color: Colors.black),
                    ),
                    onSelected: (value) {
                      setState(() {
                        selectedFilters = ['Dog'];
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Color.fromARGB(232, 244, 244, 244),
                  ),
                  SizedBox(width: 8.0),
                  FilterChip(
                    label: Text(
                      'Others',
                      style: TextStyle(color: Colors.black), // Set text color
                    ),
                    onSelected: (value) {
                      setState(() {
                        selectedFilters = ['Other'];
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Color.fromARGB(
                        232, 244, 244, 244), // Set background color
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Text('Welcome to Home Page'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
