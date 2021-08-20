
// @dart=2.9
import 'package:flutter/material.dart';  
import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:string_validator/string_validator.dart';
void main() => runApp(MyApp());  
  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    final appTitle = 'Flutter Forms';  
    return MaterialApp(  
      title: appTitle,  
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(   
        body: MyCustomForm(),  
      ),  
    );  
  }  
}  
// Create a Form widget.  
class MyCustomForm extends StatefulWidget {  
  @override  
  MyCustomFormState createState() {  
    return MyCustomFormState();  
  }  
}  
// Create a corresponding State class, which holds data related to the form.  
class MyCustomFormState extends State<MyCustomForm> {  
  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form.  
  final formKey = GlobalKey<FormState>();  
  bool check=false;
  bool visible=true;
  showAlertDialog(BuildContext context)
{
  Widget okButton=ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Ok'));
  AlertDialog res=AlertDialog(title: Text('Register'),
  content: Text('Data Registered Successfully'),
  actions: [okButton],);
  showDialog(context: context, builder: (BuildContext context){
    return res;
  }
  );
}
  @override  
  Widget build(BuildContext context) {  
    // Build a Form widget using the _formKey created above.  
    return Form(  
      key: formKey,  
      child: SingleChildScrollView(
        child:Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[
          Padding( 
            padding: EdgeInsets.fromLTRB(0,60,340,0),
          child:ListTile(
            title:IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},)
          )),
          Padding(padding:EdgeInsets.fromLTRB(10,0,0,0),
          child:ListTile(
            title:Text('Register',style:TextStyle(fontSize:30,color:Colors.black,fontWeight: FontWeight.bold),),subtitle: Text('Signup to experience new ways'),
          )),
          ListTile(
          title:TextFormField(  
            decoration:  InputDecoration( 
              prefixIcon: const Icon(Icons.person_outline),  
              hintText: 'Enter your full name',  
              labelText: 'User Name', 
              filled: true,
              fillColor: Colors.grey.shade200,
              enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white,width: 2))
            ),  
           
           
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              } 

              if(!isAlpha(value.replaceAll(" ", "")))
              {
              return "User Name contain only Alphabets";
              } 
              if(value.replaceAll(" ", "").length<5)
              {
              return 'User Name length must be greater than or equal 5';
              }
              return null;  
            },  
          )),  
          ListTile(
           title:TextFormField(  
            decoration: InputDecoration(  
            prefixIcon: const Icon(Icons.alternate_email_outlined),  
            hintText: 'Enter your Email Id',  
            labelText: 'Email Id',
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white,width: 2))  
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter valid Email';  
              } 
              if(!EmailValidator.validate(value)) 
              {
              return 'Please enter email in correct format';
              }
             
              return null;  
            },  
           )),
           ListTile(  
          title:TextFormField(  
            decoration:  InputDecoration(  
              prefixIcon: const Icon(Icons.phone_outlined), 
              hintText: 'Enter your phone number',  
              labelText: 'Mobile No',
              filled: true,
              fillColor: Colors.grey.shade200,
              enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white,width: 2))  
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter valid phone number';  
              }
              if(!isNumeric(value))  
              {
              return 'Phone Number must contains only numbers';
              }
               if(value.length!=11)  
              {
              return 'Phone Number must be of length 11';
              }

              return null;  
            },  
          )),
           ListTile(
            title:TextFormField(  
              obscureText: visible,
            decoration:  InputDecoration(  
            prefixIcon: const Icon(Icons.lock_outline),  
            hintText: 'Enter your Password',  
            labelText: 'Password', 
            suffixIcon: IconButton(icon: Icon(Icons.visibility_outlined),onPressed: (){setState(() {
              visible=!visible;
            });},),
            filled: true,
            fillColor:Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.white,width: 2)) 
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter valid Password';  
              }
              if(!isAlphanumeric(value))
              {
                 return 'Password Contain only Alphabets and Numbers'; }
                if(isAlpha(value))
               { 
                 return 'Password does not contain only alphabets ';
               }
                if(isNumeric(value))
               { 
                 return 'Password does not contain only Numbers';
               }
                    
              
              if(value.length<5)
              {
                return 'Length of Password must be greater than or equal to 5';
              }
              return null;  
            },  
           )),
           ListTile(    
          title:new Container(  
              padding: const EdgeInsets.only(left: 0.0, top: 40.0),  
              child: new ElevatedButton(  
                child: const Text('Register',style: TextStyle(fontSize: 20),),
                 style: ElevatedButton.styleFrom(primary:Colors.deepPurple,
                 padding: EdgeInsets.symmetric(horizontal:50,vertical:15),
                 shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(10.0)))),  
                onPressed: () {  
                  // It returns true if the form is valid, otherwise returns false  
                  if (formKey.currentState.validate()) {  
                    // If the form is valid, display a Snackbar.  
                    showAlertDialog(context) ;
                  }  
                },  
              ))), 
             ListTile(
              title:Align(
                alignment: Alignment.bottomLeft,
                child:CheckboxListTileFormField(
              activeColor: Colors.deepPurple,
              title: new RichText(text:new TextSpan(style:new TextStyle(color: Colors.black54),children:[new TextSpan(text:'I accept the '),
              new TextSpan(text:'Terms & Coditions',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
              ])),
            
              onSaved:(bool value)
              { },
               validator: (value) {  
              if (!value) {  
                return 'Please accept the terms & conditions';  
              }  
              return null;  
            },
            controlAffinity: ListTileControlAffinity.leading,
              
              )))
        ],  
      )),  
    );  
  }  
}  