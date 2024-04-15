class Food{
  String foodID;
  String name;
  double unitPrice;
  String image;
  
  Food(this.foodID, this.name, this.unitPrice, this.image);
}
String image = 'https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg';
List<Food> fakeData = [
  Food('foodID', 'Burger', 100000, image),
  Food('foodID', 'Burger', 100000, image),
  Food('foodID', 'Burger', 100000, image),
  Food('foodID', 'Burger', 100000, image),
  Food('foodID', 'Burger', 100000, image),
  Food('foodID', 'Burger', 100000, image),
];