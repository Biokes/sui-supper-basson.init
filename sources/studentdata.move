module studentdata::StudentData{
    use sui::object::UID;
    use sui::transfer;
    use std::vector::push_back;

    public struct Student has key, store {
        id: UID,
        name: string::String,
        age: u32,
    }
    public struct StudentBook has key, store {
        id: UID,
        students: vector<Student>,
    }

    fun init(){
        let book = StudentBook {
            id: object::new(ctx),
            students: vector::empty<Student>(),
        };
        transfer::transfer(book, tx_context::sender(ctx));
    }

    public entry fun createStudent(studentName: string::String, studentAge: u32, &mut ctx: TxContext) {
        let newStudent = Student{
            id: sui::object::new(ctx),
            studentName,
            studentAge
        };
        transfer::transfer(student,tx_context::sender(ctx));
        students = vector::push_back(students, newStudent);
    }
    public entry fun create_student(book: &mut StudentBook, name: string::String, age: u32, ctx: &mut TxContext) {
        let student = Student {
            id: object::new(ctx),
            name,
            age,
        };
        vector::push_back(&mut book.students, student);
    }


    public entry fun getStudentById(id: UID): UID {
        let mut counter = 0;
        while (counter< vector::length(&student.struct)) {
            if (student.id == id) {
                return student.id;
            }
            counter = counter + 1;
        }
    }
}
