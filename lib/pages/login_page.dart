import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/auth/auth_bloc.dart';
import 'package:latihan_bloc/pages/smartbuilding.dart';
import 'package:latihan_bloc/visibility_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1525838808082-a422ecbce2ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c21hcnQlMjBidWlsZGluZ3xlbnwwfHwwfHx8MA%3D%3D',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            // Bagian tulisan welcome di atas
            Padding(
              padding: const EdgeInsets.only(top: 50.0), // Atur jarak dari atas
              child: const Text(
                'Welcome To SmartBuilding',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Spacer digunakan agar input form tetap di tengah
            Spacer(),
            // Input form di bagian tengah layar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email input with rounded corners and icon
                  TextFormField(
                    controller: emailC,
                    decoration: InputDecoration(
                      
                      prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                      fillColor: Colors.white.withOpacity(0.9),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Password input with rounded corners, icon, and visibility toggle
                  BlocConsumer<VisibilityCubit, bool>(
                    listener: (context, state) {},
                    builder: (context, isObscured) {
                      return TextFormField(
                        controller: passC,
                        obscureText: isObscured,
                        decoration: InputDecoration(
                          
                          prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                          fillColor: Colors.white.withOpacity(0.9),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscured ? Icons.visibility_off : Icons.visibility,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {
                              context.read<VisibilityCubit>().change();
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  // Login Button with Loading Indicator
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthEventLogin(
                              email: emailC.text,
                              password: passC.text,
                            ),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthStateError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message),
                            duration: const Duration(seconds: 2),
                          ));
                        } else if (state is AuthStateLoaded) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RoomSelectionPage(),
                          ));
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthStateLoading) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('bentar'),
                            ],
                          );
                        }
                        return const Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Spacer agar input form tetap di tengah dan tidak terdorong ke bawah
            Spacer(),
          ],
        ),
      ),
    );
  }
}
