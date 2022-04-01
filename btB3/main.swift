//
//  main.swift
//  btB3
//
//  Created by Nguyễn Anh Tú on 29/03/2022.
//

import Foundation


/**
 Viết chương trình quản lý lớp học, quản lý sinh viên.
 Mỗi lớp học có các thuộc tính: id, tên lớp, tên GVCN, danh sách sinh viên (mảng sinh viên)
 Mỗi đối tượng sinh viên có các thuộc tính: id, tên, giới tính, tuổi, điểm toán, điểm văn, điểm anh, điểm trung bình và học lực.

 Các chức năng::

 Thêm sinh viên
 Cập nhật thông tin sinh viên theo ID
 Xoá sinh viên theo ID
 Tìm kiếm sinh viên theo tên
 Sắp xếp sinh viên theo điểm trung bình
 Hiển thị danh sách sinh viên
 */

struct Student {
    var idStudent: String
    var nameStudent: String
    var genderStudent: String
    var ageStudent: Int?
    var math: Float?
    var literature: Float?
    var english: Float?
    var average: Float?
//    {
//        get {
//            return ((math ?? 0) + (literature ?? 0) + (english ?? 0)) / 3
//        }
//    }
    var rank: String?
//    {
//        get {
//            if average ?? 0 < 4 {
//                return "Học lực kém"
//            } else if average ?? 0 < 5{
//                return "Học lực yếu"
//            } else if average ?? 0 <= 5.4 {
//                return "Học lực trung bình yếu"
//            } else if average ?? 0 <= 6.4 {
//                return "Học lực trung bình"
//            } else if average ?? 0 <= 6.9 {
//                return "Học lực trung bình khá"
//            } else if average ?? 0 <= 7.9 {
//                return "Học lực khá"
//            } else if average ?? 0 <= 8.4 {
//                return "Học lực khá giỏi"
//            } else if average ?? 0 <= 10 {
//                return "Học lực giỏi"
//            } else {
//               return "Điểm trung bình không hợp lệ"
//            }
//        }
//    }
    
    init(idStudent: String, nameStudent: String, genderStudent: String, ageStudent: Int, math: Float, literature: Float, english: Float) {
        self.idStudent = idStudent
        self.nameStudent = nameStudent
        self.genderStudent = genderStudent
        self.ageStudent = ageStudent
        self.math = math
        self.literature = literature
        self.english = english
        averageStudent()
        rankStudent()
    }
    
    mutating func averageStudent() {
        average = ((math ?? 0) + (literature ?? 0) + (english ?? 0)) / 3
    }
    
    mutating func rankStudent() {
        if average ?? 0 < 4 {
            rank = "Học lực kém"
        } else if average ?? 0 < 5{
            rank = "Học lực yếu"
        } else if average ?? 0 <= 5.4 {
            rank = "Học lực trung bình yếu"
        } else if average ?? 0 <= 6.4 {
            rank = "Học lực trung bình"
        } else if average ?? 0 <= 6.9 {
            rank = "Học lực trung bình khá"
        } else if average ?? 0 <= 7.9 {
            rank = "Học lực khá"
        } else if average ?? 0 <= 8.4 {
            rank = "Học lực khá giỏi"
        } else if average ?? 0 <= 10 {
            rank = "Học lực giỏi"
        } else {
           print("Điểm trung bình không hợp lệ")
        }
    }
}

struct Class {
    var idClass: String
    var nameClass: String
    var nameTeacher: String?
    var students: [Student]?
    
    init(idClass: String, nameClass: String, nameTeacher: String, students: [Student]){
        self.idClass = idClass
        self.nameClass = nameClass
        self.nameTeacher = nameTeacher
        self.students = students
    }
    
    mutating func addStudent() {
        print("Nhập id sinh viên cần thêm: ", terminator:  " ")
        let idStudent = readLine() ?? ""
        print("Nhập tên sinh viên cần thêm: ", terminator: " ")
        let nameStudent = readLine() ?? ""
        print("Nhập giới tính sinh viên: ", terminator: " ")
        let genderStudent = readLine() ?? ""
        print("Nhập tuổi sinh viên: ", terminator: " ")
        let ageStudent = Int(readLine() ?? "") ?? 0
        print("Nhập điểm toán: ", terminator: " ")
        let mathStudent = Float(readLine() ?? "") ?? 0
        print("Nhập điểm văn: ", terminator: " ")
        let literatureStudent = Float(readLine() ?? "") ?? 0
        print("Nhập điểm anh: ", terminator: " ")
        let englishStudent = Float(readLine() ?? "") ?? 0
        
        let sv = Student(idStudent: idStudent, nameStudent: nameStudent, genderStudent: genderStudent, ageStudent: ageStudent, math: mathStudent, literature: literatureStudent, english: englishStudent)
        students?.append(sv)
    }
    
