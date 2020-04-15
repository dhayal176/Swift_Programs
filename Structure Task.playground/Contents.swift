/*Problem Statement: This program is to just work on structures.
                     update the student details in the struct.
                     Display the risult of students and top 3 ranked students.*/

import Foundation

struct Students {
    private let studentName: String, studentID: String, emailID: String
    private let physics: Int, chemistry: Int, maths: Int
    static var report = [Int]()
    init (name: String, id: String, email: String, physics: Int, chemistry: Int, maths: Int) {
        self.studentName = name
        self.studentID = id
        self.emailID = email
        self.physics = physics
        self.chemistry = chemistry
        self.maths = maths
    }
    func result() -> Bool {
        let marks  = [physics, chemistry, maths]
        let failMark = marks.filter {$0 <= 40 }
        if failMark != [] {
            return false
        } else {
            let total = marks.reduce(0, +)
            Students.report.append(total)
            return true
        }
    }
}
let studentDetails = ["Dhayal, 16CSA22, dhaylcuber@gmail.com, {physics: 60, chemistry: 70, maths: 80}",
                      "John, 16CSA23, aegon@gmail.com, {physics: 37, chemistry: 57, maths: 65}",
                      "Dany, 16CSA24, dany@gmail.com, {physics: 63, chemistry: 73, maths: 83}",
                      "Tyrion, 16CSA25, @gmail.com, {physics: 61, chemistry: 63, maths: 81}",
                      "Arya, 16CSA26, aryastark@gmail.com, {physics: 65, chemistry: 76, maths: 87}"]
for index in studentDetails {
    let tempArray = index.replacingOccurrences(of: "[,:{}]", with: "", options: .regularExpression, range: nil)
    let studentDetail = tempArray.split(separator: " ")
    let name = studentDetail[0], id = studentDetail[1]
    let email = studentDetail[2]
    let physics = studentDetail[4], chemistry = studentDetail[6]
    let maths = studentDetail[8]
    if email.contains("@") && email.contains(".") {
        let userName = email.split(separator: "@")
        let domain = email.split(separator: ".")
        if userName.count == 2 && domain.count == 2 {
            let student = Students(name: "\(name)", id: "\(id)", email: "\(email)", physics: Int(physics) ?? 0, chemistry: Int(chemistry) ?? 0, maths: Int(maths) ?? 0)
            let result = (student.result()) ? "Pass" : "Fail"
            print("\(name): \(result)")
        } else {
            print("Invalid email for \(name)")
        }
    } else {
        print("Invalid email for \(name)")
    }
}
Students.report.sort(by: >)
print("Top 3 Ranked Students")
for rank in 1...3 {
    print("Rank \(rank) is \(Students.report[rank - 1])")
}