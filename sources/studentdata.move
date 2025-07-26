/*
/// Module: studentdata
module studentdata::studentdata;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module studentdata::StudentData{
    use sui::object::{Self, UID};
    use sui::string;
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use std::vector::push_back;

    public struct Student has key, store {
        id: UID,
        name: string::String,
        age: u32,
    }
    private Student[] students;
    fun init(){
        students = vector::empty<Student>();
    }
    public entry fun createStudent(studentName: string::String, studentAge: u32, &mut ctx: TxContext) {
        let newStudent = Student {
            id: sui::object::new(ctx),
            studentName,
            studentAge
        };
        transfer::transfer(student,tx_context::sender(ctx));
        students = vector::push_back(students, newStudent);
    }
    public fun getStudentById(id: UID): UID {
        for (student in &students) {
            if (student.id == id) {
                return student.id;
            }
        }
    }
}
