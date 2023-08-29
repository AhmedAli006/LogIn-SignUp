import 'package:flutter/material.dart';
import 'package:login/ApiData/data.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List newList = [...ProductData.prodData];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.builder(
        itemCount: ProductData.prodData.length,
        itemBuilder: (context, index) {
          final product = newList[index] as Map<String, dynamic>;
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              clipBehavior: Clip
                  .antiAliasWithSaveLayer, //  Radius at the top of the card are covered by image

              child: Column(
                children: [
                  Image.network(
                    product['images'][0].toString(),
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product['title'].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${product['price']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    product['description'].toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                      icon: const Icon(Icons.delete_rounded),
                      iconSize: 50,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: const Text("Delete Item"),
                                  content: const Text(
                                      "Do you want to delete the following item",
                                      ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          newList.removeAt(index);
                                          Navigator.pop(context, true);
                                        });
                                      },
                                      child: Container(
                                        color: Colors.green,

                                        padding: const EdgeInsets.all(14),
                                        child: const Text("Yes" ,style: TextStyle(color: Colors.black),),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        
                                          
                                          Navigator.pop(context, true);
                                        
                                      },
                                      child: Container(
                                        color: Colors.red,
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("No",style: TextStyle(color: Colors.black),),
                                      ),
                                    ),
                                    
                                  ],
                                ));
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

