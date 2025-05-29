

import 'package:flutter/material.dart';
const regular = "Poppins-Regular";
const semibold = "Poppins-SemiBold";
const bold = "Poppins-Bold";
const BoxShadow commonShadow = BoxShadow(
  color: Colors.white,
  blurRadius: 30.0,
  spreadRadius: 1.0,
  offset: Offset(0, 2),
);

// For more specific shadows, you can create additional constants:
const BoxShadow subtleShadow = BoxShadow(
  color: Colors.black12,
  blurRadius: 4.0,
  offset: Offset(0, 1),
);

const BoxShadow strongShadow = BoxShadow(
  color: Colors.black38,
  blurRadius: 12.0,
  spreadRadius: 2.0,
  offset: Offset(0, 4),
);