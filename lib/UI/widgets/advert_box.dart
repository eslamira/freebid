import 'package:flutter/material.dart';

class AdvertBox extends StatefulWidget {

  final String img;
  final String name;
  final String location;
  final int price;
  final int date;


  AdvertBox({this.img, this.name, this.location, this.price, this.date});

  @override
  _AdvertBoxState createState() => _AdvertBoxState();
}

class _AdvertBoxState extends State<AdvertBox> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left+25,top: MediaQuery.of(context).padding.top+25,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 6,
                    )
                  ]
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left+20,top: MediaQuery.of(context).padding.top+20,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(

                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Image.asset(widget.img,fit: BoxFit.fill,),
                ),


                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10,left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: FittedBox(
                              alignment: Alignment.topLeft,
                              fit: BoxFit.contain,
                              child: Text(widget.name,style: TextStyle(color: Color(0xFFE57373)),),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.location_on,color: Color(0xFF676767),),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.height * 0.03,
                                child: FittedBox(
                                  alignment: Alignment.topLeft,
                                  fit: BoxFit.contain,
                                  child: Text(widget.location,style: TextStyle(color: Color(0xFFE57373),),),
                                )
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(r"$"+"${widget.price}",style: TextStyle(color: Color(0xFFE57373),fontSize: 16 ),)
                        )

                      ],
                    )
                )

              ],
            ),
          ),

          Positioned(
            bottom: 10,
            right: 15,
            child: Text("${widget.date}"+"days",style: TextStyle(color: Color(0xFFE57373),fontSize: 16 ),),
          )

        ],
      )
    );
  }
}
