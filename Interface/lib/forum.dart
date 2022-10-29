import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onboarding_app/result.dart';
import 'package:google_fonts/google_fonts.dart';

_callApi(Map data) async {
  var url = 'https://lasso-app.herokuapp.com/estimate';
  var body = json.encode(data);

  final response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);
  final result = jsonDecode(response.body);
  final newResult = jsonDecode(result["The predicted price is"]);
  return newResult[0];
}

class Ronaldo extends StatefulWidget {
  const Ronaldo({Key? key}) : super(key: key);

  @override
  State<Ronaldo> createState() => _RonaldoState();
}

class _RonaldoState extends State<Ronaldo> {
  final List<String> brands = [
    "acer",
    "lenovo",
    "hp",
    "asus",
    "dell",
    "msi",
  ];
  final List<String> cpu_brand = ["intel", "amd"];
  final List<String> cpu_model = [
    "i3",
    "i5",
    "i7",
    "i9",
    "ryzen 3",
    "ryzen 5",
    "ryzen 7",
    "ryzen 9"
  ];
  final List<String> cpu_generation = [
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11"
  ];
  final List<String> cpu_line = [
    "300",
    "750",
    "700",
    "35",
    "500",
    "250",
    "65",
    "600",
    "550",
    "200",
    "210",
    "350",
    "800",
    "265",
    "310",
    "365",
    "5",
    "45",
    "850",
    "100",
    "565",
    "370",
    "820",
    "15",
    "510",
    "130",
    "610",
    "6",
    "20",
    "85",
    "650",
    "110",
    "400",
    "390",
    "900"
  ];
  final List<String> cpu_family = [
    "u",
    "h",
    "q",
    "qm",
    "mq",
    "hq",
    "g7",
    "g1",
    "g4",
    "hx",
    "hf"
  ];
  final List<String> gpu = ["nvidia", "intel", "amd"];
  final List<String> gpu_type = [
    "integrated",
    "gtx",
    "rtx",
    "gt",
    "quadro",
    "mx",
    "radeon",
    "rx"
  ];
  final List<String> gpu_model = [
    "integrated",
    "1050 ",
    "1650",
    "1060",
    "2060",
    "1050ti",
    "3060",
    "1660ti",
    "2080",
    "3050ti",
    "3070",
    "1650ti",
    "1070",
    "3050",
    "3080",
    "p620",
    "tm530",
    "110",
    "t500",
    "130",
    "230",
    "m520",
    "m3000m",
    "m1200",
    "k1000m",
    "350",
    "960m",
    "940mx",
    "930mx",
    "740m",
    "5600m",
    "330",
  ];
  final List<String> gpu_vram = ["0", "2", "4", "6", "8"];
  final List<String> ram = ["4", "6", "8", "12", "16", "20", "24"];
  final List<String> ram_type = ["ddr3", "ddr4", "ddr4x"];
  final List<String> screen_size = [
    "15.6",
    "14.0",
    "17.3",
    "13.3",
    "12.5",
    "15.0",
    "13.0",
    "13.9",
    "14.4",
    "16.1",
    "17.0"
  ];
  final List<String> screen_resolution = [
    "hd",
    "qhd",
    "uhd",
    "fhd",
    "2k",
    "3k",
    "4k"
  ];
  final List<String> screen_refreshrate = [
    "60",
    "90",
    "120",
    "144",
    "165",
  ];
  final List<String> anti_reflect = ["no", "yes"];
  final List<String> tactil = ["no", "yes"];
  final List<String> hdd = ["0", "512", "1000", "2000"];
  final List<String> ssd = ["0", "128", "256", "512"];
  final List<String> state = ["used", "new"];

  double price = 0.0;

