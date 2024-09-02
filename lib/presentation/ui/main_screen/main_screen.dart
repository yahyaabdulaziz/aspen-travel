import 'package:aspen_travel/presentation/ui/main_screen/tabs/home_tab/home_tab.dart';
import 'package:aspen_travel/presentation/utils/app_assets.dart';
import 'package:aspen_travel/presentation/utils/app_colors.dart';
import 'package:aspen_travel/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      const CircularProgressIndicator(color: AppColors.primaryColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: buildBottomNavigationBar(),
      body: _buildBodyContent(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildBottomNavigationBar() {
    return Container(
      margin: const EdgeInsetsDirectional.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFEFEFEF), // #FEFEFE
                Color(0xFFF5F5F5), // #F5F5F5
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppAssets.homeImg),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppAssets.ticketImg),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppAssets.heartImg),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppAssets.profileImg),
                  ),
                  label: ""),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    switch (_selectedIndex) {
      case 0:
        return const HomeTab();
      case 1:
        return const Center(child: Text(AppStrings.contentForTickets));
      case 2:
        return const Center(child: Text(AppStrings.contentForFavorites));
      case 3:
        return const Center(child: Text(AppStrings.contentForProfile));
      default:
        return Center(
            child: Text('${AppStrings.selectedIndex} $_selectedIndex'));
    }
  }
}
