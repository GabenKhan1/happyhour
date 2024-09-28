import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';

class SearchProvider {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  final geo = const  GeoFirePoint(GeoPoint(3, 6));
  Stream<List<DocumentSnapshot>> fetchHours(
      {required List<dynamic> foods, required double radius}) {
     _firebase.collection("happyhours").where(    GeoCollectionReference<Map<String, dynamic>>(foods[0])
        .subscribeWithin(
  center: const GeoFirePoint(GeoPoint(3, 6)),
  radiusInKm: 50,
  field: "geo",
  geopointFrom: (_)=>
 const GeoPoint(3, 7),
));
    // var _queryRef = _firebase.collection("happyhours").where(
    //   "drinkitemName",
    //   arrayContainsAny: [
    //     "Mexican Beer",
    //     "Wine",
    //     // "Domestic",
    //     // "Pizza",
    //     // "Pool Table",
    //     // "Bar-Types",
    //   ],
    // );

    GeoFirePoint center =
      const  GeoFirePoint(GeoPoint(3, 7));

    String field = 'position';
    return const Stream.empty();

//     return 
//        GeoCollectionReference<Map<String, dynamic>>(_queryRef)
//         .subscribeWithin(
//   center: const GeoFirePoint(GeoPoint(3, 6)),
//   radiusInKm: 50,
//   field: "geo",
//   geopointFrom: (_)=>
//  const GeoPoint(3, 7),
    
  //   geo.
  //       .(collectionRef: _queryRef)
  //       .within(center: center, radius: radius, field: field, strictMode: true);
  // }
}}
