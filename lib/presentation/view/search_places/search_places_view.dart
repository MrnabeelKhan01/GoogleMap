import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SearchPlacesView extends StatefulWidget {
  const SearchPlacesView({super.key});

  @override
  State<SearchPlacesView> createState() => _SearchPlacesViewState();
}

class _SearchPlacesViewState extends State<SearchPlacesView> {
   TextEditingController searchController = TextEditingController();
  var uuid=const Uuid();
  String token="123";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
     onChanged();
    });
  }
void onChanged(){
    if(token==null){
      setState(() {
        token=uuid.v4();
      });
    }
    getSuggestions(searchController.text);
}
void getSuggestions(String input)async{

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Places",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:  Column(
        children: [
          TextFormField(
            decoration:InputDecoration(

            ),
          )
        ],
      ),
    );
  }
}
