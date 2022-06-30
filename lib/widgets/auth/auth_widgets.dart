import 'package:flutter/material.dart';
import 'package:themoviedb/theme/options.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Вход в свой аккаунт",
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [_HeaderWidget()],
        ));
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: kDefaultPadding,
        ),
        _FormWidget(),
        const SizedBox(
          height: kDefalutSizedbox,
        ),
        Text(
            'Чтобы использовать возможности редактирования и рейтинга TMDB которые вам понадобятся для входа в свою учетную запись. Если у вас нет учетной записи, регистрация для учетной записи является бесплатной и простой',
            style: AppTextStyle.style16),
        const SizedBox(height: 5),
        TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Зарегистрироваться')),
        const SizedBox(
          height: kDefalutSizedbox,
        ),
        Text(
          'Если у вас нет учетной записи, регистрация на учетную запись бесплатна и просто. Чтобы он обижался.',
          style: AppTextStyle.style16,
        ),
        const SizedBox(height: 5),
        TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Подтвердить электронную почту')),
      ]),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'password');
  String? errorText = null;
  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'password') {
      print('open app');
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Не верный пароль или логин';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('Сброс пароля');
  }

  @override
  Widget build(BuildContext context) {
    AppTextStyle.style16 = const TextStyle(color: Color(0xFF212529));
    final textFieldDecorator = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null)
          ...[Text(
            errorText,
            style: const TextStyle(color: Colors.red, fontSize: 17),
          ),
          const SizedBox(height: 20,),],
        Text('Имя пользователя', style: AppTextStyle.style16),
        const SizedBox(
          height: 5,
        ),
        TextField(
          decoration: textFieldDecorator,
          controller: _loginTextController,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Пароль',
          style: AppTextStyle.style16,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(
          height: kDefalutSizedbox,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              child: const Text('Авторизоваться'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.buttonColor),
                  foregroundColor:
                      MaterialStateProperty.all(AppColors.whiteColor),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8))),
            ),
            const SizedBox(
              width: 30,
            ),
            TextButton(
                onPressed: _resetPassword,
                child: const Text('Сброс пароля '),
                style: AppButtonStyle.linkButton)
          ],
        )
      ],
    );
  }
}
