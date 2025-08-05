import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puri/presentation/servereport/servereportscreen/locationscreen.dart';
import 'package:puri/presentation/servereport/servereportscreen/mapscreen.dart';
import 'package:puri/presentation/servereport/servereportscreen/photoScreen.dart';
import 'package:puri/presentation/servereport/servereportscreen/reportscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/generalFunction.dart';
import '../../services/bindCityzenWardRepo.dart';
import '../resources/app_text_style.dart';


final bindCityzenWardProvider = FutureProvider<List>((ref) async {

  return await BindCityzenWardRepo().getbindWard(); // Already a List

});




class SurveryReport extends ConsumerStatefulWidget {

  @override
  ConsumerState<SurveryReport> createState() => _SurveryFormState();
}

// 2. extend [ConsumerState]

class _SurveryFormState extends ConsumerState<SurveryReport> {


  var _selectedValueProjct;
  GeneralFunction generalFunction = GeneralFunction();
  var _dropDownValueProject;
  bool showDropDownLocation = false;
  var bindcityWardList;
  var sUserName2,sContactNo2;

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ReportScreen(),
    PhotoScreen(),
    LocationScreen(),
    MapScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Gradient _navGradient = const LinearGradient(
    colors: [Color(0xFF255898), Color(0xFF12375e), Color(0xFF0A243F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );



  // bind Location
  Widget _bindLocation(List bindcityWardList) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 42,
        color: Color(0xFFf2f3f5),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              isExpanded: true, // Important to prevent overflow
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              hint: Text(
                "Select Project",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyle.font14penSansExtraboldBlack45TextStyle,
              ),
              value: _dropDownValueProject,

              onChanged: (newValue) {
                setState(() {
                  _dropDownValueProject = newValue;
                  print('-----140-----serveyCode---$_dropDownValueProject');
                  bindcityWardList.forEach((element) {
                    if (element["Surver_Name"] == _dropDownValueProject) {
                      _selectedValueProjct = element['Survey_Code'];
                    }
                  });
                  print("----143---$_selectedValueProjct");
                });
                if (_dropDownValueProject != null &&
                    _dropDownValueProject != '') {
                  print("----call Api---");
                  /// todo here we call a api to change the data

                } else {
                  print("----not call Api---");
                }
              },
              items: bindcityWardList.map((dynamic item) {
                return DropdownMenuItem(
                  value: item["Survey_Code"].toString(),
                  child: Text(
                    item['Surver_Name'].toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
  // bind project

  @override
  void initState() {
    // TODO: implement initState
    toGatlocalDataBase();
    super.initState();

    // Wait for the FutureProvider to complete and set the list into state provider
    // First microtask
    Future.microtask(() async {
      try {
        final response = await ref.read(bindCityzenWardProvider.future);
        await Future.delayed(Duration(seconds: 2)); // ⏳ Delay for 2 seconds

        if (response != null && response.isNotEmpty) {
          print("-----308----Response----$response");

          bindcityWardList = response;
          showDropDownLocation = true;
          // to put list in a dropDownBox
          _bindLocation(bindcityWardList);
          setState(() {}); // 🔁 Trigger UI rebuild
          print('✅ List loaded: $bindcityWardList');
        } else {
          print('⚠️ Empty or null list');
        }
      } catch (e) {
        print('❌ Error: $e');
      }
    });
  }

  toGatlocalDataBase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sUserName2 = prefs.getString('sUserName');
    sContactNo2 = prefs.getString('sContactNo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarFunction(context, "Survey Report"),
      drawer: generalFunction.drawerFunction(
        context,
        sUserName2 ?? "",
        sContactNo2 ?? "",
      ),
     body: _pages[_selectedIndex],

      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(gradient: _navGradient),
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     currentIndex: _selectedIndex,
      //     onTap: _onItemTapped,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.white54,
      //     selectedFontSize: 12,
      //     unselectedFontSize: 11,
      //     type: BottomNavigationBarType.fixed,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.report, size: _selectedIndex == 0 ? 28 : 22),
      //         label: 'Report',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.photo, size: _selectedIndex == 1 ? 28 : 22),
      //         label: 'Photo',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.location_on, size: _selectedIndex == 2 ? 28 : 22),
      //         label: 'Location',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.map, size: _selectedIndex == 3 ? 28 : 22),
      //         label: 'Map',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
