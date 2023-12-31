import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedValue = 'List View'; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row for A-Z icon, List View dropdown, and Grid View dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Icon for A-Z sorting
                Icon(Icons.sort_by_alpha, color: Colors.blue),
                SizedBox(width: 8),
                // Dropdown for selecting List or Grid View
                DropdownButton<String>(
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    }
                  },
                  items: [
                    DropdownMenuItem<String>(
                      value: 'List View',
                      child: Row(
                        children: [
                          Icon(Icons.view_list),
                          SizedBox(width: 8),
                          Text('List View'),
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Grid View',
                      child: Row(
                        children: [
                          Icon(Icons.grid_on),
                          SizedBox(width: 8),
                          Text('Grid View'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Container with column layout
            if (selectedValue == 'List View')
              Container(
                color: Colors.lightBlue,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Item 1'),
                    Text('Item 2'),
                    Text('Item 3'),
                    // Add more items as needed
                  ],
                ),
              ),
            // Container with row (grid view) layout
            if (selectedValue == 'Grid View')
              Container(
                color: Colors.lightGreen,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.purple,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.yellow,
                    ),
                    // Add more items as needed
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}




