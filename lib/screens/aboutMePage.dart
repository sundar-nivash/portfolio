import 'package:flutter/material.dart';
import 'package:flutterweb/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageView()));

            print('Contact text clickesdd!');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const Image(
              image: AssetImage('../asset/images/js.png'),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Handle "Work" action
              print('Work clicked');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Work',
                style: GoogleFonts.lexend(),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Handle "About" action
              print('About clicked');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'About',
                style: GoogleFonts.lexend(),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Handle "Contact" action
              print('Contact clicked');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Contact',
                style: GoogleFonts.lexend(),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/js.png'),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Software Developer | Flutter Enthusiast',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromARGB(255, 226, 226, 226)),
              width: 900,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hello! I\'m John Doe, a passionate software developer with a focus on Flutter development. I enjoy building beautiful and functional mobile applications. My goal is to contribute to the tech community and share knowledge with others.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () {
                    // Open link to your GitHub profile
                  },
                ),
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () {
                    // Open link to your LinkedIn profile
                  },
                ),
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () {
                    // Open link to your Twitter profile
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
