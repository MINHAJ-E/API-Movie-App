import 'package:flutter/material.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/helpers/colors.dart';
import 'package:movie_app/model/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/back_btn.dart';

class DetailesScreen extends StatelessWidget {
  const DetailesScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          leading: const BackBtn(),
          backgroundColor: Calours.scaffoldbgColor,
          expandedHeight: 500,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            // title: Text(
            //   movie.title!,
            //   style: GoogleFonts.belleza(
            //     fontSize: 20,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            background: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: Image.network(
                '${Constants.imagePath}${movie.posterPath}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  'overview',
                  style: GoogleFonts.openSans(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  movie.overview!,
                  style: GoogleFonts.acme(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Release Date :  ',
                              style: GoogleFonts.acme(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              movie.releaseDate!,
                              style: GoogleFonts.acme(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(width: 140,
                         padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        
                        ),
                        child: Row(
                          children: [
                            Text('Rating ',  style: GoogleFonts.acme(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),),const Icon(Icons.star,color: Colors.amber,),
                              Text('${movie.voteAverage!.toStringAsFixed(1)}/10')
                          ],
                        ),
                      )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

