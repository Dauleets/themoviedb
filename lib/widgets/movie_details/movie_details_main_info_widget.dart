import 'package:flutter/material.dart';
import 'package:themoviedb/elements/radial_percent_widget.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/theme/options.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPoster(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverViewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        const SizedBox(height: 20),
        _StuffWidget(),
      ],
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: RadialRecentWidget(
                    child: const Text('72'),
                    percent: 0.72,
                    fillColor: const Color.fromARGB(255, 10, 23, 25),
                    lineColor: const Color.fromARGB(255, 37, 203, 103),
                    freeColor: const Color.fromARGB(255, 25, 54, 31),
                    lineWidth: 3,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Рейтинг',
                )
              ],
            )),
        Container(width: 1, height: 15, color: AppColors.greyColor),
        TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.play_arrow),
                Text(
                  'Трейлер',
                ),
              ],
            ))
      ],
    );
  }
}

class _StuffWidget extends StatelessWidget {
  const _StuffWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
        color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.w400);
    final jobTitleStyle = TextStyle(
        color: AppColors.whiteColor.withOpacity(0.5), fontSize: 14, fontWeight: FontWeight.w400);

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Taika Waititi',
                  style: nameStyle,
                ),
                Text(
                  'Director, Writer',
                  style: jobTitleStyle,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Taika Waititi',
                  style: nameStyle,
                ),
                Text(
                  'Director, Writer',
                  style: jobTitleStyle,
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Taika Waititi',
                  style: nameStyle,
                ),
                Text(
                  'Director, Writer',
                  style: jobTitleStyle,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Taika Waititi',
                  style: nameStyle,
                ),
                Text(
                  'Director, Writer',
                  style: jobTitleStyle,
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20)
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Text(
        'Тор отправляется в путешествие, не похожее ни на что из того, с чем он когда-либо сталкивался, — в поисках внутреннего спокойствия. Но его выход на пенсию прерывается Горром Убийцей богов, который стремится уничтожить богов. Чтобы справиться с угрозой, Тор обращается за помощью к Валькирии, Коргу и бывшей подруге Джейн Фостер, которая, к удивлению Тора, необъяснимым образом владеет своим волшебным молотом Мьёльниром. Вместе они отправляются в душераздирающее космическое приключение, чтобы раскрыть тайну Горра и остановить его, пока не стало слишком поздно.',
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class _OverViewWidget extends StatelessWidget {
  const _OverViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Text(
        'Обзор',
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _TopPoster extends StatelessWidget {
  const _TopPoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage(AppImages.topHeader)),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(image: AssetImage(AppImages.films)),
        )
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: TextSpan(children: [
        const TextSpan(
            text: 'Тор: Любовь и гром',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            )),
        TextSpan(
            text: ' (2021)',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
      ]),
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        child: Text(
          '08/07/2022 (US) боевик, приключения, фэнтези 1h 59m',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
