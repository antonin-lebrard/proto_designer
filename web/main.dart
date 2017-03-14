// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:convert';

void main() {
  Map game = JSON.decode(querySelector("#json").innerHtml)["game"];
  DivElement e = new DivElement();
  document.body.append(e);
  createHtmlNodesForValue(e, game, "");
}


createHtmlNodesForValue(DivElement container, var value, String path){
  DivElement valueEl = new DivElement();
  valueEl.classes.add("value");
  if (value is Map) {
    DivElement mapBeginEl = new DivElement()..innerHtml = "{";
    DivElement mapEndEl = new DivElement()..innerHtml = "}";
    mapBeginEl.classes.add("begin");
    mapEndEl.classes.add("end");
    container.append(mapBeginEl);
    createHtmlNodesFromMap(valueEl, value, path);
    container.append(valueEl);
    container.append(mapEndEl);
  }
  else if (value is List) {
    DivElement listBeginEl = new DivElement()..innerHtml = "[";
    DivElement listEndEl = new DivElement()..innerHtml = "]";
    listBeginEl.classes.add("begin");
    listEndEl.classes.add("end");
    container.append(listBeginEl);
    createHtmlNodesFromList(valueEl, value, path);
    container.append(valueEl);
    container.append(listEndEl);
  }
  else {
    valueEl.innerHtml = value.toString();
    container.append(valueEl);
  }
}


void createHtmlNodesFromMap(DivElement parent, Map currentMap, String currentPath){
  parent.classes.add("container");

  currentMap.forEach((key, value){
    DivElement mapEl = new DivElement();
    DivElement mapKeyEl = new DivElement();
    DivElement mapSeparatorEl = new DivElement()..innerHtml = ":";
    // to find it later, will be something like 'game.player.objects.test'
    String id = currentPath + (currentPath.isNotEmpty ? "." : "") + key;
    mapEl.id = id;
    mapEl.classes.add("element");
    mapKeyEl.classes.add("key");
    mapSeparatorEl.classes.add("separator");
    mapKeyEl.innerHtml = key;
    mapEl.append(mapKeyEl);
    mapEl.append(mapSeparatorEl);

    createHtmlNodesForValue(mapEl, value, id);

    parent.append(mapEl);
  });
}

void createHtmlNodesFromList(DivElement parent, List currentList, String currentPath){
  parent.classes.add("container");

  currentList.forEach((value){
    DivElement listEl = new DivElement();
    DivElement listValueEl = new DivElement();
    DivElement listSeparatorEl = new DivElement()..innerHtml = ",";
    listEl.classes.add("element");
    listValueEl.classes.add("key");
    listSeparatorEl.classes.add("separator");

    createHtmlNodesForValue(listEl, value, currentPath);

    parent.append(listEl);
  });
}