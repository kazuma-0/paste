import 'dart:io';
//import 'package:args/args.dart';
import 'package:http/http.dart' as http;
void main(List<String> arguments) {
  arguments.isNotEmpty ? readfile(arguments[0]):print('usage: paste filename');
}
void readfile(String fileName){
  var newfile = File(fileName);
  newfile.readAsString()
  .then((value) => paste(value))
  .catchError((e)=>print('file $fileName not found '));
}
//function for pasting.
void  paste(String content) async {
  var postUrl = 'https://paste.rs/';
  var body = content;
  var response =  await http.post(
    postUrl,
    headers: {'Content-Type':'application/x-www-form-urlencoded'},
    body:body
    ).catchError((onError)=>print('unable to conplete request'));
    await print(response.body);
}