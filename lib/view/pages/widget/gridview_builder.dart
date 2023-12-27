import 'package:flutter/material.dart';
import 'package:movie_app/constants/constance.dart';

// ignore: must_be_immutable
class GridWidget extends StatelessWidget {
  GridWidget({super.key, required this.snapshot});
  AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,),
          itemBuilder: (context, index) {
            // Movie movieData = snapshot.data[index];
            return GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                         
                        },
                        child:  ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imagePath}${snapshot.data![index].posterPath}'
                  ),
                ),
              ),
                      ),
                    ),
                  ),
                  Text("${snapshot.data![index].name}",
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
            );
          }),
    );
  }
}