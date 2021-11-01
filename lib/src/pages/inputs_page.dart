import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key? key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';

  String _selectedPowerOption = 'Fly';
  List<String> _powers = ['Fly', 'Rich', 'Super power'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createdDropDown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          counter: Text('Words ${_name.length}'),
          hintText: 'Type your name',
          labelText: 'First name',
          suffixIcon: Icon(Icons.person),
          icon: Icon(Icons.tag)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
        //print(value);
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          counter: Text('Words ${_email.length}'),
          hintText: 'Type your email address',
          labelText: 'Email address',
          suffixIcon: Icon(Icons.email),
          icon: Icon(Icons.tag)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          counter: Text('Words ${_password.length}'),
          hintText: 'Type a strong password',
          labelText: 'Password account',
          helperText: '8 characters minimum',
          suffixIcon: Icon(Icons.password),
          icon: Icon(Icons.tag)),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('The name is: $_name'),
      subtitle: Text('The email is: $_email'),
      trailing: Text(_selectedPowerOption),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: 'Born date',
          labelText: 'date',
          suffixIcon: Icon(Icons.date_range),
          icon: Icon(Icons.tag)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedData = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (pickedData != null) {
      setState(() {
        _date = pickedData.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  //Elements to dropDownMenu
  List<DropdownMenuItem<String>> getDropDownOptions() {
    //Init list
    List<DropdownMenuItem<String>> list = [];

    //Fill list
    _powers.forEach((power) {
      list.add(DropdownMenuItem(child: Text(power), value: power));
    });

    return list;
  }

  Widget _createdDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.tag),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
            child: DropdownButton(
                value: _selectedPowerOption,
                items: getDropDownOptions(),
                onChanged: (opt) {
                  setState(() {
                    _selectedPowerOption = opt.toString();
                  });
                  //print(opt);
                })),
      ],
    );
  }
}
