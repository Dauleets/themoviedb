import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/theme/options.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: AppColors.whiteColor,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text('В главных ролях',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,bottom: 20),
            child: SizedBox(
              height: 300,
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: 20,
                  itemExtent: 120,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.2)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.blackColor.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2))
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage(AppImages.actor),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Chris Hemsworth', maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(height: 7,),
                                    Text('Thor Odinson',maxLines: 4,style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
                                    SizedBox(height: 7,),
                                    Text('4 Episodes',maxLines: 1,style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // TextButton(
          //     onPressed: () {},
          //     child: Padding(
          //       padding: const EdgeInsets.all(3.0),
          //       child: Text('Актёрский и съёмочный состав',
          //           style:
          //               TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: AppColors.blackColor)),
          //     ))
        ]));
  }
}
