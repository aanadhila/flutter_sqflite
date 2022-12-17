import 'package:flutter/material.dart';
import '/models/item.dart';

class EntryForm extends StatefulWidget {
  Item? item;

  EntryForm({Key? key, required this.item}) : super(key: key);

  @override
  State<EntryForm> createState() => _EntryFormState(this.item);
}

class _EntryFormState extends State<EntryForm> {
  Item? item;
  _EntryFormState(this.item);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController kodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (item != null) {
      nameController.text = item!.name;
      priceController.text = item!.price.toString();
      kodeController.text = item!.kode;
      stokController.text = item!.stok;
    }
    return Scaffold(
        appBar: AppBar(
            title: item == null ? Text('Tambah') : Text('Ubah'),
            leading: Icon(Icons.keyboard_arrow_left)),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: [
              // nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // harga
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Harga',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: stokController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Stok',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: kodeController,
                  decoration: InputDecoration(
                    labelText: 'Kode',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColorDark,
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColorLight)),
                        child: Text(
                          "Save",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (item == null) {
                            // Tambah Data
                            item = Item(
                              nameController.text,
                              int.parse(priceController.text),
                              int.parse(stokController.text),
                              kodeController.text,
                            );
                          } else {
                            item!.name = nameController.text;
                            item!.price = int.parse(priceController.text);
                            item!.stok = int.parse(stokController.text);
                            item!.kode = kodeController.text;
                          }
                          Navigator.pop(context, item);
                        },
                      ),
                    )
                  ],
                ),
              ),

              Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark,
                        textStyle: TextStyle(
                            color: Theme.of(context).primaryColorLight)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel', textScaleFactor: 1.5)),
              )
            ],
          ),
        ));
  }
}
