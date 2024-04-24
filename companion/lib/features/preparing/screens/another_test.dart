import 'package:flutter/material.dart';





class NeighboringWidgetsGrid extends StatefulWidget {
  @override
  _NeighboringWidgetsGridState createState() => _NeighboringWidgetsGridState();
}

class _NeighboringWidgetsGridState extends State<NeighboringWidgetsGrid> {
  List<List<Widget>> gridWidgets = [];
  int selectedRow = 0;
  int selectedColumn = 0;

  @override
  void initState() {
    super.initState();
    // Initialize a 3x3 grid of widgets
    for (int i = 0; i < 3; i++) {
      List<Widget> row = [];
      for (int j = 0; j < 3; j++) {
        row.add(
          GestureDetector(
            onTap: () {
              setState(() {
                selectedRow = i;
                selectedColumn = j;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Text('Widget $i,$j'),
                  ),
                ),
              ),
            ),
          ),
      
      
      
        );
      }
      gridWidgets.add(row);
    }
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedRow = (selectedRow - 1).clamp(0, 2);
                  });
                },
                child: Text('Top'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedColumn = (selectedColumn - 1).clamp(0, 2);
                  });
                },
                child: Text('Left'),
              ),
            
              gridWidgets[selectedRow][selectedColumn],
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedColumn = (selectedColumn + 1).clamp(0, 2);
                  });
                },
                child: Text('Right'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedRow = (selectedRow + 1).clamp(0, 2);
                  });
                },
                child: Text('Bottom'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
