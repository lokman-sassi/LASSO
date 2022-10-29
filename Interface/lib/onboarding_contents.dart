import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Welcome to LASSO app!",
    image: "assets/images/image1.png",
    desc: "You want to buy a laptop, but you don't know the price?",
  ),
  OnboardingContents(
      title: "Keep an eye on laptop market!",
      image: "assets/images/image2.png",
      desc:
          "We offer you a mobile application that can predict laptops prices."),
];
