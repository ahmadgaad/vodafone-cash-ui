import 'package:flutter/material.dart';
import 'package:vodafone_ui_clone/features/home/presentation/components/service_grid/service_grid_item.dart';

import '../../../../../core/theme/app_dimensions.dart';
import '../../../../../core/widgets/animated_slide_in.dart';
import '../../../data/models/service_model.dart';

class ServiceGrid extends StatelessWidget {
  final List<ServiceModel> services;

  const ServiceGrid({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimensions.spacingM,
        mainAxisSpacing: AppDimensions.spacingM,
        childAspectRatio: 1.8,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return AnimatedSlideIn(
          duration: const Duration(milliseconds: 500),
          delay: Duration(milliseconds: 200 + (index * 100)),
          begin: const Offset(0, 0.2),
          child: ServiceGridItem(service: services[index]),
        );
      },
    );
  }
}
