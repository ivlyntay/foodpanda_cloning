import 'package:flutter/material.dart';

void main() => runApp(FoodpandaCloneApp());

class FoodpandaCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodpanda UI Clone',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white, // <--- Add this
      ),
      home: RestaurantMenuPage(),
    );
  }
}

class RestaurantMenuPage extends StatelessWidget {
  final List<Map<String, String>> drinks = [
    {"title": "KOI Thé Milk Tea", "image": "assets/images/milk_tea.jpg", "category": "Popular", "price": "10.90"},
    {"title": "KOI Thé Green Milk Tea", "image": "assets/images/green_milk_tea.png", "category": "Popular", "price": "11.50"},
    {"title": "Matcha Yogurt", "image": "assets/images/matcha_yougurt.jpg", "category": "Popular", "price": "13.50"},
    {"title": "Caramel Milk Tea", "image": "assets/images/caramel_milk_tea.jpg", "category": "Popular", "price": "11.90"},
    {"title": "Coffee Jelly Green Milk Tea", "image": "assets/images/coffee_jelly_green_milk_tea.jpg", "category": "New! Must Try", "price": "12.50"},
    {"title": "Hazelnut Milk Tea", "image": "assets/images/hazelnut_milk_tea.jpg", "category": "New! Must Try", "price": "11.70"},
    {"title": "Peach Green Tea", "image": "assets/images/peach_green_tea.jpg", "category": "New! Must Try", "price": "11.90"},
    {"title": "Yakult Green Tea", "image": "assets/images/yakult_green_tea.jpg", "category": "New! Must Try", "price": "10.90"},
    {"title": "Milk Tea", "image": "assets/images/milk_tea.jpg", "category": "Milk Tea", "price": "9.90"},
    {"title": "Honey Milk Tea", "image": "assets/images/honey_milk_tea.jpg", "category": "Milk Tea", "price": "9.90"},
    {"title": "Oolong Milk Tea", "image": "assets/images/oolong_milk_tea.jpg", "category": "Milk Tea", "price": "10.50"},
    {"title": "Mango Yakult Juice", "image": "assets/images/mango_yakult_juice.jpg", "category": "Flavored Tea", "price": "10.90"},
    {"title": "Lychee Black Tea", "image": "assets/images/lychee_black_tea_macchiato.jpg", "category": "Flavored Tea", "price": "10.50"},
    {"title": "Honey Fresh Lemon Juice", "image": "assets/images/honey_fresh_lemon_juice.jpg", "category": "Flavored Tea", "price": "10.50"},
  ];

@override
Widget build(BuildContext context) {
  return DefaultTabController(
    length: 4,
    child: Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 120, // <- Increase height so logo and content can fit
            title: Stack(
              children: [
                // Centered logo + text
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 8),
                      Image.asset('assets/images/koi_logo.png', height: 50),
                      SizedBox(height: 4),
                      Text(
                        'KOI Thé (Sutera Mall)',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          SizedBox(width: 4),
                          Text("5.0 (500+ ratings)", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                        ],
                      ),
                    ],
                  ),
                ),
                // Left icon
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                // Right icons
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.info_outline, color: Colors.black),
                      SizedBox(width: 12),
                      Icon(Icons.favorite_border, color: Colors.black),
                      SizedBox(width: 12),
                      Icon(Icons.share_outlined, color: Colors.black),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        body: Column(
          children: [
            // Menu Filter Row
            Container(
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.all(4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Row(
                            children: [
                              Icon(Icons.delivery_dining, color: Colors.black),
                              SizedBox(width: 6),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        // Unselected: Pick Up
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Row(
                            children: [
                              Icon(Icons.storefront, color: Colors.grey),
                              SizedBox(width: 6),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row for Delivery text and Change button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // To space the text and button
                          children: [
                            Expanded(
                              child: Text(
                                "Delivery Fri, 12:00 - 12:45",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                softWrap: true, // Allows the text to wrap to the next line
                                overflow: TextOverflow.visible, // Ensures the text continues wrapping as needed
                              )
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("Change", style: TextStyle(fontSize: 14)), // Button style can be customized here
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "RM 6.49 delivery or RM 4.49 with Saver",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Min. order RM 10.00",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Discount Section
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.local_offer, color: Colors.pink),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "RM 5 off: SYOK5",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Min. order RM 25. Valid for all items.",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Search Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search in menu",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            // Tab Section
            TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.pink,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Selected tab text style
              unselectedLabelStyle: TextStyle(fontSize: 16), // Unselected tab text style
              tabs: [
                Tab(text: 'Popular'),
                Tab(text: 'New! Must Try'),
                Tab(text: 'Milk Tea'),
                Tab(text: 'Flavored Tea'),
              ],
            ),
            // TabBarView Section
            Expanded(
              child: TabBarView(
                children: [
                  _buildPopularMenu(context),
                  _buildListMenu(context, "New! Must Try"),
                  _buildListMenu(context, "Milk Tea"),
                  _buildListMenu(context, "Flavored Tea"),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}


Widget _buildPopularMenu(BuildContext context) {
  final popularDrinks = drinks.where((drink) => drink['category'] == "Popular").toList();

  return SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          children: [
            Icon(Icons.local_fire_department, color: Colors.pink),
            SizedBox(width: 8),
            Text(
              'Popular',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 4), // Title & subtitle spacing
        Text(
          'Most ordered right now',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        SizedBox(height: 4), 

        // Drinks Grid
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: popularDrinks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.70,
          ),
          itemBuilder: (context, index) {
            final drink = popularDrinks[index];
            return _buildDrinkItem(
              drink['title']!,
              drink['image']!,
              drink['price']!,
            );
          },
        ),
      ],
    ),
  );
}

Widget _buildListMenu(BuildContext context, String category) {
  final categoryDrinks = drinks.where((drink) => drink['category'] == category).toList();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: ListView.builder(
      itemCount: categoryDrinks.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Text(
              category,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), // Larger category text
            ),
          );
        }
        final drink = categoryDrinks[index - 1];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16), // Increased vertical padding
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(drink['title']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), // Larger title text
                    SizedBox(height: 6),
                    Text("RM ${drink['price']!}", style: TextStyle(color: Colors.grey[600], fontSize: 14)), // Larger price text
                    SizedBox(height: 6),
                    Text("Delicious and refreshing drink.", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ),
              SizedBox(width: 16), // Larger space between text and image
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      drink['image']!,
                      width: 120, // Larger image width
                      height: 120, // Larger image height
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8), // Larger padding for the icon
                      child: Icon(Icons.add, color: Colors.white, size: 20), // Larger icon size
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}


Widget _buildDrinkItem(String title, String imagePath, String price) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.1, // Taller image
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "RM $price",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
        ),
        SizedBox(height: 8),
      ],
    ),
  );
}
}
