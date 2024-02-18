//
//  main.swift
//  Labka3
//
//  Created by Nura on 18.02.2024.
//


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
            print("Имя: \(student.firstName) \(student.lastName), Средний балл: \(student.averageGrade)")
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

let журнал = StudentJournal()

журнал.addStudent(firstName: "Иван", lastName: "Иванов", averageGrade: 85.0)
журнал.addStudent(firstName: "Мария", lastName: "Сидорова", averageGrade: 92.5)
журнал.addStudent(firstName: "Алексей", lastName: "Петров", averageGrade: 78.3)

журнал.displayStudentsInfo()

let среднийБалл = журнал.findAverageScore()
print("Средний балл: \(среднийБалл)")

if let студентСНаивысшимСреднимБаллом = журнал.findStudentWithHighestGPA() {
    print("Студент с наивысшим средним баллом: \(студентСНаивысшимСреднимБаллом.firstName) \(студентСНаивысшимСреднимБаллом.lastName), Средний балл: \(студентСНаивысшимСреднимБаллом.averageGrade)")
}

журнал.removeStudent(firstName: "Иван", lastName: "Иванов")
журнал.displayStudentsInfo()
