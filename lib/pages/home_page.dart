import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/item_widget.dart';
import 'dart:convert';
class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days=30;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async
  {
      final catalogJson=await rootBundle.loadString("assets/files/catalog.json");
      final decodedData=jsonDecode(catalogJson);
      var productData=decodedData["products"];
      CatalogueModel.items=List.from(productData)
          .map<Item>((item) => Item.fromMap(item)).toList();
      setState(() {

      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Phone Catalogue"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogueModel.items!=null&&CatalogueModel.items.isNotEmpty)
            ?GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20
          ),
          itemCount: CatalogueModel.items.length,
          itemBuilder: (context,index){
            final item=CatalogueModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  header:Container(
                    padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration( color: Colors.black,),child: Text(item.name, style:TextStyle(color:Colors.white,))),
                  child: Image.network(item.image,

                  ),
                footer: Container(
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration( color: Colors.blueGrey,),child: Text(item.price.toString(), style:TextStyle(color:Colors.white,))),
                    ));
          },
        ):Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}