  String? _selectedBrand;
  String? _selectedCpuBrand;
  String? _selectedCpuModel;
  String? _selectedCpuGeneration;
  String? _selectedCpuLine;
  String? _selectedCpuFamily;
  String? _selectedGpu;
  String? _selectedGpuType;
  String? _selectedGpuModel;
  String? _selectedGpuVram;
  String? _selectedRam;
  String? _selectedRamType;
  String? _selectedScreenSize;
  String? _selectedScreenResolution;
  String? _selectedScreenRefreshrate;
  String? _selectedAntiReflect;
  String? _selectedTactil;
  String? _selectedhdd;
  String? _selectedssd;
  String? _selectedState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose the characteristics then tap Predict",
            style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.restart_alt_outlined,
              color: Colors.black,
            ),
            tooltip: 'Reset',
            onPressed: () {
              _selectedBrand = null;
              _selectedCpuBrand = null;
              _selectedCpuModel = null;
              _selectedCpuGeneration = null;
              _selectedCpuLine = null;
              _selectedCpuFamily = null;
              _selectedGpu = null;
              _selectedGpuType = null;
              _selectedGpuModel = null;
              _selectedGpuVram = null;
              _selectedRam = null;
              _selectedRamType = null;
              _selectedScreenSize = null;
              _selectedScreenResolution = null;
              _selectedScreenRefreshrate = null;
              _selectedAntiReflect = null;
              _selectedTactil = null;
              _selectedhdd = null;
              _selectedssd = null;
              _selectedState = null;
              setState(() {});
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedBrand = value;
                      });
                    },
                    value: _selectedBrand,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Laptop brand',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: brands
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => brands
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedCpuBrand = value;
                      });
                    },
                    value: _selectedCpuBrand,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      ' Cpu brand',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: cpu_brand
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => cpu_brand
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedCpuModel = value;
                      });
                    },
                    value: _selectedCpuModel,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Cpu model',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: cpu_model
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => cpu_model
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedCpuGeneration = value;
                      });
                    },
                    value: _selectedCpuGeneration,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Cpu generation',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: cpu_generation
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) =>
                        cpu_generation
                            .map((e) => Center(
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedCpuLine = value;
                      });
                    },
                    value: _selectedCpuLine,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Cpu line',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: cpu_line
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => cpu_line
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedCpuFamily = value;
                      });
                    },
                    value: _selectedCpuFamily,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Cpu family',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: cpu_family
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => cpu_family
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedGpu = value;
                      });
                    },
                    value: _selectedGpu,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Gpu brand',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: gpu
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => gpu
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedGpuType = value;
                      });
                    },
                    value: _selectedGpuType,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Gpu type',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: gpu_type
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => gpu_type
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedGpuModel = value;
                      });
                    },
                    value: _selectedGpuModel,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Gpu model',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: gpu_model
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => gpu_model
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedGpuVram = value;
                      });
                    },
                    value: _selectedGpuVram,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Gpu vram',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: gpu_vram
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => gpu_vram
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedRam = value;
                      });
                    },
                    value: _selectedRam,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Ram',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: ram
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => ram
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedRamType = value;
                      });
                    },
                    value: _selectedRamType,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Ram type',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: ram_type
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => ram_type
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedScreenSize = value;
                      });
                    },
                    value: _selectedScreenSize,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Screen size',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: screen_size
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => screen_size
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedScreenResolution = value;
                      });
                    },
                    value: _selectedScreenResolution,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Screen resolution',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: screen_resolution
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) =>
                        screen_resolution
                            .map((e) => Center(
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedScreenRefreshrate = value;
                      });
                    },
                    value: _selectedScreenRefreshrate,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Screen refreshrate',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: screen_refreshrate
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) =>
                        screen_refreshrate
                            .map((e) => Center(
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedAntiReflect = value;
                      });
                    },
                    value: _selectedAntiReflect,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Select whether it is anti-reflect or not',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: anti_reflect
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => anti_reflect
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedTactil = value;
                      });
                    },
                    value: _selectedTactil,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'Select whether it is tactil or not',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: tactil
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => tactil
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedhdd = value;
                      });
                    },
                    value: _selectedhdd,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'HDD storage',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: hdd
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => hdd
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedssd = value;
                      });
                    },
                    value: _selectedssd,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'SSD storage',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: ssd
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => ssd
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedState = value;
                      });
                    },
                    value: _selectedState,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      'State',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    // The list
                    isExpanded: true,
                    items: state
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => state
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 40.0,
                  height: 40.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.black.withOpacity(0.8)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () async {
                      var data = {};
                      data["brands"] = _selectedBrand;
                      data["cpu_brand"] = _selectedCpuBrand;
                      data["cpu_model"] = _selectedCpuModel;
                      data["cpu_generation"] = _selectedCpuGeneration;
                      data["cpu_line"] = _selectedCpuLine;
                      data["cpu_family"] = _selectedCpuFamily;
                      data["gpu"] = _selectedGpu;
                      data["gpu_type"] = _selectedGpuType;
                      data["gpu_model"] = _selectedGpuModel;
                      data["gpu_vram"] = _selectedGpuVram;
                      data["ram"] = _selectedRam;
                      data["ram_type"] = _selectedRamType;
                      data["screen_size"] = _selectedScreenSize;
                      data["screen_resolution"] = _selectedScreenResolution;
                      data["screen_refreshrate"] = _selectedScreenRefreshrate;
                      data["anti_reflect"] = _selectedAntiReflect;
                      data["tactil"] = _selectedTactil;
                      data["hdd"] = _selectedhdd;
                      data["ssd"] = _selectedssd;
                      data["state"] = _selectedState;
                      price = await _callApi(data);
                      data["price"] = price;

                      print(jsonEncode(data));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Result(price: price, data: data)));
                    },
                    child: Text('predict'),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
