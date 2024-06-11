import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../app/generalFunction.dart';
import '../../app/navigationUtils.dart';
import '../../resources/app_text_style.dart';

class GrievanceStatus extends StatefulWidget {
  final name;
  GrievanceStatus({super.key, this.name});

  @override
  State<GrievanceStatus> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<GrievanceStatus> {
  GeneralFunction generalFunction = GeneralFunction();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    NavigationUtils.onWillPop(context);
    return true;
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack(context,'${widget.name}'),
      drawer:
          generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Container(
              height: 45,
              child: Card(
                elevation: 5,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.grey, // Border color
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter Keywords',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Card(
                elevation: 8,
                shadowColor: Colors.grey,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Container(
                        height: 77,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Container(
                                color :Color(0xFFfFcccb),
                                //color: Colors.blueGrey,
                                height: 50,
                                child: ListTile(
                                  leading: Container(
                                    width: 35,
                                    height: 35,
                                    // Height and width must be equal to make it circular
                                    decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle,
                                      // Makes the container circular
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/ic_camera.PNG',
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  title: const Text(
                                    "Ward No -5",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                )),
                            Positioned(
                              top: 25,
                              right: 15,
                              child: Container(
                                width: 50,
                                height: 50,
                                // Height and width must be equal to make it circular
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                  // Makes the container circular
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/ic_camera.PNG',
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 0, right: 2, bottom: 2),
                              child: const Icon(
                                Icons.forward_sharp,
                                size: 12,
                                color: Colors.black54,
                              )),
                          Text('Complaint No',
                              style: AppTextStyle
                                  .font16penSansExtraboldBlack45TextStyle),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('202405310001',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack26TextStyle),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 0, right: 2, bottom: 2),
                              child: const Icon(
                                Icons.forward_sharp,
                                size: 12,
                                color: Colors.black54,
                              )),
                          Text('Category',
                              style: AppTextStyle
                                  .font16penSansExtraboldBlack45TextStyle),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Sanitation & Public Health',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack26TextStyle),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 0, right: 2, bottom: 2),
                              child: const Icon(
                                Icons.forward_sharp,
                                size: 12,
                                color: Colors.black54,
                              )),
                          Text('Sub Category',
                              style: AppTextStyle
                                  .font16penSansExtraboldBlack45TextStyle),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Night Sweeping',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack26TextStyle),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 0, right: 2, bottom: 2),
                              child: const Icon(
                                Icons.forward_sharp,
                                size: 12,
                                color: Colors.black54,
                              )),
                          Text('Complaint Details',
                              style: AppTextStyle
                                  .font16penSansExtraboldBlack45TextStyle),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('hyhsh',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack26TextStyle),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 0, right: 2, bottom: 2),
                              child: const Icon(
                                Icons.forward_sharp,
                                size: 12,
                                color: Colors.black54,
                              )),
                          Text('Address',
                              style: AppTextStyle
                                  .font16penSansExtraboldBlack45TextStyle),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('hshs',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack26TextStyle),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 0, right: 2, bottom: 2),
                              child: const Icon(
                                Icons.forward_sharp,
                                size: 12,
                                color: Colors.black54,
                              )),
                          Text('Status',
                              style: AppTextStyle
                                  .font16penSansExtraboldBlack45TextStyle),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Pending',
                            style:
                                AppTextStyle.font14penSansExtraboldRedTextStyle),
                      ),
                      Row(
                        children: [
                          // First Container
                          Expanded(
                            child: Container(
                              height: 50,
                              //color: Colors.blue,
                              decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Posted By',
                                        style: AppTextStyle
                                            .font140penSansExtraboldWhiteTextStyle),
                                    Text('Soyab',
                                        style: AppTextStyle
                                            .font140penSansExtraboldWhiteTextStyle)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          // Second Container
                          Expanded(
                            child: Container(
                              height: 50,
                              //color: Colors.blue,
                              decoration: BoxDecoration(
                                color :Color(0xFFfFcccb),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Posted At',
                                        style: AppTextStyle
                                            .font140penSansExtraboldWhiteTextStyle),
                                    Text('31/May/2024 15:53',
                                        style: AppTextStyle
                                            .font140penSansExtraboldWhiteTextStyle)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Second item

          ],
        ),
      ),
    );
  }
}
