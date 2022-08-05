import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _textController = TextEditingController();
  String coordinates = '';
  String latitude = '';
  String longitude = '';

  void convertValue() {
    setState(() {
      coordinates = _textController.text;
      var coordList = coordinates.split(',');
      var dirLat = 'N';
      var dirLon = 'E';
      double decLat = double.parse(coordList.first);
      double decLon = double.parse(coordList.last);
      if(decLat < 0){
        dirLat = 'S';
      }
      if(decLon < 0){
        dirLon = 'W';
      }
      // Latitude

      var d = (decLat.toInt()).abs();
      var m = (((decLat).abs() - d) * 60).floor();
      var s = ((decLat).abs() - d - (m / 60.0)) * 3600;
      var tmp = s.toStringAsFixed(2);
      s = double.parse(tmp);
      latitude = '$d\u00B0 $m\' $s" $dirLat';

      //Longitude
      d = (decLon.toInt()).abs();
      m = (((decLon).abs() - d) * 60).floor();
      s = ((decLon).abs() - d - (m / 60.0)) * 3600;
      tmp = s.toStringAsFixed(2);
      s = double.parse(tmp);
      longitude = '$d\u00B0 $m\' $s" $dirLon';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35, left: 30, right: 30),
        color: const Color.fromARGB(255, 235, 235, 235),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 30,
                  right: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color.fromARGB(255, 173, 185, 201),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            children: [Text('Enter Coordinate')],
                          ),
                          TextField(
                            controller: _textController,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 217, 217, 217),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            children: const [Text('LATITUDE')],
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(latitude,style: TextStyle(fontSize: 18),),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            children: const [Text('LONGITUDE')],
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(longitude,style: TextStyle(fontSize: 18,),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                //color: Colors.grey,
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)
                      ),
                      primary: Color.fromARGB(255, 55, 66, 88),
                    ),
                    onPressed: convertValue,
                    child: const Text('CALCULATE',style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 3
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
