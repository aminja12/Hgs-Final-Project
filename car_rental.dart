import 'package:flutter/material.dart';


class CarRentalApp extends StatelessWidget {
  CarRentalApp(Function() address);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Rental App'),
      ),
      body: CarListScreen(),
    );
  }
}

class CarListScreen extends StatelessWidget {
  final List<Car> cars = [
    Car('Toyota Camry', 'images/camry.jpeg'),
    Car('Honda Accord', 'images/accord.jpeg'),
    Car('Ford Mustang', 'images/mustang.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Cars'),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(cars[index].image),
            title: Text(cars[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailScreen(car: cars[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CarDetailScreen extends StatelessWidget {
  final Car car;

  CarDetailScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
      ),
      body: Column(
        children: [
          Image.asset(car.image),
          SizedBox(height: 16),
          Text(
            car.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Implement rental logic here
            },
            child: Text('Rent this car'),
          ),
        ],
      ),
    );
  }
}

class Car {
  final String name;
  final String image;

  Car(this.name, this.image);
}