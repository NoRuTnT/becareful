import 'package:becarefulcrosswalk/provider/current_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceBoxWidget extends StatelessWidget {
  const ServiceBoxWidget({
    super.key,
    required this.color,
    required this.serviceName,
    required this.serviceScreen,
    required this.imageName,
  });

  final Color color;
  final String serviceName;
  final String serviceScreen;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<CurrentPage>(context, listen: false)
            .setCurrentPage(serviceScreen);
        Navigator.pushNamed(context, serviceScreen);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 150,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(color: Colors.black, width: 2.0),
            bottom: BorderSide(color: Colors.black, width: 2.0),
          ),
          color: color,
        ),
        child: Semantics(
          button: true,
          label: serviceName,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/$imageName.png',
                  width: 70, height: 70, fit: BoxFit.cover),
              SizedBox(width: 30),
              Text(
                textAlign: TextAlign.center,
                serviceName,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 8.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
