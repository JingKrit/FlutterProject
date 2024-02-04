import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget
{
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context)                   // initial ค่าใส่ใน context ตอนเริ่มแอพ ทุก widget จะใช้ได้
  {
    return Padding
    (
      padding: const EdgeInsets.all(16.0),             // ขอบข้าง ๆ , default padding design 16
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>
        [
          TextFormField                                // custom widget , cmd + click -> code
          (
            decoration: const InputDecoration
            (
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField
          (
            decoration: const InputDecoration
            (
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton                               // property -> onPressed()
          (
            onPressed: () => {},                       // () => {} call function
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
