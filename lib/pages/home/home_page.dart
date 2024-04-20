import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/home/home_bloc.dart';
import 'package:restaurant/bloc/home/home_event.dart';
import 'package:restaurant/bloc/home/home_state.dart';
import 'package:restaurant/pages/home/children/table_widget.dart';
import 'package:restaurant/models/table.dart' as model;

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

  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(EventLoading());
  }

  @override
  Widget build(BuildContext context) {
    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                const Text('Lọc: ', style: TextStyle(fontSize: 14),),
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
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state){
                if(state.isLoading){
                  return Center(child: CircularProgressIndicator(),);
                } else if(state.isSuccess){
                  List<model.Table> tables = state.tables;
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, childAspectRatio: 8 / 6),
                      itemBuilder: (context, index) {
                        return TableWidget(table: tables[index],);
                      },
                      itemCount: tables.length,
                    ),
                  );
                } else{
                  return Expanded(child: Container(child: Text('Null'),));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
