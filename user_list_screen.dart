import 'package:flutter/material.dart';
import 'api_service.dart';
import 'user_model.dart';
import 'user_detail_screen.dart';

class UsersListScreen extends StatefulWidget {
  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers(); // Busca os usuários apenas uma vez 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUsers, // O Future que o builder vai observar 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Por padrão, mostra um indicador de carregamento. 
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}'); // Mostra a mensagem de erro. 
            } else if (snapshot.hasData) {
              // Se os dados estiverem disponíveis, constrói a lista. 
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.address.street),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailScreen(user: user),
                        ),
                      );
                    },
                  );
                },
              );
            }
            // Por padrão, mostra um indicador de carregamento.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
