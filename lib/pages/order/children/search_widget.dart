import 'package:flutter/material.dart';
class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width/2.5,
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          decoration: InputDecoration(

            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(fontSize: 12,),
            suffixIcon: InkWell(
              onTap: (){},
              child: Icon(Icons.search),
            )
          ),
        ),
      ),
    );
  }
}
