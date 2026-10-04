// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
/**
 * EXPECTED OUTPUT:
 * Manager: John Smith (ID: M001, Department: IT, Team Size: 5)
 * Job Title: Manager
 * Base Salary: 8000.0
 * Calculated Salary: 9000.0
 * Payment processed: 9000.0
 * Report: Monthly report for John Smith in IT department
 * 
 * Developer: Alice Johnson (ID: D001, Department: IT, Language: Dart)
 * Job Title: Senior Developer
 * Base Salary: 6000.0
 * Calculated Salary: 6500.0
 * Payment processed: 6500.0
 */

// 1. Mixin Payable
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    return baseSalary + bonus;
  }

  void processPayment(double amount) {
    print("Payment processed: $amount");
  }
}

// 2. Abstract Class Employee
abstract class Employee {
  String name;
  String id;
  String department;
  double baseSalary;

  Employee(this.name, this.id, this.department, [this.baseSalary = 0.0]);

  void displayInfo();
  String getJobTitle();

  double getBaseSalary() {
    return baseSalary;
  }
}

// 3. Concrete Class Manager
class Manager extends Employee with Payable {
  int teamSize;

  Manager(String name, String id, String department, dynamic teamSizeOrLang, [double baseSalary = 8000.0])
      : teamSize = teamSizeOrLang is int ? teamSizeOrLang : (int.tryParse(teamSizeOrLang.toString()) ?? 5),
        super(name, id, department, baseSalary);

  @override
  void displayInfo() {
    print("Manager: $name (ID: $id, Department: $department, Team Size: $teamSize)");
  }

  @override
  String getJobTitle() => "Manager";

  String generateReport([String? reportName, String? reportDept]) {
    String n = reportName ?? name;
    String d = reportDept ?? department;
    String report = "Report: Monthly report for $n in $d department";
    print(report);
    return report;
  }
}

// 4. Concrete Class Developer
class Developer extends Employee with Payable {
  String programmingLanguage;

  Developer(String name, String id, String department, this.programmingLanguage, [double baseSalary = 6000.0])
      : super(name, id, department, baseSalary);

  @override
  void displayInfo() {
    print("Developer: $name (ID: $id, Department: $department, Language: $programmingLanguage)");
  }

  @override
  String getJobTitle() => "Senior Developer";
}

void main() {
  Manager manager = Manager("John Smith", "M001", "IT", 5, 8000.0);
  manager.displayInfo();
  print("Job Title: ${manager.getJobTitle()}");
  print("Base Salary: ${manager.getBaseSalary()}");
  double mSalary = manager.calculateSalary(manager.getBaseSalary(), 1000.0);
  print("Calculated Salary: $mSalary");
  manager.processPayment(mSalary);
  manager.generateReport();

  print("");

  Developer dev = Developer("Alice Johnson", "D001", "IT", "Dart", 6000.0);
  dev.displayInfo();
  print("Job Title: ${dev.getJobTitle()}");
  print("Base Salary: ${dev.getBaseSalary()}");
  double devSalary = dev.calculateSalary(dev.getBaseSalary(), 500.0);
  print("Calculated Salary: $devSalary");
  dev.processPayment(devSalary);
}