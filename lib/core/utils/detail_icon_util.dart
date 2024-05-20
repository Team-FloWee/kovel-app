import 'package:flutter/material.dart';

class DetailIconUtil {
  IconData getIconData(String text) {
    return switch (text) {
      'infoCenter' || 'sponsorTel' => Icons.phone,
      'useTime' ||
      'startDate' ||
      'endDate' ||
      'openTime' =>
      Icons.access_time_filled,
      'spendTime' || 'takeTime' || 'playTime' => Icons.timelapse,
      'firstMenu' || 'treatMenu' => Icons.restaurant,
      'homePage' || 'reservationUrl' => Icons.link,
      'useFee' || 'saleItemCost' => Icons.monetization_on,
      'placeInfo' || 'expGuide' => Icons.info,
      'restDay' => Icons.door_front_door,
      'parking' => Icons.local_parking,
      'petAllowed' => Icons.pets,
      'sponsor' => Icons.apartment,
      'ageLimit' => Icons.not_interested,
      'roomCount' => Icons.bed,
      'pickup' => Icons.directions_car_filled,
      'park' => Icons.park,
      'subFacility' => Icons.beach_access,
      'foodPlace' => Icons.food_bank,
      'saleItem' => Icons.local_offer,
      'scale' => Icons.maps_home_work,
      'creditCard' => Icons.credit_card,
      'distance' => Icons.directions_run,
      _ => Icons.info,
    };
  }
}