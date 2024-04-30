import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';
import 'package:random_color/random_color.dart';
import 'package:badges/badges.dart' as badges;

RandomColor _randomColor = RandomColor();

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
                      style: TextStyle(color: Colors.black),
                    ),
                    onSelected: (value) {
                      setState(() {
                        selectedFilters = ['Other'];
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Color.fromARGB(232, 244, 244, 244),
                  ),
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: 2.56,
                  children: [
                    _buildImageFrame('assets/images/dognopng1.png'),
                    _buildImageFrame('assets/images/catnobg.png'),
                    _buildImageFrame('assets/images/rabbitnobg.png'),
                    _buildImageFrame('assets/images/dognobg.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageFrame(String imagePath) {
    return Padding(
      padding: EdgeInsets.all(8.0), // Add padding around each frame
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: _randomColor.randomColor(
            colorSaturation: ColorSaturation.lowSaturation,
            colorBrightness: ColorBrightness.light,
          ),
          borderRadius: BorderRadius.circular(40.0), // Outer border radius
        ),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500), // Animation duration
            curve: Curves.easeInOut, // Animation curve
            transform: Matrix4.translationValues(selectedFilters.isNotEmpty ? 200 : -70, 0, -70), // Move to the left if filters are selected
            child: Container(
              width: 193,
              height: 139,
              decoration: BoxDecoration(
                color: _randomColor.randomColor(
                  colorSaturation: ColorSaturation.lowSaturation,
                  colorBrightness: ColorBrightness.light,
                ),
                borderRadius: BorderRadius.circular(60.0), // Inner border radius
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeUI(),
  ));
}
