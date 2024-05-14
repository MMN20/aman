import 'package:aman/provider/app.dart';
import 'package:aman/screen/claim_status/claim_status_main_page.dart';
import 'package:aman/widgets/general_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Method to extract key-value pairs from the provided data

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 60,
              ),
              _buildHeader(app.userdata.cus.img, app.userdata.cus.name),
              const SizedBox(
                height: 60,
              ),
              const SizedBox(height: 20),
              InfoCard(
                title: 'الاسم',
                value: app.userdata.cus.name,
                icon: Icons.person,
              ),
              InfoCard(
                title: 'رقم الهاتف',
                value: app.userdata.cus.phone,
                icon: Icons.phone,
              ),
              InfoCard(
                title: 'اسم الام',
                value: app.userdata.cus.mother,
                icon: Icons.location_on,
              ),
              InfoCard(
                title: 'الجهة',
                value: app.userdata.cus.union.name,
                icon: Icons.location_on,
              ),
              InfoCard(
                title: 'المهنة',
                value: app.userdata.cus.job,
                icon: Icons.location_on,
              ),
              InfoCard(
                title: 'كود الاحالة',
                value: app.userdata.cus.reverralUser,
                icon: Icons.location_on,
              ),
              GeneralButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ClaimStatusMainPage();
                  }));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("حالة المطالبات"),
                    SizedBox(width: 5),
                    Icon(Icons.settings),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GeneralButton(
                onPressed: () {
                  app.logout(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("تسجيل الخروج"),
                    SizedBox(width: 5),
                    Icon(Icons.exit_to_app),
                  ],
                ),
              ),
              // _buildActionButtons(context, app),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(img, String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('$img'),
        ),
        const SizedBox(height: 10),
        Text(
          name.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            app.logout(context);
          },
          child: const Text('تسجيل الخروج'),
        ),
        // const SizedBox(height: 10),
        // ElevatedButton(
        //   onPressed: () {
        //     // Implement delete account functionality
        //   },
        //   child: const Text('Delete Account'),
        // ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      surfaceTintColor: Colors.grey[400],
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.black.withOpacity(0.09),
          ),
        ),
        leading: Icon(icon),
        title: Text(title),
        subtitle: SelectableText(value),
      ),
    );
  }
}
