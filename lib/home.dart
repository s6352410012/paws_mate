import 'package:flutter/material.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:paws_mate/account.dart';
import 'package:paws_mate/login.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Favorite Page'),
    Text('Inbox Page'),
    Text('Story Page'),
  ];

  List<FilterOption> typeFilters = [
    FilterOption(id: 1, title: "Cat"),
    FilterOption(id: 2, title: "Dog"),
    FilterOption(id: 3, title: "Other"),
  ];

  List<FilterOption> ageFilters = [
    FilterOption(id: 1, title: "0-1 year"),
    FilterOption(id: 2, title: "1-3 years"),
    FilterOption(id: 3, title: "3+ years"),
  ];

  List<FilterOption> selectedTypeFilters = [];
  List<FilterOption> selectedAgeFilters = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(246, 225, 220, 252),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginUI()),
            );
          },
        ),
        title: Text('someone'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountUI()),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle popup menu item selection
              print('Selected: $value');
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Text('Option 1'),
                ),
                PopupMenuItem<String>(
                  value: 'option2',
                  child: Text('Option 2'),
                ),
                PopupMenuItem<String>(
                  value: 'option3',
                  child: Text('Option 3'),
                ),
              ];
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterChip(
                    label: Text('All'),
                    selected: selectedTypeFilters.isEmpty &&
                        selectedAgeFilters.isEmpty,
                    onSelected: (value) {
                      setState(() {
                        selectedTypeFilters.clear();
                        selectedAgeFilters.clear();
                      });
                    },
                  ),
                  FilterChip(
                    label: Text('Type'),
                    selected: selectedTypeFilters.isNotEmpty,
                    onSelected: (value) {
                      _showFilterDialog(
                          filters: typeFilters,
                          selectedFilters: selectedTypeFilters);
                    },
                  ),
                  FilterChip(
                    label: Text('Age'),
                    selected: selectedAgeFilters.isNotEmpty,
                    onSelected: (value) {
                      _showFilterDialog(
                          filters: ageFilters,
                          selectedFilters: selectedAgeFilters);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(232, 213, 218, 244),
        unselectedItemColor: Colors.white70,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Icon(Icons.home, color: Colors.yellow)
                : Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Image.asset(
                    'assets/images/iconfavblack.png',
                    color: Colors.yellow,
                    width: 25,
                    height: 25,
                  )
                : Image.asset(
                    'assets/images/iconfavblack.png',
                    color: Colors.black,
                    width: 25,
                    height: 25,
                  ),
            label: 'Story',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Icon(Icons.inbox, color: Colors.yellow)
                : Icon(Icons.inbox, color: Colors.black),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Image.asset(
                    'assets/images/iconreserve.png',
                    color: Colors.yellow,
                    width: 25,
                    height: 25,
                  )
                : Image.asset(
                    'assets/images/iconreserve.png',
                    color: Colors.black,
                    width: 25,
                    height: 25,
                  ),
            label: 'Story',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    );
  }

  void _showFilterDialog({
    required List<FilterOption> filters,
    required List<FilterOption> selectedFilters,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: filters
                .map(
                  (filter) => CheckboxListTile(
                    title: Text(filter.title),
                    value: selectedFilters.contains(filter),
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value) {
                          selectedFilters.add(filter);
                        } else {
                          selectedFilters.remove(filter);
                        }
                      });
                    },
                  ),
                )
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Apply'),
            ),
          ],
        );
      },
    );
  }
}

class FilterOption {
  final int id;
  final String title;

  FilterOption({required this.id, required this.title});
}