    mutating func updateStudent() {
        print("Nhập id sinh viên cần cập nhật thông tin: ", terminator: " ")
        let idStudent = readLine() ?? ""
        for i in 0..<(students?.count ?? 0) {
            if students?[i].idStudent == idStudent {
                print("Sửa tên sinh viên: ", terminator: " ")
                let nameStudent = readLine() ?? ""
                print("Sửa giới tính sinh viên: ", terminator: " ")
                let genderStudent = readLine() ?? ""
                print("Sửa tuổi sinh viên: ", terminator: " ")
                let ageStudent = Int(readLine() ?? "") ?? 0
                print("Sửa điểm toán: ", terminator: " ")
                let mathStudent = Float(readLine() ?? "") ?? 0
                print("Sửa điểm văn: ", terminator: " ")
                let literatureStudent = Float(readLine() ?? "") ?? 0
                print("Sửa điểm anh: ", terminator: " ")
                let englishStudent = Float(readLine() ?? "") ?? 0
                
                students?[i] = Student(idStudent: idStudent, nameStudent: nameStudent, genderStudent: genderStudent, ageStudent: ageStudent, math: mathStudent, literature: literatureStudent, english: englishStudent)
                
                print("Cập nhật thông tin sinh viên thành công!")
                print("Thông sin sau khi cập nhật là: \(students?[i] as Any)")
            } else {
                print("Danh sách sinh viên trống")
            }
        }
    }
    
    mutating func delStudent() {
        print("Nhập id sinh viên cần xoá: ", terminator: " ")
        let idStudent = readLine() ?? ""
        for i in 0..<(students?.count ?? 0) {
            if students?[i].idStudent == idStudent {
                students?.remove(at: i)
                break
            } else {
                print("Danh sách sinh viên trống")
            }
        }
    }
    
    func findStudent() {
        print("Nhập tên sinh viên cần tìm: ", terminator: " ")
        let nameStudent = readLine() ?? ""
        for i in 0..<(students?.count ?? 0) {
            if students?[i].nameStudent == nameStudent {
                print("Thông tin sinh viên cần tìm kiếm là: ")
                print(students?[i] as Any)
            } else {
                print("Danh sách sinh viên trống")
            }
        }
    }
    
    func sortStudent() {
        let sortStudent = students?.sorted(by: {
            sv1, sv2 in sv1.average ?? 0 < sv2.average ?? 0
            })
        print("Danh sách sinh viên sau khi sắp xếp: ")
        print(sortStudent ?? [])
        }
    
    func printStudent() {
        print(students ?? [])
    }
}

print("Chương trình quản lý lớp học")
print("Nhập id lớp học: ", terminator: " ")
var idClass = readLine() ?? ""
print("Nhập tên lớp học: ", terminator: " ")
var nameClass = readLine() ?? ""
print("Nhập GVCN lớp học: ", terminator: " ")
var nameTeacher = readLine() ?? ""

print("Nhập số lượng sinh viên: ", terminator: " ")
var numberStudent = Int(readLine() ?? "") ?? 0

var Clas = Class(idClass: idClass, nameClass: nameClass, nameTeacher: nameTeacher, students: [])

for _ in 0..<numberStudent {
    Clas.addStudent()
}


print("Chọn chức năng: ")
print("1 - Thêm sinh viên")
print("2 - Cập nhật thông tin sinh viên theo ID")
print("3 - Xoá sinh viên theo ID")
print("4 - Tìm kiếm sinh viên theo tên")
print("5 - Sắp xếp sinh viên theo điểm trung bình")
print("6 - Hiển thị danh sách sinh viên")

var chon: Int = 0

while (chon < 1 || chon > 6) {
    chon = Int(readLine() ?? "") ?? 0
}

    switch chon {
    case 1:
        Clas.addStudent()
        print("Thêm sinh viên thành công!")
        print("Danh sách sinh viên là: ")
        Clas.printStudent()
        
    case 2:
        Clas.updateStudent()
        
    case 3:
        Clas.delStudent()
        print("Danh sách sinh viên sau khi xoá")
        Clas.printStudent()
        
    case 4:
        Clas.findStudent()
        
    case 5:
        Clas.sortStudent()
        
    case 6:
        Clas.printStudent()
    default:
        print("Vui lòng nhập số từ 1 đến 6")
    }
