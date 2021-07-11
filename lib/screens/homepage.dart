import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo1/screens/taskpage.dart';
import 'package:todo1/widgets.dart';

//usando stful para obter o widget pronto e só editar os nomes

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity, //expande o espaço q pode utilizar na pagina home
          padding: EdgeInsets.symmetric(horizontal: 25.0,),
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, //alinha pra começar a partir do inicio da página, no caso o canto superior esquerdo
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 30.0,
                      bottom: 30.0,
              ),
                    child: Image(
                      image: AssetImage(
                        'lib/assets/images/pencil.png'),
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder(
                        initialData: [],
                        future: _dbHelper.getTasks(),
                        builder: (context, snapshot){
                          return ScrollConfiguration(
                            behavior: NoGlowBehaviour(),
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index),{
                                return GestureDetector(
                                onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => Taskpage(
                            task: snapshot.data[index],
                            ),
                            ),
                            ).then(
                            (value) {
                            setState(() {});
                            },
                            );
                            },
                                child: TaskCardWidget(
                                title: snapshot.data[index].title,
                            desc: snapshot.data[index].description,
                                ),
                            );
                            },
                            ),
                          );
                        },
                      ),
                    )
                ],
              ),
              Positioned(
                bottom: 25.0,
                right: 0.0,
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Taskpage(task: null)),
                    ).then((value){ //essa parte do programa vai armazenar as tasks criadas pelo usuário e mostrar na homepage
                        setState(() {});
                    });
                  },
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 1.0)
                      borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image(
                    image: AssetImage(
                      "assets/images/add.png"
                    ),
                  ),
                ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
