import 'package:flutter/material.dart';
import 'package:my_app/projects/task_manager_app/utils/validators.dart';

void main() {
  runApp(const RegisterPage());
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _RegisterForm());
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // State
  String? _role;
  bool _acceptTerms = false;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _gender;

  // Errors
  String? _usernameError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      final username = _usernameController.text;
      setState(
        () =>
            _usernameError =
                username.isEmpty ? 'Username cannot be empty' : null,
      );
    });

    _passwordController.addListener(() {
      final password = _passwordController.text;
      setState(
        () =>
            _passwordError =
                password.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
      );
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(FormFieldState<DateTime> state) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });

      state.didChange(pickedDate); // notify FormField of the change
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _acceptTerms) {
      // Perform registration logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Welcome: ${_usernameController.text}, Gender: $_gender',
          ),
        ),
      );
    } else if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the terms and conditions')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Form')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _usernameController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Username',
                  errorText: _usernameError,
                ),
                validator:
                    (value) =>
                        Validators.validateRequired(value, field: 'Username'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _passwordError,
                ),
                obscureText: true,
                validator: (value) => Validators.validatePassword(value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator:
                    (value) => Validators.validateMatch(
                      value,
                      _passwordController.text,
                      'Password',
                      'Confirm Password',
                    ),
              ),
              DropdownButtonFormField<String>(
                value: _role,
                decoration: InputDecoration(labelText: 'Role'),
                items:
                    ['Admin', 'User', 'Guest']
                        .map(
                          (role) =>
                              DropdownMenuItem(value: role, child: Text(role)),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _role = value;
                  });
                },
                validator:
                    (value) =>
                        Validators.validateSelection(value, field: 'Role'),
              ),
              const SizedBox(height: 16),
              const Text('Gender', style: TextStyle(fontSize: 16)),
              FormField<String>(
                validator: (_) => Validators.validateGender(_gender),
                builder:
                    (state) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Male',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() => _gender = value); // Updates UI
                                // state.didChange(value); // updates form value
                              },
                            ),
                            const Text('Male'),
                            Radio<String>(
                              value: 'Female',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() => _gender = value);
                                // state.didChange(value);
                              },
                            ),
                            const Text('Female'),
                          ],
                        ),
                        if (state.hasError)
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              state.errorText!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    ),
              ),
              FormField<DateTime>(
                validator:
                    (value) => Validators.validateDateInPast(
                      value,
                      field: 'Date of Birth',
                    ),
                builder:
                    (state) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Date of Birth: '),
                            Expanded(
                              child: Text(
                                _selectedDate == null
                                    ? 'No date selected'
                                    : _selectedDate!.toLocal().toString().split(
                                      ' ',
                                    )[0],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _pickDate(state);
                              },
                              icon: Icon(Icons.calendar_today),
                            ),
                          ],
                        ),
                        if (state.hasError)
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              state.errorText!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    ),
              ),
              Row(
                children: [
                  const Text('Contact time: '),
                  Expanded(
                    child: Text(
                      _selectedTime == null
                          ? 'No time selected'
                          : _selectedTime!.format(context),
                    ),
                  ),
                  IconButton(
                    onPressed: _pickTime,
                    icon: Icon(Icons.access_time),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value!;
                      });
                    },
                  ),
                  Expanded(child: const Text('Accept Terms and Conditions')),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _submit, child: Text('Register')),
            ],
          ),
        ),
      ),
    );
  }
}
