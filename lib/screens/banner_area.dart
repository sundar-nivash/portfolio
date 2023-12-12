import 'package:flutter/material.dart';

class PortfolioBanner extends StatelessWidget {
  final String image;
  final String h1;
  final String subtitle;
  final List<SocialMediaLink> socialMediaLinks;

  const PortfolioBanner({
    Key? key,
    required this.image,
    required this.h1,
    required this.subtitle,
    required this.socialMediaLinks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 134, 22, 22),
            Color.fromARGB(255, 201, 164, 42),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 20),
          Text(
            h1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: socialMediaLinks
                .map((link) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        link.icon,
                        color: Colors.white,
                        size: 30,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class SocialMediaLink {
  final IconData icon;
  final String url;

  const SocialMediaLink(this.icon, this.url);
}

final socialMediaLinks = [
  SocialMediaLink(Icons.facebook, 'https://www.facebook.com/your-portfolio'),
  SocialMediaLink(Icons.facebook, 'https://www.twitter.com/your-portfolio'),
  SocialMediaLink(Icons.facebook, 'https://www.linkedin.com/your-portfolio'),
];
