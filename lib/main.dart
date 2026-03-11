import 'package:flutter/material.dart';

void main() {
  runApp(const MiTiendaMascotas());
}

// 1. Clase Productos con los atributos solicitados
class Productos {
  final String titulo;
  final String subtitulo;
  final String imgUrl;

  Productos({
    required this.titulo,
    required this.subtitulo,
    required this.imgUrl,
  });
}

class MiTiendaMascotas extends StatelessWidget {
  const MiTiendaMascotas({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Lista de diccionarios para cada tarjeta
    final List<Map<String, String>> datosCoches = [
      {
        "titulo": "Cordero negro alimento húmedo en lata para perro 380gm",
        "subtitulo": "\$99.00",
        // Imagen actualizada para evitar el error de carga
        "img": "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?q=80&w=400&auto=format&fit=crop",
      },
      {
        "titulo": "Croquetas de carne para perro marca premium 10kg",
        "subtitulo": "\$139.00",
        "img": "https://images.unsplash.com/photo-1568640347023-a616a30bc3bd?q=80&w=400&auto=format&fit=crop",
      },
    ];

    // Mapeo de diccionarios a objetos de la clase Productos
    final List<Productos> listaProductos = datosCoches.map((item) {
      return Productos(
        titulo: item["titulo"]!,
        subtitulo: item["subtitulo"]!,
        imgUrl: item["img"]!,
      );
    }).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pet Shop"),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título superior en naranja
              const Text(
                "INICIO",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              // Columna de 2 filas con tarjetas
              Column(
                children: listaProductos.map((prod) {
                  return Card(
                    elevation: 4, // Sombreado
                    margin: const EdgeInsets.only(bottom: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          // Imagen a la izquierda (con manejo de error)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              prod.imgUrl,
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.pets, size: 50, color: Colors.grey),
                            ),
                          ),
                          const SizedBox(width: 15),
                          // Columna derecha con 2 filas (Título y Subtítulo)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  prod.titulo,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  prod.subtitulo,
                                  style: const TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 25),

              // Título Busca x categoría
              const Text(
                "BUSCA X CATEGORIA",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              // Columna de categorías (4 filas)
              _itemCategoria("perro", "https://cdn-icons-png.flaticon.com/128/620/620851.png"),
              _itemCategoria("gatos", "https://cdn-icons-png.flaticon.com/128/616/616430.png"),
              _itemCategoria("peces", "https://cdn-icons-png.flaticon.com/128/2613/2613702.png"),
              _itemCategoria("aves", "https://cdn-icons-png.flaticon.com/128/1933/1933512.png"),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para crear las filas de categorías rápidamente
  Widget _itemCategoria(String nombre, String iconUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.network(iconUrl, width: 35, height: 35),
          const SizedBox(width: 15),
          Text(
            nombre.toUpperCase(),
            style: const TextStyle(color: Colors.orange, fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}