import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Product.dart';
void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Flutter",
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget{
  MyHomePage({this.title});
  final String? title;
  final items = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu),tooltip: "Navigation menu", onPressed: null),
        title: Center(
          child: Text("Store Mobile"),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search),tooltip: "search", onPressed: null)
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductBox(item: items[index]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(item: items[index])));
            },
          );
        },
      )
    );
  }
}

class ProductPage extends StatelessWidget{
  ProductPage({this.item});
  final Product? item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infomation"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('${item?.image}'),
              Expanded(
                  child: Container(
                  padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('${item?.name}', 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigo),
                        ),
                        Text('${item?.description}'),
                        Text('${item?.price}')
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}
class _RatingBoxState extends State<RatingBox>{
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }
  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }
  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }
  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                _rating >= 1 ?
                Icon(
                    Icons.star, size: _size
                ) :
                Icon(
                    Icons.star_border, size: _size
                )
            ),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                _rating >= 2 ?
                Icon(
                    Icons.star, size: _size
                ) :
                Icon(
                    Icons.star_border, size: _size
                )
            ),
            color: Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                _rating >= 3 ?
                Icon(
                    Icons.star, size: _size
                ) :
                Icon(
                    Icons.star_border, size: _size
                )
            ),
            color: Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}

class ProductBox extends StatelessWidget{
  ProductBox({this.item});
  final Product? item;
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('${item?.image}'),
            Expanded(child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${item?.name.toString()}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red)),
                  Text('${item?.description.toString()}'),
                  Text('${item?.price.toString()}'),
                  RatingBox(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}


