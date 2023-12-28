import 'package:bliss_app/home/bloc/home_bloc.dart';
import 'package:bliss_app/home/screens/doctor_catagories.dart';
import 'package:bliss_app/home/screens/catagory.dart';
import 'package:bliss_app/home/widgets/bottom_nav_bar.dart';
import 'package:bliss_app/home/widgets/chat.dart';
import 'package:bliss_app/home/widgets/date.dart';
import 'package:bliss_app/home/widgets/emoticon_card.dart';
import 'package:bliss_app/home/widgets/greet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == HomeStatus.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Mood Changed to ${state.mood}',
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
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
          bottomNavigationBar: BottomNavBar(
            currentIndex: state.index,
          ),
          body: state.index == 0 ? const _HomeBody() : const CategoryPage(),
        );
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text(
              state.mood,
              style: const TextStyle(fontSize: 35),
            );
          },
        ),
      ),
      backgroundColor: Colors.purple.shade100,
      body:
      Scrollbar(
          child:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Greet(),
                    const Date(),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'How are you feeling today?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection:Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          const EmoticonCard(
                            emoticonFace: '😔',
                            mood: 'Depressed',
                          ),
                          const SizedBox(width: 40),
                          const EmoticonCard(
                            emoticonFace: '😊',
                            mood: 'Fine',
                          ),
                          const SizedBox(width: 40),
                          EmoticonCard(
                            emoticonFace: '😁',
                            mood: 'Well',
                          ),
                          const SizedBox(width: 40),
                          const EmoticonCard(
                            emoticonFace: '😃',
                            mood: 'Excellent',
                          ),
                          const SizedBox(width: 40),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
        Center(
        child: Stack(
          children: [
            const SizedBox(width: 40),
              Container(
                alignment: Alignment.center,
                margin:const EdgeInsets.all(30.0),
                child: Card(
                    color: Colors.purple.shade200,
                    shape:const  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>const chatpage()));
                      }, // Image tapped
                    splashColor: Colors.white10,
                    // Splash color over image
                    child: Ink.image(
                      fit: BoxFit.cover, // Fixes border issues
                      width: 300,
                      height: 150,
                      image:const  AssetImage(
                          "assets/images/chat_with.png",
                      ),
                    ),
                  )
                ),
              ),
            Container(  //second child
                 alignment: Alignment.center,
                 child: const Text(
                  'Connect with us ↓',
                  style: TextStyle(color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                ),
              ),
          ],//children
        ),
      ),

              Center(
                child: Stack(
                  children: [
                    const SizedBox(width: 40),
                    Container(
                      alignment: Alignment.center,
                      margin:const EdgeInsets.all(30.0),
                      child: Card(
                          color: Colors.purple.shade200,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                          child: InkWell(
                            onTap: () {

                            }, // Image tapped
                            splashColor: Colors.white10,
                            // Splash color over image
                            child: Ink.image(
                              fit: BoxFit.cover, // Fixes border issues
                              width: 300,
                              height: 150,
                              image: const AssetImage (
                                "assets/images/emotion_detect.png",
                              ),
                            ),
                          )
                      ),
                    ),
                    Container(  //second child
                      alignment: Alignment.center,
                      child: const Text(
                        'Detect your emotions ↓',
                        style: TextStyle(color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),
                    ),
                  ],//children
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    const SizedBox(width: 40),
                    Container(
                      alignment: Alignment.center,
                      margin:const EdgeInsets.all(30.0),
                      child: Card(
                          color: Colors.purple.shade200,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>const DoctorCategoryPage()));

                            }, // Image tapped
                            splashColor: Colors.white10,
                            // Splash color over image
                            child: Ink.image(
                              fit: BoxFit.cover, // Fixes border issues
                              width: 300,
                              height: 200,
                              image: const AssetImage (
                                "assets/images/doctor.png",
                              ),
                            ),
                          )
                      ),
                    ),
                    Container(  //second child
                      alignment: Alignment.center,
                      child: const Text(
                        'Consult with a doctor ↓',
                        style: TextStyle(color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),
                    ),
                  ],//children
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }
}
