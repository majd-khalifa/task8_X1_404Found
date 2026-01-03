import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/text_style.dart';

import 'widgets/search_bar.dart';
import 'widgets/category_chip.dart';
import 'widgets/trending_card.dart';
import 'widgets/movie_grid_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSearchBar(),
        const SizedBox(height: 16.0),

        // Categories
        SizedBox(
          height: 36.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            itemCount: 5,
            separatorBuilder: (_, __) => const SizedBox(width: 12.0),
            itemBuilder: (_, index) {
              final categories = ["All", "Action", "Sci-Fi", "Comedy", "Drama"];
              return CategoryChip(
                label: categories[index],
                isActive: index == 0,
              );
            },
          ),
        ),

        const SizedBox(height: 20.0),

        // Trending
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("Trending Now", style: AppTextStyles.textStyle20),
        ),
        const SizedBox(height: 12.0),
        SizedBox(
          height: 280.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: const [
              TrendingCard(
                image: "assets/images/dune.png",
                title: "Dune: Part Two",
                subtitle: "Sci-Fi, Adventure",
                rating: "8.8",
              ),
              SizedBox(width: 16),
              TrendingCard(
                image: "assets/images/oppenheimer.png",
                title: "Oppenheimer",
                subtitle: "Drama, History",
                rating: "9.1",
              ),
              SizedBox(width: 16),
              TrendingCard(
                image: "assets/images/barbie.png",
                title: "Barbie",
                subtitle: "Comedy, Fantasy",
                rating: "6.5",
              ),
              SizedBox(width: 16),
              TrendingCard(
                image: "assets/images/oppenheimer.png",
                title: "Oppenheimer",
                subtitle: "Drama, History",
                rating: "9.1",
              ),
            ],
          ),
        ),

        const SizedBox(height: 20.0),

        // For You
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("For You", style: AppTextStyles.textStyle20),
        ),
        const SizedBox(height: 12.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.55,
            children: const [
              MovieGridItem(
                image: "assets/images/dune.png",
                title: "Dune: Part Two",
                rating: "8.8",
                year: "2024",
                badge: "98% Match",
              ),
              MovieGridItem(
                image: "assets/images/civil_war.png",
                title: "Civil War",
                rating: "7.6",
                year: "2024",
              ),
              MovieGridItem(
                image: "assets/images/poor_thing.png",
                title: "Poor Things",
                rating: "8.4",
                year: "2023",
              ),
              MovieGridItem(
                image: "assets/images/the_creator.png",
                title: "The Creator",
                rating: "6.9",
                year: "2023",
                badge: "New",
              ),
              MovieGridItem(
                image: "assets/images/spider_man.png",
                title: "Spider-Man",
                rating: "9.0",
                year: "2023",
              ),
              MovieGridItem(
                image: "assets/images/salt_burn.png",
                title: "Saltburn",
                rating: "7.1",
                year: "2023",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
