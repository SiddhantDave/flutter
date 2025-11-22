import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import '../../utils/colors.dart';
import '../../widgets/kin_logo.dart';

class ProfilePictureUploadScreen extends StatefulWidget {
  const ProfilePictureUploadScreen({super.key});

  @override
  State<ProfilePictureUploadScreen> createState() => _ProfilePictureUploadScreenState();
}

class _ProfilePictureUploadScreenState extends State<ProfilePictureUploadScreen> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );
      
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile;
        });
      }
    } catch (e) {
      // Handle error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            
            // Logo
            const KinLogo(width: 74, height: 50),
            
            const SizedBox(height: 32),
            
            // Heading
            const Text(
              "You're All Set, Jhanvi!",
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 16),
            
            // Subtext
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: const Text(
                "We've received your answers and they're safe with us.\nThe Kin team will review your application and reach out if you're a good fit.",
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF333333),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            const Spacer(),
            
            // Profile Picture Placeholder
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: BoxShape.circle,
                    ),
                    child: _imageFile == null
                        ? const Center(
                            child: Icon(
                              Icons.photo,
                              size: 48,
                              color: Colors.black,
                            ),
                          )
                        : ClipOval(
                            child: kIsWeb
                                ? Image.network(
                                    _imageFile!.path,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(_imageFile!.path),
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                  ),
                  // Edit Button
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.background, width: 3),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const Spacer(),
            
            // Upload Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to welcome screen after upload
                    Navigator.pushNamed(
                      context, 
                      '/welcome',
                      arguments: _imageFile,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.primaryLight,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Upload a Profile Picture',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Skip Button
            GestureDetector(
              onTap: () {
                // Navigate to welcome screen when skipping
                Navigator.pushNamed(
                  context, 
                  '/welcome',
                  arguments: _imageFile,
                );
              },
              child: const Text(
                'skip',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
