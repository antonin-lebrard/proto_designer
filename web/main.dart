// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

void main() {
  String a ="a";
  List<String> l = new List<String>();

  Map<String, String> m = new Map();
  m.putIfAbsent("k", (){
    return "b";
  });
  print(m["k"]);

  print(a.split(" "));

}
