import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../model/getServeModel.dart';
import '../../../services/bindCityzenWardRepo.dart';
import '../../../services/getSurveyRepo.dart';



class ReportScreen extends StatefulWidget {

  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String? _selectedProjectCode;
  List<dynamic> bindCityWardList = []; // Dropdown items
  List<SurveySubmissionModel>? submissions; // Report data


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
    bindCityWardList = await BindCityzenWardRepo().getbindWard();; // Dummy method
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
      body: GestureDetector(
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
    );
  }

  /// Dropdown Widget for Project Selection
  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedProjectCode,
      isExpanded: true,
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
        elevation: 6,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: _navGradient,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data.entries
                .where((entry) => !_isExcludedKey(entry.key))
                .map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      entry.value?.toString() ?? "-",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ))
                .toList(),
          ),
        ),
      );


        // return Card(
        //   margin: const EdgeInsets.symmetric(vertical: 8),
        //   elevation: 3,
        //   child: Padding(
        //     padding: const EdgeInsets.all(12),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: data.entries
        //           .where((entry) => !_isExcludedKey(entry.key))
        //           .map((entry) => Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 4),
        //         child: Row(
        //           children: [
        //             Expanded(
        //               flex: 4,
        //               child: Text(
        //                 "${entry.key}:",
        //                 style: const TextStyle(fontWeight: FontWeight.bold),
        //               ),
        //             ),
        //             Expanded(
        //               flex: 6,
        //               child: Text(entry.value?.toString() ?? "-"),
        //             ),
        //           ],
        //         ),
        //       ))
        //           .toList(),
        //     ),
        //   ),
        // );
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




