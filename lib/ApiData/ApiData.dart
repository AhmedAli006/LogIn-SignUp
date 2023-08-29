import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/ApiData/ApiDataModel.dart';

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  List<Products>? products;

  void fetchProducts() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/product"));

    if (response.statusCode == 200) {
      var mapJson = jsonDecode(response.body);
      var productResult = ProductsResult.fromJson(mapJson);

      setState(() {
        products = productResult.products;
      });
    }
  }

  // void deleteData(id) async {
  //  final response = await http.delete(Uri.parse("https://dummyjson.com/product/$id"));
  // }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products == null
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                var item = products![index];

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
                          item.thumbnail.toString(),
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.title.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$${item.price}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          item.description.toString(),
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
                                                products?.removeAt(index);
                                                // deleteData(item.id);
                                                
                                                Navigator.pop(context, true);
                                              });
                                            },
                                            child: Container(
                                              color: Colors.green,
                                              padding: const EdgeInsets.all(14),
                                              child: const Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, true);
                                            },
                                            child: Container(
                                              color: Colors.red,
                                              padding: const EdgeInsets.all(14),
                                              child: const Text(
                                                "No",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ));
                            }),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
