import 'package:flutter/material.dart';


void main() {
  runApp(PlantShopApp());
}


class PlantShopApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.green, 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/1.jpg',
                height: 200, 
              ), 
           SizedBox(height: 20),
              Container(
                padding:  EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                   SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.green,
                        padding:  EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      onPressed: () {
                        
                        if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                        
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Error"),
                                content: const Text("Please fill in both username and password."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                        
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  PlantListScreen()),
                          );
                        }
                      },
                      child: Text("Sign In"),
                    ),
                    SizedBox(height: 10),
                    Text("New User? Sign Up", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class PlantListScreen extends StatelessWidget {
  

  final List<Map<String, String>> plants =  [
    {
      "name": "Ficus",
      "price": "\$20",
      "image": "assets/1.jpg"
    },
    {
      "name": "Cactus",
      "price": "\$15",
      "image": "assets/2.jpg"
    },
    {
      "name": "Samantha",
      "price": "\$18",
      "image": "assets/3.jpg"
    },
    {
      "name": "Aloe Vera",
      "price": "\$22",
      "image": "assets/4.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  Icon(Icons.menu, color: Colors.black),
        actions:  [Icon(Icons.shopping_cart, color: Colors.black)],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What Kind Of Plants You Want",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Search...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon:  Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemCount: plants.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlantDetailScreen(plant: plants[index]),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.green[100],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(plants[index]["image"]!, height: 150, fit: BoxFit.cover),
                          Text(plants[index]["name"]!,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(plants[index]["price"]!, style:  TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PlantDetailScreen extends StatelessWidget {
  final Map<String, String> plant;

   PlantDetailScreen({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text("Details"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions:  [Icon(Icons.favorite_border, color: Colors.black)],
      ),
      body: Padding(
        padding:EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(plant["image"]!, height: 200, fit: BoxFit.cover),
             SizedBox(height: 20),
            Text(plant["name"]!, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            Text(plant["price"]!, style:  TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 10),
            Text(
              "This is a long-established plant that will add a fresh look to your home. It is easy to maintain and highly recommended.",
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              ),
              onPressed: () {},
              child:  Text("Buy Now"),
            ),
          ],
        ),
      ),
    );
  }
}
