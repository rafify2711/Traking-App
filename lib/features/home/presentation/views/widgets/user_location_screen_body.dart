import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/custom_card_widget.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/dash_mark.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class UserLocationScreenBody extends StatefulWidget {
  const UserLocationScreenBody({
    super.key,
    required this.driverLat,
    required this.driverLong,
  });
  final double driverLat;
  final double driverLong;

  @override
  State<UserLocationScreenBody> createState() =>
      _UserLocationScreenBodyState();
}

class _UserLocationScreenBodyState extends State<UserLocationScreenBody> {
  GoogleMapController? mapController;
  late LatLng _userLocation;
  late LatLng _deliveryManLocation;

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  @override
  void initState() {
    _userLocation = const LatLng(30.1660, 31.6542);
    _deliveryManLocation =  LatLng(widget.driverLat, widget.driverLong);
    print("---------------------$_deliveryManLocation");
    _initMarkers();
    _initPolylines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GoogleMap(
                  mapType: MapType.normal,
                  // myLocationEnabled: true,
                  // myLocationButtonEnabled: false,
                  // zoomControlsEnabled: false,
                  markers: markers,
                  polylines: polylines,
                  initialCameraPosition: CameraPosition(
                    target: _userLocation,
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                    fitMarkersInView();
                  },
                ),
              ),
              Positioned(
                top: responsiveHeight(40),
                left: responsiveWidth(16),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: PalletsColors.mainColorBase,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      size: 24,
                      Icons.arrow_back_ios,
                      color: PalletsColors.whiteBase,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const DashMark(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(16),
                  ),
                  child: Text(
                     LocaleKeys.userAddress.tr(),
                    style: AppTextStyles.instance.textStyle12.copyWith(
                      color: PalletsColors.gray,
                    ),
                  ),
                ),

                CustomCardWidget(
                  withTrailing: true,
                  imagePath: 'assets/images/Photo.png',
                  title: 'Nour Mahmoud',
                  addressOrPriceText: '20th st, Sheikh Zayed, Giza',
                  numberOfOrder: '',
                ),
                responsiveHeightWidget(14),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(16),
                  ),
                  child: Text(
                    LocaleKeys.pickUpAddress.tr(),
                    style: AppTextStyles.instance.textStyle12.copyWith(
                      color: PalletsColors.gray,
                    ),
                  ),
                ),
                
                CustomCardWidget(
                  withTrailing: true,
                  imagePath: 'assets/images/Flowery logo.png',
                  title: 'Flowery store',
                  addressOrPriceText: '20th st, Sheikh Zayed, Giza',
                  numberOfOrder: '',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _initMarkers() {
    markers = {
      Marker(
        markerId: const MarkerId("user"),
        position: _userLocation,

        infoWindow: InfoWindow(title: LocaleKeys.pickupLocation.tr()),
      ),
      Marker(
        markerId: const MarkerId("delivery"),
        position: _deliveryManLocation,
        infoWindow: InfoWindow(title: LocaleKeys.yourLocation.tr()),
      ),
    };
  }

  void _initPolylines() {
    polylines = {
      Polyline(
        polylineId: const PolylineId("route"),
        points: [_userLocation, _deliveryManLocation],
        color: PalletsColors.mainColorBase,
        width: 2,
      ),
    };
  }

  Future<void> fitMarkersInView() async {
    if (mapController == null) return;
    {
      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          min(_userLocation.latitude, _deliveryManLocation.latitude),
          min(_userLocation.longitude, _deliveryManLocation.longitude),
        ),
        northeast: LatLng(
          max(_userLocation.latitude, _deliveryManLocation.latitude),
          max(_userLocation.longitude, _deliveryManLocation.longitude),
        ),
      );
      CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 100);
      await mapController!.animateCamera(cameraUpdate);
    }
  }
}
