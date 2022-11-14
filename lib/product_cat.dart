import 'package:flutter/material.dart';
import 'package:untitled7/function_cat.dart';

import 'package:untitled7/model_confwert.dart';

class Product extends StatefulWidget {
  Product();
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<Data> foodList = [];

  void getDataFood() async {
    foodList = await getData1();

    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    foodList.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDataFood();
  }

  Icon _searchIcon = Icon(
    Icons.search,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        centerTitle: true,
        actions: [],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            return SingleProduct(
              foo_index: index,
              food: foodList[index],
            );
          },
        ),
      ),
    ));
  }
}

class SingleProduct extends StatelessWidget {
  int foo_index;
  Data food;
  SingleProduct({required this.foo_index, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 5.0),
              height: 100.0,
              width: 100.0,
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      food.name ?? 'default value',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      food.sorting.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      food.sorting ?? 'default value',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      food.description ?? 'default value',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    RichText(
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      text: TextSpan(children: [
                        TextSpan(
                          text: food.description ?? 'default value',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //=========================favorite

          //=========================end favorite
        ],
      ),
    );
  }
}
