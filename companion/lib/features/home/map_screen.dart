// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, body_might_complete_normally_nullable, use_build_context_synchronously, unrelated_type_equality_checks

import 'dart:developer';
import 'dart:io';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/features/auth/widgets/registeration_tff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'dart:io' show Platform;
import 'dart:math' show cos, sqrt, asin;

import 'dart:ui' as ui;
import 'package:flutter/services.dart';

import '../../core/components/app_button.dart';
import '../../core/utils/utilities.dart';

final places = GoogleMapsPlaces(apiKey: '');
Uint8List? marketimages;
List<File> images = [];

class MapScreenForSelectLocation extends StatefulWidget {
  const MapScreenForSelectLocation({super.key});

  @override
  _MapScreenForSelectLocationState createState() =>
      _MapScreenForSelectLocationState();
}

class _MapScreenForSelectLocationState
    extends State<MapScreenForSelectLocation> {
  late String selectedAreaFromlatlng;

  LatLng? _currentPosition;
  Position? currentPosition;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool isLoading = false;
  bool searchMode = false;
  Set<Marker> markers = {};
  List<Prediction> predictions = [];
  final TextEditingController searchController = TextEditingController();
  LatLng? selectedPosition;
  bool? isgetArea;
  GoogleMapController? _googleMapController;
  void onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

  Future? _changeLocation(double zoom, LatLng latLng) async {
    double newZoom = zoom > 15 ? zoom : 15;
    _currentPosition = latLng;

    setState(() async {
      _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: newZoom)));
      markers.clear();
      selectedPosition = latLng;
      markers.add(Marker(
          markerId: const MarkerId('1'),
          position: latLng,
          icon: BitmapDescriptor.defaultMarker));
    });
  }

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  final TextEditingController _controllerr = TextEditingController();

  @override
  void initState() {
    determinePosition();

    super.initState();
  }

  Future determinePosition() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    markers.addAll([
      Marker(
          markerId: const MarkerId("1"),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarker)
    ]);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      selectedPosition = _currentPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: MediaQuery(
        data: const MediaQueryData(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primarycolor,
            key: _scaffoldKey,
            body: _buildMap(),
          ),
        ),
      ),
    );
  }

  Widget _buildMap() {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition:
              const CameraPosition(target: LatLng(31.0409, 31.3785), zoom: 15),
          onMapCreated: onMapCreated,
          myLocationButtonEnabled: false,
          markers: markers,
          onTap: (argument) {},
          onCameraMove: (position) async {
            markers.clear();

            selectedPosition = position.target;

            markers.add(
              Marker(
                markerId: const MarkerId("1"),
                position: selectedPosition!,
                draggable: true,
                icon: BitmapDescriptor.defaultMarker,
                onDragEnd: (newPosition) {
                  selectedPosition = newPosition;
                },
              ),
            );
            setState(() {});
          },
        ),
        Positioned(
          bottom: 82.h,
          right: 10.w,
          child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.my_location,
                size: 23.sp,
                color: Colors.black.withOpacity(0.6),
              )),
        ),

        // isgetArea == null || isgetArea == true
        //     ? Positioned(
        //         bottom: 3.h,
        //         right: 25.w,
        //         left: 25.w,
        //         child: AppButton(
        //           title: "Confirm Location",
        //           fontFamily: FontConstants.loraBoldFont,
        //           height: 6.7.h,
        //           fontSize: 11.sp,
        //           onTap: () async {
        //             if (markers.isNotEmpty) {
        //               log(selectedPosition!.latitude.toString());
        //               log(selectedPosition!.longitude.toString());
        //               await GetAddressFromLatLong(selectedPosition!);
        //               Navigator.pop(context, [
        //                 selectedPosition?.latitude,
        //                 selectedPosition?.longitude,
        //                 selectedAreaFromlatlng
        //               ]);
        //             } else {
        //               AppUtil.previewToast(
        //                 msg: "Please enter status location",
        //                 backgroundColor: Colors.red,
        //               );
        //             }
        //           },
        //         ))
        //     : Column(
        //         children: [
        //           SizedBox(
        //             height: 60.h,
        //           ),
        //           const CircularProgressIndicator(),
        //         ],
        //       ),
        //search
        Positioned(
          top: 60.h,
          right: 15.w,
          left: 15.w,
          child: RegisterationTextFormField(
            controller: _controllerr,
            type: TextInputType.visiblePassword,
            borderColor: AppColors.logintffbgColor,
            hintTxt: "Min 8 characters",
            borderRadius: 20.sp,
            Background: AppColors.primarycolor,
            onChanged: (p0) {
              getPredictions(p0).then((predictionsList) {
                setState(() {
                  predictions = predictionsList;
                  log(predictions.toString());
                });
              });
            },
          ),
        ),

        predictions.isEmpty
            ? Container()
            : Positioned(
                top: 100,
                right: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: predictions.length,
                    itemBuilder: (BuildContext context, int index) {
                      log(predictions[index].description!);
                      return PredictionItem(predictions[index]);
                    },
                  ),
                ),
              ),
      ],
    );
  }

  Widget PredictionItem(prediction) {
    return ListTile(
      title: AppText(
        prediction.description!,
        fontSize: 11.sp,
      ),
      onTap: () async {
        searchMode = true;
        searchController.text = prediction.description!;
        PlacesDetailsResponse response =
            await places.getDetailsByPlaceId(prediction.placeId!);
        if (response.isOkay) {
          log(response.result.toString());
          double lat = response.result.geometry!.location.lat;
          double lng = response.result.geometry!.location.lng;
          log("cleaaaaer");
          predictions.clear();
          searchMode = false;
          setState(() {});

          await _changeLocation(15, LatLng(lat, lng));
          markers.add(Marker(
              markerId: const MarkerId('1'),
              position: selectedPosition!,
              icon: BitmapDescriptor.defaultMarker));

          setState(() {});
        }
      },
    );
  }

  Future<List<Prediction>> getPredictions(String query) async {
    PlacesAutocompleteResponse response = await places.autocomplete(
      query,
    );
    log(response.predictions.toString());
    if (response.isOkay) {
      return response.predictions;
    } else {
      return [];
    }
  }

  Future<Uint8List> customIconMarker(String path, int width, int height) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: height,
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> GetAddressFromLatLong(LatLng position) async {
    setState(() {
      isgetArea = false;
    });
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    selectedAreaFromlatlng =
        '  ${place.country}  ${place.country != "" ? "," : ""}  ${place.subAdministrativeArea ?? ""} ${place.subAdministrativeArea != "" ? "," : ""}   ${place.locality ?? ""} ${place.locality != "" ? "," : ""}  ${place.thoroughfare ?? ""} ';
    isgetArea = true;
    setState(() {});
  }

  double distanceBetweenPoints(
      double lat1, double lat2, double long1, double long2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((long2 - long1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
