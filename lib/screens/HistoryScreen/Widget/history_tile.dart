import 'package:flutter/material.dart';
import 'package:mrapp/Model/history_data_model/history_data_model.dart';
import 'package:mrapp/screens/ProfileScreen/util/app_colors.dart';
import 'package:mrapp/screens/ProfileScreen/util/text.dart';

class HistoryTile extends StatelessWidget {

  const HistoryTile({super.key, required this.iteration});
final HistoryDataModel iteration;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
            child: Content(data: iteration.date.toString(), size: 16, weight: FontWeight.bold,)),
          Column(
            children: [

          
          ListView.builder(
            itemCount: iteration.data!.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
            final iter = iteration.data?[index];


            return Container(
              // color: Colors.amber,
            child: Container(
      margin: EdgeInsets.only(top: 8, right: 8),
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 17),
      decoration: BoxDecoration(
      color: AppColors.greyTileColor,
      boxShadow: [
        BoxShadow(
          color: AppColors.greyLightBg.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(2, 2),
        )
      ],
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
              TextSpan(
                text: 'Address : ',
                style: TextStyle(fontSize: 16),
                children: <InlineSpan>[
                  TextSpan(
                    text: iter!.address.toString(),
                    style: TextStyle(fontSize: 16,color: Colors.black),
                  )
                ]
              )
              ),
              // Text.rich(
              // TextSpan(
              //   text: 'Created At : ',
              //   style: TextStyle(fontSize: 13),
              //   children: <InlineSpan>[
              //     TextSpan(
              //       text: iter!.createdAt.toString(),
              //       style: TextStyle(fontSize: 14,color:AppColors.greyTextLight),
              //     )
              //   ]
              // )
              // )
              ],
            ),
          ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
  
                 
                Text.rich(
              TextSpan(
                text: 'Current Reading : ',
                style: TextStyle(fontSize: 16),
                children: <InlineSpan>[
                  TextSpan(
                    text: iter!.currentReading.toString(),
                    style: TextStyle(fontSize: 16,color:Colors.black),
                  )
                ]
              )
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
              //   decoration: BoxDecoration(
              //     color: AppColors.greyLightBg,
              //     borderRadius: BorderRadius.circular(8)
              //   ),
              //   child: Text("Delivered",style: TextStyle(fontSize: 15),),
              // )
               ],
                ),
              // Text.rich(
              // TextSpan(
              //   text: 'Date : ',
              //   style: TextStyle(fontSize: 16),
              //   children: <InlineSpan>[
              //     TextSpan(
              //       text: iteration.date.toString(),
              //       style: TextStyle(fontSize: 16,color:AppColors.greyTextLight),
              //     )
              //   ]
              // )
              // )
              ],
                    ),
            )
        ],
      ),
    ),
          ); 
            
    //         ListTile(
              
    //           tileColor: Colors.amber,
    //           contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 11),
     
    //   title: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Content(data: "Address:", size: 18, weight: FontWeight.bold,),
    //        Content(data: "Current Reading", size: 18,),
    //     ],
    //   ),
    //       Content(
    //         data: iter!.address.toString(),
    //         size: 18,
    //         weight: FontWeight.bold,
    //       ),
    //       Content(data: iter!.currentReading.toString(), size: 18,),
    //     ],
    //   ),
    // );
            // ListTile(
            //   shape: 
            //   tileColor: AppColors.greyLightBg,
            //   // leading: Content(data: "Address", size: 18),
            //   title: Content(data: iter!.address.toString(), size: 18),
            //   subtitle: Content(data: iter!.createdAt.toString(), size: 18),
            //   trailing: Content(data: iter!.currentReading.toString(), size: 18),
            //   // Content(data: iter!.currentReading.toString(), size: 18),
            //   );
          })  ],
          )
        ],
      ),
    );
  }
}