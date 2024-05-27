class CompanyController {
  List<Company> list = [];

  Future<void> getProducts() async {
    await Future.delayed(Duration(seconds: 2));

    list.add(Company(
      company: 'Tech Co.',
      location: 'Silicon Valley',
      employees: [
        Employee(name: 'John Doe', age: 30, position: 'Developer', skill: 'Flutter'),
        Employee(name: 'Jane Smith', age: 25, position: 'Designer', skill: 'UI/UX'),
      ],
      products: [
        Product(name: 'Product A', price: 99.99, inStock: true),
        Product(name: 'Product B', price: 149.99, inStock: false),
      ],
    ));
  }

  void addEmployee(Employee employee) {
    list[0].employees.add(employee);
  }

  void editEmployee(int index, Employee employee) {
    list[0].employees[index] = employee;
  }

  void removeEmployee(int index) {
    list[0].employees.removeAt(index);
  }

  void addProduct(Product product) {
    list[0].products.add(product);
  }

  void editProduct(int index, Product product) {
    list[0].products[index] = product;
  }

  void removeProduct(int index) {
    list[0].products.removeAt(index);
  }
}


class Company {
  final String company;
  final String location;
  final List<Employee> employees;
  final List<Product> products;

  Company({required this.company, required this.location, required this.employees, required this.products});
}

class Employee {
  final String name;
  final int age;
  final String position;
  final String skill;

  Employee({required this.name, required this.age, required this.position, required this.skill});
}

class Product {
  final String name;
  final double price;
  final bool inStock;

  Product({required this.name, required this.price, required this.inStock});
}
