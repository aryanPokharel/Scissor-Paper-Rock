import 'package:flutter/material.dart';

class LeaderBoards extends StatefulWidget {
  const LeaderBoards({super.key});

  @override
  State<LeaderBoards> createState() => _LeaderBoardsState();
}

class _LeaderBoardsState extends State<LeaderBoards> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [Text("Local"), Text("Global")]),
          ),
          body: TabBarView(
            children: [
              Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Date'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Streak'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('6/22/2023'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('9'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('6/22/2024'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('7'),
                        ),
                      ),
                    ],
                  ),
                  // Add more TableRow widgets as needed
                ],
              ),
              const Text("These are global scores")
            ],
          ),
        ),
      ),
    );
  }
}
