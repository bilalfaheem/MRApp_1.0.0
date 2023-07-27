import 'package:flutter/material.dart';
import 'package:mrapp/screens/HistoryScreen/Widget/history_tile.dart';
import 'package:mrapp/screens/ProfileScreen/util/app_colors.dart';
import 'package:mrapp/screens/ProfileScreen/util/text.dart';
import 'package:mrapp/utils/headingbar.dart';
import '../Function/history_api_func.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Column(
        children: [
           headingBar(context, "History", 20, "null"),
          Expanded(
              child: FutureBuilder(
                future: historyApiFunction(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return Container(
                      // height: 400,
                      margin: EdgeInsets.only(left: 10, top: 31),
                      // color: AppColors.orangeDull,
                      child: Column(
                        children: [

                       Expanded(
                         child: ListView.builder(
                          itemCount: historyList.length,
                          itemBuilder: (context,index){
                          final iteration = historyList[index];
                          return HistoryTile(iteration: iteration);
                         }),
                       ),
                       ],
                      ) 
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error.toString()}");
                  } else {
                    return Text("Unknown error occurred.");
                  }
                },
              ),
            ),
          
        ],
      ) 
      
      ),
    );
  }
}