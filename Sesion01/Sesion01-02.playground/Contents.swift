import UIKit

class Alumno {
    
    private var nombre  : String
    private var apellido: String
    public  var dni     : String
    
    public  var nombreCompleto: String {
        return "\(self.apellido), \(self.nombre)"
    }
    
    init(nombre: String, apellido: String, dni: String) {
        
        self.nombre     = nombre
        self.apellido   = apellido
        self.dni        = dni
    }
}

let objAlumno = Alumno(nombre: "Kenyi", apellido: "Rodriguez", dni: "87654321")
print("\(objAlumno.dni) - \(objAlumno.nombreCompleto)")

var arrayAlumnos = [Alumno]()
arrayAlumnos.append(Alumno(nombre: "Kenyi", apellido: "Rodriguez", dni: "87654321"))
arrayAlumnos.append(Alumno(nombre: "Aldair", apellido: "Revilla", dni: "76543218"))
arrayAlumnos.append(Alumno(nombre: "Ana", apellido: "Soto", dni: "65432187"))
arrayAlumnos.append(Alumno(nombre: "Beatriz", apellido: "Lazcano", dni: "54321876"))
arrayAlumnos.append(Alumno(nombre: "Franco", apellido: "Salcedo", dni: "43218765"))
arrayAlumnos.append(Alumno(nombre: "Jacobo", apellido: "Ramirez", dni: "32187654"))

/*
 for (int i = 0; i < arrayAlumnos.length; i++) { codigo }
 arrayAlumnos[i]
 */

print("\n****************************************")
for obj in arrayAlumnos {
    print("\(obj.dni) - \(obj.nombreCompleto)")
}

print("\n****************************************")
for i in 0..<arrayAlumnos.count {
    let obj = arrayAlumnos[i]
    print("\(i) \(obj.dni) - \(obj.nombreCompleto)")
}

print("\n****************************************")
arrayAlumnos.forEach { (obj) in
    print("\(obj.dni) - \(obj.nombreCompleto)")
}

