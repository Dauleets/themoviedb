import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/theme/options.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: AppImages.films,
      title: 'Тор: Любовь и гром',
      time: '7 июля 2022 г',
      description: 'Четвертый фильм, рассказывающий о судьбе бога грома Тора',
    ),
    Movie(
      id: 2,
      imageName: AppImages.films,
      title: 'Доктор Стрэндж: В мультивселенной безумия',
      time: '14 февраля 2022',
      description:
          'Продолжение магических приключений Доктора Стрэнджа в новых мистических мирах и в противостоянии с новыми врагами.',
    ),
    Movie(
      id: 3,
      imageName: AppImages.films,
      title: 'Всё везде и сразу ',
      time: '22 июня 2022',
      description:
          'В жизни Эвелин царит бардак. Она никак не может составить налоговый отчёт, пожилой отец постоянно требует внимания, муж витает в облаках, а ещё и дочка привела свою девушку знакомиться с семьёй.',
    ),
    Movie(
      id: 4,
      imageName: AppImages.films,
      title: 'Бэтмен',
      time: '17 октября 2021',
      description:
          'После двух лет поисков правосудия на улицах Готэма Бэтмен становится для горожан олицетворением беспощадного возмездия. ',
    ),
    Movie(
      id: 5,
      imageName: AppImages.films,
      title: 'Фантастические твари: Тайны Дамблдора',
      time: '13 декабря 2021',
      description:
          'Профессор Альбус Дамблдор узнаёт, что могущественный тёмный волшебник Геллерт Грин-де-Вальд планирует захватить власть над миром',
    ),
    Movie(
      id: 6,
      imageName: AppImages.films,
      title: 'Анчартед: На картах не значится',
      time: '27 января 2022',
      description:
          'Нейтан Дрейк не видел старшего брата Сэма 15 лет, с тех пор как тот сбежал из сиротского приюта.',
    ),
    Movie(
      id: 6,
      imageName: AppImages.films,
      title: 'Соник 2 в кино',
      time: '20 декабря 2021',
      description:
          'Поселившись в Грин-Хилз, Соник стремится доказать, что у него есть все задатки настоящего героя.а',
    ),
    Movie(
      id: 7,
      imageName: AppImages.films,
      title: 'Зверопой 2 ',
      time: '10 декабря 2021',
      description:
          'Тяжело быть продюсером, когда ты коала и у тебя лапки. Еще сложнее, когда твоя верная помощница древнее печатной машинки.',
    ),
    Movie(
      id: 7,
      imageName: AppImages.films,
      title: 'Человек-паук: Нет пути домой',
      time: '27 мая 2022 ',
      description:
          'Питер Паркер одержал победу над Мистерио, вот только его личность была раскрыта всему миру.',
    ),
    Movie(
      id: 7,
      imageName: AppImages.films,
      title: 'Дом Gucci',
      time: '10 декабря 2021',
      description:
          'Тяжело быть продюсером, когда ты коала и у тебя лапки. Еще сложнее, когда твоя верная помощница древнее печатной машинки.',
    ),
    Movie(
      id: 7,
      imageName: AppImages.films,
      title: 'King’s man: Начало',
      time: '10 декабря 2021',
      description:
          'Тяжело быть продюсером, когда ты коала и у тебя лапки. Еще сложнее, когда твоя верная помощница древнее печатной машинки.',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final querry = _searchController.text;
    if (querry.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(querry.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed('/main_screen/movie_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
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
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(movie.time,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.grey)),
                              const SizedBox(height: 20),
                              Text(movie.description,
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10)
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onMovieTap(index)),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                labelText: 'Поиск',
                filled: true,
                fillColor: AppColors.whiteColor.withAlpha(235),
                border: OutlineInputBorder()),
          ),
        )
      ],
    );
  }
}
