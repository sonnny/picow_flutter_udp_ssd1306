
import 'package:flutter/material.dart';
import 'dart:io';

RawDatagramSocket? socket;

void main() async {
  socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4,8080);
  runApp(MainApp());}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  
final myController = TextEditingController();

// message 5 char 
void send_on() async {
  socket?.send('LEDON'.codeUnits, InternetAddress(myController.text),8080);}
  
void send_off() async {
  socket?.send('LEDOF'.codeUnits, InternetAddress(myController.text),8080);}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Pico W UDP demo')),
        body: Center(child: Column(children:[
          SizedBox(height:50.0),
          SizedBox(width: 220, child: TextField(controller: myController,
            decoration: InputDecoration(border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(25),
              labelText: 'pico w ip address'),
            style: TextStyle(fontSize: 25))),
          SizedBox(height:50),
          ElevatedButton(child: Text('led on'), onPressed: send_on),
          SizedBox(height:100.0),
          ElevatedButton(child: Text('led off'), onPressed: send_off)
        ]))));}}

