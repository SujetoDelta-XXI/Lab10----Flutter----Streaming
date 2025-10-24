import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/trending_section.dart';
import '../widgets/reasons_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/footer_section.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  final String backgroundImage =
      'https://abellagraphicdesign.com/wp-content/uploads/2023/10/netflix-1.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Fondo que cubre toda la pantalla
          Positioned.fill(
            child: Image.network(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Blur y opacidad leve
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.black.withOpacity(0.1)),
            ),
          ),

          // 🔹 Contenido principal con scroll
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(context),
                _buildHero(context),
                const SizedBox(height: 40),
                const TrendingSection(),
                const SizedBox(height: 40),
                const ReasonsSection(),
                const SizedBox(height: 40),
                const FAQSection(),
                const SizedBox(height: 40),
                const FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------
  // Encabezado (logo, idioma, login)
  // --------------------------
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://images.ctfassets.net/y2ske730sjqp/1aONibCke6niZhgPxuiilC/2c401b05a07288746ddf3bd3943fbc76/BrandAssets_Logos_01-Wordmark.jpg?w=940',
            height: 45,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.language, size: 16, color: Colors.white),
                    SizedBox(width: 4),
                    Text('Español',
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE50914),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                ),
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --------------------------
  // Sección principal (Hero con texto y campo de email)
  // --------------------------
  Widget _buildHero(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
      child: Column(
        children: [
          Text(
            'PELÍCULAS Y SERIES\nILIMITADAS Y MUCHO MÁS',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          const Text(
            'A partir de S/ 28.90. Cancela cuando quieras.',
            style: TextStyle(color: Colors.white70, fontFamily: 'Roboto'),
          ),
          const SizedBox(height: 20),
          const Text(
            '¿Quieres ver Netflix ya? Ingresa tu email\npara crear una cuenta o reiniciar tu membresía.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontFamily: 'Roboto'),
          ),
          const SizedBox(height: 30),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.4),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text(
                      'Comenzar',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE50914),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
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
