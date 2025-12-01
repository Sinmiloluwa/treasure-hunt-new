import 'package:flutter/material.dart';
import 'package:treasure_hunt/constants/text_styles.dart';
import 'package:treasure_hunt/widgets/card_widget.dart';
import 'package:treasure_hunt/widgets/filter_button.dart';
import 'package:treasure_hunt/widgets/search_bar_widget.dart';

class SingleViewScreen extends StatelessWidget {
  const SingleViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Find hunts near you'),
            backgroundColor: Colors.black,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchField(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Results'),
                              Text('Showing 2 results for Lagos, Nigeria',
                                  style: AppTextStyles.cardSubtitle
                                      .copyWith(color: Colors.grey)),
                            ]),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FilterButton(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 30,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      return CardWidget(
                        imageUrl:
                            'https://plus.unsplash.com/premium_photo-1682390303366-7463dcbec281?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            type: 'single',
                      );
                    },
                  )
                ],
              ),
            ),
          ))),
    );
  }
}
