import 'package:flutter/material.dart';

int cartedItems=0;

class Products extends StatefulWidget {
  const Products({Key? key});
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {


    final List<Map<String, dynamic>> myProducts = [
    {
      'image': 'assets/images/Bag.png',
      'name': 'Backpack',
      'price': 39.99,
      'rating': 4.6,
      'reviews': 92,
    },
    {
      'image': 'assets/images/Sneakers.png',
      'name': 'Running Shoes',
      'price': 49.99,
      'rating': 4.3,
      'reviews': 64,
    },
    {
      'image': 'assets/images/SmartWatch.png',
      'name': 'Smart Watch',
      'price': 99.99,
      'rating': 4.7,
      'reviews': 85,
    },
    {
      'image': 'assets/images/WirelessHeadphones.png',
      'name': 'Headphones',
      'price': 59.99,
      'rating': 4.5,
      'reviews': 120,
    },

    {
      'image': 'assets/images/Sunglasses.png',
      'name': 'Sunglasses',
      'price': 29.99,
      'rating': 4.8,
      'reviews': 38,
    },

    {
      'image': 'assets/images/Camera.png',
      'name': 'Camera',
      'price': 199.99,
      'rating': 4.8,
      'reviews': 56,
    },
  ];


  Widget productCard({
  required String imgPath,
  required String productName, 
  required num productPrice, 
  num rating=0.0, 
  num numOfReviews=0, 
  bool isFavorite=false }
  )
  {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow:[
          BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 10,
          offset: const Offset(0,4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children:[
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffEEEFF3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset (imgPath, fit: BoxFit.contain),
                ),
              ),

              Positioned(
                top:0,
                right:0,
                child: Icon( 
                  isFavorite? Icons.favorite: Icons.favorite_border,
                  color: isFavorite? Colors.red: Color(0xff8E94A2),
                  size:20,
                ),
              ),
            ],
          ),

          const SizedBox(height:10),

          Text(
            productName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${productPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Color(0xff003FBD),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Row(
                    children:
                    [
                    const Icon(Icons.star, color: Color(0xffFEC217), size:14,),
                    const SizedBox(height: 2),
                    Text(
                      '$rating',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xffFEC217),
                        fontWeight:FontWeight.normal,
                      ),
                    ),

                    SizedBox(width:2),

                    Text(
                      '($numOfReviews)',
                      style:TextStyle(
                        color: Colors.grey,
                        fontSize:12,
                        fontWeight: FontWeight.normal,
                      )
                    ),

                    SizedBox(width:6),

                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xffECF4FD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell( 
                        onTap: () {
                          setState(() {
                            cartedItems += 1;
                          });
                        },
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Color(0xff003FBD),
                          size: 20,
                        ),
                      ),
                    )
                  ],
                  )
                ],
                )
            ]
          )
      ],
      )
    );

}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Products",
            style: TextStyle(
              fontSize:20, 
              color: Colors.black,
              fontWeight: FontWeight.w900,
              ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu, color: Color(0xff4C5A6A),),
                onPressed:(){
                  Navigator.pop(context);
                }
              ),
              actions:[
                Stack(
                  children:[
                    IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined, color:Color(0xff4C5A6A), size:32,),
                      onPressed:(){
                        Navigator.pushNamed(context, '/screen');
                      }
                    ),
                    Positioned(
                      top:2,
                      right:5,
                      child: Container(
                        width: 20,
                        height: 20,
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$cartedItems',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:12,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
                
              
        

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
            // Search Bar Row
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Color(0xffF2F3F7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(width:10),

                Container(
                  padding: const EdgeInsets.all(2),
                  width: 45,
                  height: 45, 
                  decoration: BoxDecoration(
                    color: Color(0xffF2F3F7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: Color(0xff4C5A6A),),
                    onPressed:(){
                      Navigator.pushNamed(context, '/screen');
                    }
                    ),
                  ),
              ],
            ),
            ),
            
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: Row(
                children: [
                  categoryCard(categoryName:"All"),
                  categoryCard(categoryName: "Electronics"),
                  categoryCard(categoryName: "Fashion"),
                  categoryCard(categoryName: "Home"),
                  categoryCard(categoryName: "Sports"),
                  categoryCard(categoryName: "Beauty"),
                  ],
                ),
            ),

                        Expanded (
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 10,
                  mainAxisExtent:300,
                  childAspectRatio: 0.78,
                ),
                itemCount: myProducts.length, 
                itemBuilder: (context, index){
                  final product = myProducts[index]; 
                  
                  return productCard(
                    imgPath: product['image'],
                    productName: product['name'],
                    productPrice: product['price'],
                    numOfReviews: product['reviews'],
                    rating: product['rating'],
                    isFavorite: index == 0, 
                  );
                },
              ),
            ),
          ],
          ),

          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              // Color of the pill shape behind the icon
              indicatorColor: const Color(0xffE8F2FE), 
    
              // Color of the text under the icon (optional)
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold);
                  }
                return const TextStyle(color: Colors.grey, fontSize: 12);
              }),
    
               // Color of the icon itself
              iconTheme: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return const IconThemeData(color: Colors.blue); // Selected color
                  }
                return const IconThemeData(color: Colors.grey); // Unselected color
              }),
            ),
            child: NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: 0,
            onDestinationSelected: (int index){
              print('Tab $index tapped');
            },

            destinations: const[
              NavigationDestination(icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label:'Home',
              ),

              NavigationDestination(icon: Icon(Icons.grid_view_outlined),
              selectedIcon:Icon(Icons.grid_view),
              label:'Products',
              ),

              NavigationDestination(icon: Icon(Icons.favorite_border),
              selectedIcon:Icon(Icons.favorite),
              label:'Favorites',
              ),

              NavigationDestination(icon: Icon(Icons.person_outline),
              selectedIcon:Icon(Icons.person),
              label:'Profile',
              ),
            ]
            ),
          ),
      ),
      );
  }
}




Widget categoryCard({required String categoryName, bool isSelected=false}){
  return Padding(
    padding: const EdgeInsets.only(right: 10.0),
  
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xff4B89F6) : const Color(0xffF2F3F7),
        foregroundColor: Colors.black,
        elevation:0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      onPressed:(){},
      child: Text(categoryName),
      )
  );

}

