import 'package:coursse_flutter_ui_app/models/country.dart';
import 'package:coursse_flutter_ui_app/models/subject.dart';
import 'package:coursse_flutter_ui_app/utill/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _showNotifications = false;
  String? _gender;
  late RangeValues _rangeValues;
  int? _selectedCountryId;
  List<String> _experience = <String>[];
  late TextEditingController _experienceTextEditingController;

  final List<Subject> _subjects = <Subject>[
    Subject("Sports"),
    Subject("Casual"),
    Subject("Jackets")
  ];

  final List<Country> _countries = <Country>[
    const Country(1, "Palestine"),
    const Country(2, "Egypt"),
    const Country(3, "Kuwait"),
    const Country(4, "Qatar"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _rangeValues = RangeValues(100, 200);
    _experienceTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _experienceTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        SwitchListTile(
            activeColor: Colors.purple.shade900,
            activeTrackColor: Colors.purple.shade200,
            title: const Text('Notifications'),
            subtitle: const Text("Enable/Disable Notifications"),
            value: _showNotifications,
            contentPadding: EdgeInsets.zero,
            onChanged: (bool value) {
              setState(() => _showNotifications = value);
            }),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Gender",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        Row(
          children: [
            Expanded(
                child: RadioListTile<String>(
                    title: const Text("Male"),
                    value: "M ",
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() => _gender = value);
                    })),
            Expanded(
                child: RadioListTile<String>(
                    title: const Text("Female"),
                    value: "F",
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() => _gender = value);
                    }))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Price Range",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        RangeSlider(
            min: 0,
            max: 300,
            divisions: 10,
            values: _rangeValues,
            labels: RangeLabels(
                _rangeValues.start.toString(), _rangeValues.end.toString()),
            activeColor: Colors.pink,
            inactiveColor: Colors.pink.shade100,
            onChanged: (RangeValues value) {
              setState(() => _rangeValues = value);
            }),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Subjects",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        for (Subject subject in _subjects)
          CheckboxListTile(
              title: Text(subject.name),
              value: subject.checked,
              activeColor: Colors.pink,
              checkColor: Colors.white,
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() {
                    subject.checked = value;
                  });
                }
              }),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Country",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        DropdownButton<int>(
            isExpanded: true,
            hint: Text(
              "Select Country",
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
            itemHeight: 50,
            icon: Icon(Icons.keyboard_arrow_down_outlined),
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
            onChanged: (int? value) {
              setState(() => _selectedCountryId = value);
            },
            value: _selectedCountryId,
            items: _countries
                .map((Country country) => DropdownMenuItem(
                      value: country.id,
                      child: Text(country.name),
                    ))
                .toList()),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Experience",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        TextField(
          controller: _experienceTextEditingController,
          keyboardType: TextInputType.text,
          style: GoogleFonts.poppins(fontSize: 14),
          onSubmitted: (value) {
            print('Save');
          },
          decoration: InputDecoration(
              hintText: "Enter experience",
              suffixIcon: IconButton(
                onPressed: () =>_performSave(),
                icon: Icon(Icons.save_outlined),
              )),
        ),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children: _experience
              .map((e) => Chip(
                    label: Text(e),
                    labelStyle:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 13),
                    backgroundColor: Colors.white,
                    elevation: 5,
                    avatar: Icon(
                      Icons.work_outline,
                      color: Colors.black45,
                    ),
                    deleteIcon: Icon(
                      Icons.close,
                      color: Colors.red.shade700,
                      size: 18,
                    ),
                    deleteIconColor: Colors.red.shade700,
                    onDeleted: () =>_delete(e),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.blue,width: 1
              )
            ),
                  ))
              .toList(),
        )
      ],
    );
  }

  void _performSave() {
    if (_checkData()) {
      _save();
    }
  }

  bool _checkData() {
    if (_experienceTextEditingController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: "Enter required data");
    return false;
  }

  void _save() async {
    setState(() {
      _experience.add(_experienceTextEditingController.text);
    });
    _clear();
  }

  void _clear() {
    _experienceTextEditingController.clear();
  }
  void _delete(String experience){
    setState(()=>_experience.remove(experience));
  }

}
