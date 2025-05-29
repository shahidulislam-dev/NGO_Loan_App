import 'package:flutter/material.dart';
import 'package:ngo_app/const/const.dart';

Widget homeCard({
  required String icon,
  required String title,
  required String status,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 8, right: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        Image.asset(icon, height: 66, width: 61),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          status,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
