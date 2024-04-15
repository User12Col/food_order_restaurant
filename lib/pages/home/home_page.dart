import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/pages/home/children/table_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tables = [
    'Bàn 1',
    'Bàn 2',
    'Bàn 3',
    'Bàn 4',
    'Bàn 5',
    'Bàn 6',
    'Bàn 7',
    'Bàn 8',
    'Bàn 9',
    'Bàn 10'
  ];

  List<String> status = [
    'Full',
    'Empty',
    'Full',
    'Empty',
    'Full',
    'Empty',
    'Full',
    'Empty',
    'Full',
    'Empty',
  ];

  List<String> filters = ['All', 'Full', 'Empty'];
  String _selectedItem = 'Full';

  @override
  Widget build(BuildContext context) {
    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Lọc: ', style: TextStyle(fontSize: 18),),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: MediaQuery.of(context).size.width / 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      onChanged: (value) {
                        setState(() {
                          _selectedItem = value!;
                        });
                      },
                      value: _selectedItem,
                      iconSize: 20,
                      icon: Icon(Icons.arrow_downward),
                      isExpanded: true,
                      items: filters.map(buildMenuItem).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 8 / 4),
                itemBuilder: (context, index) {
                  return TableWidget(title: tables[index], status: status[index],);
                },
                itemCount: tables.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
