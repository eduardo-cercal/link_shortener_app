import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListWidget extends StatelessWidget {
  const LoadingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (context, index) => const Divider(height: 30),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: .start,
            spacing: 8,
            children: [
              Container(
                height: 12,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              Container(
                height: 10,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
