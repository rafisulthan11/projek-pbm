import 'package:flutter/material.dart';

class DataDiri extends StatefulWidget {
  const DataDiri({Key? key}) : super(key: key);

  @override
  State<DataDiri> createState() => _DataDiriState();
}

class _DataDiriState extends State<DataDiri> {
  final _formKey = GlobalKey<FormState>();

  // Example user data
  final String nik = '1234567890123456';
  String? jenisKelaminValue = 'Perempuan'; // Updated
  final String tempatLahir = 'Jakarta';
  final String tanggalLahir = '01/01/1990';
  final String alamatLengkap = 'Jl. Merdeka No. 1';
  String? statusPernikahanValue = 'Belum Menikah'; // Updated

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Data Diri',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF4682A9),
        iconTheme: IconThemeData(color: Colors.white), // Ubah warna ikon menjadi putih
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextFormField('NIK', nik),
              SizedBox(height: 16.0),

              _buildDropdownFormField('Jenis Kelamin', jenisKelaminValue, ['Laki-laki', 'Perempuan']),
              SizedBox(height: 16.0),

              _buildTextFormField('Tempat Lahir', tempatLahir),
              SizedBox(height: 16.0),

              _buildTextFormField('Tanggal Lahir', tanggalLahir),
              SizedBox(height: 16.0),

              _buildTextFormField('Alamat Lengkap', alamatLengkap),
              SizedBox(height: 16.0),

              _buildDropdownFormField('Status Pernikahan', statusPernikahanValue, ['Belum Menikah', 'Menikah']),
              SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4682A9)), // Background color of button
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                  minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)), // Set width and height
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Set border radius
                    ),
                  ),
                ),
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String labelText, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 4.0),
        Container(
          color: Color(0xFFC1D9F1), // Background color
          child: TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color(0xFFC1D9F1), // Match background color
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $labelText';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownFormField(String labelText, String? value, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 4.0),
        Container(
          color: Color(0xFFC1D9F1), // Background color
          child: DropdownButtonFormField<String>(
            value: value,
            onChanged: (selectedValue) {
              setState(() {
                value = selectedValue;
              });
            },
            items: items.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color(0xFFC1D9F1), // Match background color
            ),
            validator: (selectedValue) {
              if (selectedValue == null || selectedValue.isEmpty) {
                return 'Please select $labelText';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
