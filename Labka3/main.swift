import Foundation

// Определение структуры Student
struct Student {
    var firstName: String
    var lastName: String
    var averageGrade: Double
}

// Определение класса StudentJournal
class StudentJournal {
    var students: [Student] = []

    // Метод для добавления нового студента в журнал
    func addStudent(firstName: String, lastName: String, averageGrade: Double) {
        let newStudent = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
        students.append(newStudent)
    }

    // Метод для удаления студента из журнала по имени и фамилии
    func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }

    // Метод для отображения информации о всех студентах в журнале
    func displayStudentsInfo() {
        let sortedStudents = students.sorted { $0.averageGrade > $1.averageGrade }
        for student in sortedStudents {
            print("Name: \(student.firstName) \(student.lastName), Average Grade: \(student.averageGrade)")
        }
    }

    // Метод для нахождения среднего балла всех студентов в журнале
    func findAverageScore() -> Double {
        let totalScore = students.reduce(0.0) { $0 + $1.averageGrade }
        return totalScore / Double(students.count)
    }

    // Метод для нахождения студента с наивысшим средним баллом
    func findStudentWithHighestGPA() -> Student? {
        return students.max { $0.averageGrade < $1.averageGrade }
    }
}

// Пример использования
let journal = StudentJournal()

journal.addStudent(firstName: "John", lastName: "Doe", averageGrade: 85.0)
journal.addStudent(firstName: "Jane", lastName: "Smith", averageGrade: 92.5)
journal.addStudent(firstName: "Bob", lastName: "Johnson", averageGrade: 78.3)

journal.displayStudentsInfo()

let averageScore = journal.findAverageScore()
print("Average Score: \(averageScore)")

if let highestGPAStudent = journal.findStudentWithHighestGPA() {
    print("Student with highest GPA: \(highestGPAStudent.firstName) \(highestGPAStudent.lastName), GPA: \(highestGPAStudent.averageGrade)")
}

journal.removeStudent(firstName: "John", lastName: "Doe")
journal.displayStudentsInfo()
