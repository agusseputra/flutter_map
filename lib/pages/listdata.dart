import 'package:flutter/material.dart';
import 'package:waterspring/theme.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController textController;
  double currentPageValue = 0;
  PageController controller = PageController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    //Provider.of<PatientProvider>(context, listen: false).getPatient(1,"",1  );
    // Provider.of<PatientProvider>(context, listen: false).getPatient(0,"",1);
    // controller.addListener(() {
    //   setState(() {
    //     currentPageValue = controller.page!;
    //     print(currentPageValue);
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Widget header() {
      return Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            height: height * 0.34,
            decoration: const BoxDecoration(
              color: Color(0xFF4B39EF),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Text(
                    'Get QR Code',
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    'Access Family Medical Record',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Search name or nik...',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            filled: true,
                            fillColor: const Color(0x4BFFFFFF),
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    16, 20, 16, 20),
                            prefixIcon: Icon(
                              Icons.search,
                              color: tertiaryColor,
                              size: 16,
                            ),
                            suffixIcon: Icon(
                              Icons.filter_list_outlined,
                              color: tertiaryColor,
                              size: 22,
                            ),
                          ),
                          style: whiteTextStyle.copyWith(
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: height * 0.30,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: backgorundColor,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ],
      );
    }

    Widget riwayat() {
      return Container(
        child: const Text("Data"),
      );
    }

    Widget empty() {
      return Expanded(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image_empty_riwayat.png',
                      width: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Belum ada Riwayat',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Yuk Daftarkan Riwayat Periksamu',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
              ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Container(
          child: riwayat(),
        ),
        // child: Column(
        //   children: [
        //     Container(
        //       child: riwayat(),
        //     ),
        //     Divider(
        //       height: 24,
        //       thickness: 1,
        //       color: secondaryColor,
        //     ),
        //     Padding(
        //       padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
        //       child: Row(
        //         mainAxisSize: MainAxisSize.max,
        //         children:  [
        //           Text(
        //             'Recent Views',
        //             style: primaryTextStyle.copyWith(fontWeight: medium),
        //           ),
        //         ],
        //       ),
        //     ),
        //     ListView(
        //       padding: EdgeInsets.zero,
        //       primary: false,
        //       shrinkWrap: true,
        //       scrollDirection: Axis.vertical,
        //       children: [
        //         cardlog(1, 'dr. Handika Sucipta', '4 Maret 2022, 12:30 Wita', context),
        //         cardlog(2, 'dr. Gita Buwana, Sp.Og', '1 Maret 2022, 12:30 Wita', context),
        //         cardlog(3, 'Gede Jana Juna', '1 Februari 2022, 12:30 Wita', context),
        //       ],
        //     ),
        //   ],
        // ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(40),
      //   child: AppBar(
      //     backgroundColor: ColorDesign.primary,
      //     title: const Text("Family QR"),
      //   ),
      // ),
      backgroundColor: backgorundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [header(), content()],
        ),
      ),
    );
  }
}
