import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../controllers/company_controller.dart';
import '../widgets/add_employee.dart';
import '../widgets/edit_employee.dart';
import '../widgets/remove_employee.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  final indexController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final positionController = TextEditingController();
  final skillController = TextEditingController();

  CompanyController companyController = CompanyController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    companyController.getProducts().then((_) {
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      // Handle error here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Company Info",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        //
        actions: [
          IconButton(
            icon: Icon(Icons.edit,color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit(
                    indexController: indexController,
                    nameController: nameController,
                    ageController: ageController,
                    positionController: positionController,
                    skillController: skillController,
                  ),
                ),
              ).then((_) => setState(() {}));
            },
          ),
          IconButton(
            icon: Icon(Icons.add,color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Add(
                    indexController: indexController,
                    nameController: nameController,
                    ageController: ageController,
                    positionController: positionController,
                    skillController: skillController,
                  ),
                ),
              ).then((_) => setState(() {}));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete,color: Colors.red,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Remove(
                    indexController: indexController,
                  ),
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildCompanyInfoView(),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfoView() {
    if (companyController.list.isEmpty) {
      return const Text("No company information available.");
    } else {
      final company = companyController.list[0];
      return Center(
        child: SizedBox(
          width: 365,
          child: Card(
            color: const Color(0xffFFFFFF),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildSectionTitle("COMPANY"),
                  _buildInfoText("Company: ${company.company}"),
                  _buildInfoText("Location: ${company.location}"),
                  _buildSectionTitle("EMPLOYEES"),
                  Column(
                    children: company.employees.map((e) => _buildEmployeeCard(e)).toList(),
                  ),
                  _buildSectionTitle("PRODUCTS"),
                  ...company.products.map((p) => _buildProductInfo(p)).toList(),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(text),
    );
  }

  Widget _buildEmployeeCard(Employee employee) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoText("Name: ${employee.name}"),
            _buildInfoText("Age: ${employee.age}"),
            _buildInfoText("Position: ${employee.position}"),
            _buildInfoText("Skill: ${employee.skill}"),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfo(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoText("Name: ${product.name}"),
        _buildInfoText("Price: ${product.price} \$"),
        _buildInfoText("InStock: ${product.inStock}"),
        const SizedBox(height: 10),
      ],
    );
  }
}
