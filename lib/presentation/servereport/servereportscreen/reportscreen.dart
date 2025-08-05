import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app/generalFunction.dart';
import '../../../model/getServeModel.dart';
import '../../../services/bindCityzenWardRepo.dart';
import '../../../services/getSurveyRepo.dart';
import '../../resources/app_text_style.dart';
import 'PhotoViewerPage.dart';

class ReportScreen extends StatefulWidget {

  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  String? _selectedProjectCode;
  List<dynamic> bindCityWardList = []; // Dropdown items
  List<SurveySubmissionModel>? submissions; // Report data
  double? latitude;
  double? longitude;


  // gradient
  final Gradient _navGradient = const LinearGradient(
    colors: [
      Color(0xFF82B1FF), // Lighter blue
      Color(0xFF64B5F6), // Light steel blue
      Color(0xFF90CAF9), // Soft light blue Beige White/ Soft light blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  // Load dropdown data initially
  Future<void> _loadInitialData() async {
    bindCityWardList = await BindCityzenWardRepo().getbindWard(); // Dummy method
    setState(() {});
  }

  // Fetch data for selected project
  Future<void> _fetchSubmissionData(String surveyCode) async {
    setState(() {
      submissions = null; // Clear old data
    });

    submissions = await GetSurveyRepo().getServe(surveyCode); // Dummy method
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Report")),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              _buildDropdown(),
              const SizedBox(height: 12),
              _buildSubmissionCards(),
            ],
          ),
        ),
      ),
    );
  }

  /// Dropdown Widget for Project Selection
  Widget _buildDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set background color here
        borderRadius: BorderRadius.circular(4), // Optional: round corners
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: DropdownButtonFormField<String>(
          value: _selectedProjectCode,
          isExpanded: true,
          dropdownColor: Colors.white,
          decoration: const InputDecoration(
            labelText: "Select Project",
            border: OutlineInputBorder(),
          ),
          items: bindCityWardList.map((item) {
            return DropdownMenuItem<String>(
              value: item["Survey_Code"].toString(),
              child: Text(item["Surver_Name"].toString()),

            );
          }).toList(),
          onChanged: (newValue) async {
            if (newValue != null) {
              _selectedProjectCode = newValue;
              await _fetchSubmissionData(newValue);
            }
          },
        ),
      ),
    );
  }
  /// Display Cards based on submission data

  Widget _buildSubmissionCards() {
    if (submissions == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
         // child: CircularProgressIndicator(),
          child: Center(child: Text("No data available.",style: TextStyle(
            color: Colors.black54,
            fontSize: 14
          ),)),
        ),
      );
    }
    if (submissions!.isEmpty) {
      return const Center(child: Text("No data available."));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: submissions!.length,
      itemBuilder: (context, index) {
        final data = submissions![index].data;

        return Card(
            color: Colors.white, // 👈 Set background color to white
            elevation: 4, // Subtle elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.grey, width: 0.6), // Light gray border
            ),
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...data.entries
                      .where((entry) => !_isExcludedKey(entry.key))
                      .map((entry) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  entry.key,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  entry.value?.toString() ?? "-",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.4,
                        ),
                      ],
                    );
                  }).toList(),

                  // 🔽 Icons Section
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          List<String> photoUrls = data.entries
                              .where((entry) =>
                          entry.key.toLowerCase().contains('site photo') &&
                              entry.value != null &&
                              entry.value.toString().isNotEmpty)
                              .map((entry) => entry.value.toString())
                              .toList();

                          if (photoUrls.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PhotoViewerPage(imageUrls: photoUrls),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("No photos available for this submission")),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 12),
                         // child: Icon(Icons.photo, color: Colors.grey, size: 20),
                          child:  Image.asset(
                            'assets/images/camra.jpeg',
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (data.containsKey("fLatitude")) {
                            latitude = double.tryParse(data["fLatitude"].toString());
                          }
                          if (data.containsKey("fLongitude")) {
                            longitude = double.tryParse(data["fLongitude"].toString());
                          }
                          if (latitude != null && longitude != null) {
                            launchGoogleMaps(latitude!, longitude!);
                          }
                        },
                        child: const Icon(Icons.location_on, color: Colors.grey, size: 25),
                      ),
                    ],
                  )
                ],
              ),
            ),
        );

      },
    );
  }

  bool _isExcludedKey(String key) {
    const excluded = {
      'Site Photo 1',
      'Site Photo 2',
      'Site Photo 3',
      'Site Photo 4',
      'fLatitude',
      'fLongitude',
    };
    return excluded.contains(key);
  }
}




