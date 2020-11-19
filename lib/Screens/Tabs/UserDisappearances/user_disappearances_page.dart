import 'package:flutter/material.dart';

class UserDisappearancesPage extends StatelessWidget {
  const UserDisappearancesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Color(0xFF5DD39E),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 15,
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jorge Maquera',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      DropdownButton(
                        icon: Icon(
                          Icons.more_vert,
                          size: 35,
                          color: Colors.white,
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.exit_to_app),
                                SizedBox(width: 8),
                                Text('Cerrar sesión'),
                              ],
                            ),
                            value: 'logout',
                          )
                        ],
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Publicaciones',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5DD39E),
                              ),
                            ),
                            Icon(
                              Icons.add,
                              size: 30,
                              color: Color(0xFF5DD39E),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Card(
                              elevation: 2,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15),
                                    ),
                                    child: FadeInImage(
                                      placeholder: AssetImage(
                                        'assets/images/placeholder-image.png',
                                      ),
                                      image: NetworkImage(''),
                                      fit: BoxFit.cover,
                                      height: 240,
                                      width: double.infinity,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: 'Carlos Ezeta ',
                                            style: TextStyle(
                                              color: Color(0xFF525174),
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '20 años',
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Fecha de desaparición: '),
                                            Text('08/11/2020'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Fecha de desaparición: '),
                                            Text('08/11/2020'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Estado: '),
                                            Text('DESAPARECIDO'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Última ubicación: '),
                                            Expanded(
                                              child: Text(
                                                'Av. Oscar R. Benavides Cercado de Lima',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text('Contactos'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Teléfono: '),
                                            Text('993504601'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Correo: '),
                                            Text('porcarlos@gmail.com'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
