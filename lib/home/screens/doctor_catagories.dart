import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class DoctorCategoryPage extends StatelessWidget {
  const DoctorCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bliss',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration:const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.purple, Colors.blue])),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 240.136,
          crossAxisSpacing: 5,
          mainAxisSpacing: 1,
        ) ,
        itemCount: 10,
        itemBuilder: (BuildContext context , int index){
          return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.purple.shade200,
                      child: Image.asset(
                        "assets/images/doctor1.png",
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Title(
                      color: Colors.black,
                        child: Text(
                          "Dr. Richard",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                    ),
                    VxRating(
                      selectionColor: Colors.yellow,
                      onRatingUpdate: (value) { },
                      maxRating: 5,
                      count: 5,
                      value: 4,
                      stepInt: true,
                    ),


                  ],
                ),
              ),

          );
        },
      ),


    );
  }
}