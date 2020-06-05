import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class InputIslemleri extends StatefulWidget {
  @override
  _InputIslemleriState createState() => _InputIslemleriState();
}

class _InputIslemleriState extends State<InputIslemleri> {

  String girilenMetin=" ";
  FocusNode _focusNode;
  int maxLine=1;
  TextEditingController textEditingController1;
  @override
  void initState() {

    super.initState();
    _focusNode=FocusNode();
    textEditingController1=TextEditingController(text: "varsayılan");
  _focusNode.addListener((){

    setState(() {
      if(_focusNode.hasFocus){
        maxLine=3;
      }
      else{
        maxLine=1;
      }
    });
  });

  }
  @override
  void dispose() {
    _focusNode.dispose();
    textEditingController1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input"),),
    floatingActionButton: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[

          Container(
            width: 24,
              height: 24,
            child: FloatingActionButton(onPressed: () {
              FocusScope.of(context).requestFocus(_focusNode);
            }, child: Icon(Icons.edit,size: 12,),backgroundColor:Colors.teal,),

          ),

          SizedBox(height: 10,),//Aralarına boşlık veriyor


          FloatingActionButton(onPressed: () {
            debugPrint(textEditingController1.text.toString());

          }, child: Icon(Icons.edit),mini: true, backgroundColor: Colors.pink,),
          SizedBox(height: 10,),

          FloatingActionButton(onPressed: () {
            textEditingController1.text="butondan geldim";
            FocusScope.of(context).requestFocus(_focusNode);
          }, child: Icon(Icons.edit),),
        ],
      ),


         body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              autofocus: false,
              keyboardType: TextInputType.number,
              textInputAction:TextInputAction.done ,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: "Metni yazınız",
                labelText: "Başlık",
               border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                icon: Icon(Icons.edit),
                prefixIcon: Icon(Icons.done),
                suffixIcon: Icon(Icons.add),
              ),
              maxLines: maxLine,
              controller: textEditingController1,
              maxLength: 20,
              maxLengthEnforced: true,
              onChanged: (String s)=>debugPrint("On Change $s"),
              onSubmitted: (String s){
                debugPrint("On cubmit");
                girilenMetin=s;
              },

              cursorColor: Colors.purple,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              autofocus: false,
              keyboardType: TextInputType.number,
              textInputAction:TextInputAction.done ,
              decoration: InputDecoration(
                hintText: "Metni yazınız",
                labelText: "Başlık",
                border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                icon: Icon(Icons.edit),
                prefixIcon: Icon(Icons.done),
                suffixIcon: Icon(Icons.add),
              ),
              maxLines:1,
              maxLength: 20,
              maxLengthEnforced: true,
              onChanged: (String s)=>debugPrint("On Change $s"),
              onSubmitted: (String s){
                debugPrint("On cubmit");
                girilenMetin=s;
              },

              cursorColor: Colors.purple,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 150,
            color: Colors.teal.shade400,
            child: Align(alignment: Alignment.center,
                child: Text(girilenMetin)),
          )
        ],

      ),
    );
  }
}
