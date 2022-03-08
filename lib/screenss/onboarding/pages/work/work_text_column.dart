import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_helmett/constants.dart';

import '../../widgets/text_column.dart';

class WorkTextColumn extends StatelessWidget {
  const WorkTextColumn();

  @override
  Widget build(BuildContext context) {

    return Column(
        children:[ TextColumn(
      title: 'The Ride',
      text:
      'Enter the make and the registered plate number of your two-wheeler.',
    ),
          SizedBox(height:40 ), Container(
            width: MediaQuery.of(context).size.width/1.5,
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: kGrey),
                  borderRadius: BorderRadius.circular(30)
              ),
              onPressed: () {
                _showAlert(context);
              },
              child: const Text("Add details",style: TextStyle(color: kGrey),),
            ),
          ),
        ]);

  }
  _showAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => Container(

        child: BasicDialogAlert(

          content:
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width/3,
                    child:Text('Details',style:TextStyle(fontSize: 40,color: kGrey)),

                  ),
                ),
                SizedBox(height: 40,),

                Container( width: MediaQuery.of(context).size.width/2, child: TextFormField( style: TextStyle(color: Colors.black), decoration: InputDecoration( labelStyle: TextStyle(color: Colors.black), labelText: "Model", fillColor: Colors. white, enabledBorder: const OutlineInputBorder( borderSide: const BorderSide(color: kGrey, width: 0.0), ),
                    focusedBorder:OutlineInputBorder( borderSide: const BorderSide(color: Colors. white, width: 2.0), borderRadius: BorderRadius. circular(25.0), ))), ),
                SizedBox(height: 20,),

                AnimatedPadding( padding: MediaQuery.of(context).viewInsets, duration: const Duration(milliseconds: 100), curve: Curves.decelerate, child: Container( width: MediaQuery.of(context).size.width/2, child: TextFormField( style: TextStyle(color: Colors.black), decoration: InputDecoration( labelText: "Plate No", labelStyle: TextStyle(color: Colors.black), fillColor: Colors. white, enabledBorder: const OutlineInputBorder( borderSide: const BorderSide(color: kGrey, width: 0.0), ), focusedBorder:OutlineInputBorder( borderSide: const BorderSide(color: Colors. white, width: 2.0), borderRadius: BorderRadius. circular(25.0), ))), ), ),
              ]),
          actions: <Widget>[
            BasicDialogAction(
              title: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

}
