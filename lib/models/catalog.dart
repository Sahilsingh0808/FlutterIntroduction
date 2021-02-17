class CatalogueModel
{
   static List<Item> items=[Item(
     id: 1,
   name: "ROG",
   desc: "ROG Phone Asus",
   color: "#33505a",
   price: 999,
   image: 'https://i.gadgets360cdn.com/products/large/asus-rogphone2-db-800x719-1563875000.jpg',

   )


  ];
}
class Item
{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
  factory Item.fromMap(Map<String,dynamic> map)
  {
    return Item(
      id:map["id"],
        name:map["name"],

    desc:map["desc"],

    price:map["price"],
    color:map["color"],
        image:map["image"],

    );
  }
  toMap()=>{
    "id":id,
    "name":name,
    "desc":desc,
    "price":price,
    "color":color,
    "image":image,
  };
}

