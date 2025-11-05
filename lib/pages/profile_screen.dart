import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Center(
              child: Text(
                'Profile Settings',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuB_N_xUkVgGyZxGhLU0ubarV7UM_r1iv8S8Rqhvgwmf-7OLfKhUU8FD7Ea8SgSzx9XGatUHU7onv_f3Td93bsk3qtBuWNCJ8sGnulXaCxFfvKMUhm2YzSLDowN-5g6YZNWb1BiJvZzxwYwrNzLBCMV93q1JqzYLNJjPy-CJ7B1LtqRGxQmNEM12bayd5ogTkNwt24lnU6lRivKnuSHkBN9sPRFELgix03UMF0Uo_bbCBqEOKJafkmIFh6ccvyYLWbL-tk7HMlKvhj8',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Tolu Amole',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                'toluwanimi@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      indicatorColor: Color(0xFF17a3eb),
                      tabs: [
                        Tab(
                          child: Text(
                            "General",
                            style: TextStyle(
                              color: Colors
                                  .grey, // 👈 specific color for “Upcoming”
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jakarta',
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Notifications",
                            style: TextStyle(
                              color: Colors
                                  .grey, // 👈 specific color for “Upcoming”
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jakarta',
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Stats",
                            style: TextStyle(
                              color: Colors
                                  .grey, // 👈 specific color for “Upcoming”
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jakarta',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        children: [
                          Center(
                              child: Text(
                            'Account Settings',
                            style: TextStyle(color: Colors.white),
                          )),
                          Center(
                              child: Text(
                            'Preferences Settings',
                            style: TextStyle(color: Colors.white),
                          )),
                          Center(
                              child: Text(
                            'Security Settings',
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
