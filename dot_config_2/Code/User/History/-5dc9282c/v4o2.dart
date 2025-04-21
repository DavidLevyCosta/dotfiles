import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class AppColors {
  static const Color verdeEscuro =
      Color(0xFF12372A); // #12372a, um verde escuro
  static const Color bege = Color(0xFFFbfada); // #fbfada, um bege claro
  static const Color verdeAcinzentado =
      Color(0xFFadbc9f); // #adbc9f, um verde acinzentado
}

class InteractiveText extends StatelessWidget {
  final Function()
      onSignUpTap; // Função a ser chamada quando "Solicite uma conta" for tocado

  const InteractiveText({super.key, required this.onSignUpTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: "Ainda não possui uma conta? ",
              style: TextStyle(
                  color: Colors.grey[800]) // Cor e estilo do texto normal
              ),
          TextSpan(
            text: "Solicite uma conta",
            style: TextStyle(
                color: Colors.blue[800],
                decoration:
                    TextDecoration.underline), // Cor e estilo do texto clicável
            recognizer: TapGestureRecognizer()
              ..onTap = onSignUpTap, // Uso do TapGestureRecognizer
          ),
        ],
      ),
    );
  }
}

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({super.key});

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
    );
  }
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: AppColors.bege,
          appBar: AppBar(
            backgroundColor: AppColors.verdeEscuro,
            elevation: 0,
            title: const Row(children: <Widget>[
              Text(
                "recycl",
                style: TextStyle(color: AppColors.bege),
              ),
              Expanded(
                  child: TabBar(
                indicatorColor: AppColors.verdeEscuro,
                tabs: [
                  Tab(
                      child: Text(
                    'Pagina Inicial',
                    style: TextStyle(color: AppColors.bege),
                  )),
                  Tab(
                    child: Text(
                      'Sobre',
                      style: TextStyle(color: AppColors.bege),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Seeds',
                      style: TextStyle(color: AppColors.bege),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Lista de Materias',
                      style: TextStyle(color: AppColors.bege),
                    ),
                  ),
                ],
              ))
            ]),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.bege, elevation: 0),
                child: const Text('Entrar',
                    style: TextStyle(color: AppColors.verdeEscuro)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.bege, elevation: 0),
                child: const Text(
                  'Cadastrar-se',
                  style: TextStyle(color: AppColors.verdeEscuro),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              buildLoginForm(context),
              const Icon(Icons.info),
              const Icon(Icons.list),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 450,
        decoration: BoxDecoration(
            color: AppColors.verdeAcinzentado,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.bege.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildTitle(),
              const SizedBox(height: 20),
              buildTextFormField(labelText: 'CPF', prefixIcon: Icons.person),
              const SizedBox(height: 20),
              buildTextFormField(
                  labelText: 'Senha', prefixIcon: Icons.password),
              const SizedBox(height: 20),
              buildRememberMeRow(),
              const SizedBox(height: 20),
              buildSubmitButton(),
              buildForgotPasswordButton(),
              buildCreateAccountButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return const Text(
      'Login',
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.verdeEscuro),
    );
  }

  Widget buildTextFormField(
      {required String labelText, required IconData prefixIcon}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget buildRememberMeRow() {
    return const Row(
      children: <Widget>[
        MyCheckBox(),
        Text(
          "Me mantenha conectado",
          style: TextStyle(color: AppColors.verdeEscuro),
        ),
      ],
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.verdeEscuro,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text("Enviar", style: TextStyle(color: AppColors.bege)),
    );
  }

  Widget buildForgotPasswordButton() {
    return TextButton(
      onPressed: () {},
      child: const Text("Esqueceu a senha?",
          style: TextStyle(color: AppColors.verdeEscuro)),
    );
  }

  Widget buildCreateAccountButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors
                .transparent; // Remove overlay quando o mouse passa sobre
          }
          return null; // Mantém o comportamento padrão para outros estados
        }),
        backgroundColor:
            MaterialStateProperty.all(Colors.transparent), // Fundo transparente
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: AppColors.verdeEscuro),
          children: <TextSpan>[
            const TextSpan(
              text: "Ainda não possui uma conta? ",
              style: TextStyle(color: AppColors.verdeEscuro),
            ),
            TextSpan(
              text: "Solicite uma conta",
              style: const TextStyle(
                  color: AppColors.verdeEscuro,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print("Prepare to navigate to SignUpScreen");
                  // Implementação da navegação futura aqui
                },
            ),
          ],
        ),
      ),
    );
  }
}
