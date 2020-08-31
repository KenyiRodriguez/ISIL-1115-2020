import Foundation
import UIKit

var edad = 18
let dni = "87654321"

let nombre: String = "Kenyi"

let precio1: CGFloat = 2.5
let precio2: Double = 3.5
let precioFinal: Double = Double(precio1) + precio2

let nombreAlumno = "Kenyi"
let apellidoAlumno = "Rodriguez"

let nombreCompleto1 = nombreAlumno + apellidoAlumno
print(nombreCompleto1)

let nombreCompleto2 = nombreAlumno + " " + apellidoAlumno
print(nombreCompleto2)

print("***************************")

let nombreCompleto3 = "Nombre: \(nombreAlumno)\nApellido: \(apellidoAlumno)\nEdad: \(edad)"
print(nombreCompleto3)

/*
 function sumar(n1, n2) {
    return n1 + n2
 }
 sumar(2, 5)
 
 function agregar(nombre, apellido, dni) {
    //CODIGO
 }
 agregar("Steven", "Laura", "87654321")
 */

/*
func nombreFuncion(desc variable: tipoDato, desc variable: tipoDato...) -> tipoDato { codigo }
 desc -> descripción previa de la variable ( un texto o un _ o un espacio vacio)
 */


//NO RECOMENDADO
func agregarPersona(_ nombre: String, _ apellido: String, _ dni: String) {
}
agregarPersona("Kenyi", "Rodriguez", "87654321")


//RECOMENDADO *****
func agregarPersona(nombre: String, apellido: String, dni: String) {
}
agregarPersona(nombre: "Kenyi", apellido: "Rodriguez", dni: "98765432")


//RECOMENDADO
func agregarPersonaConNombre(_ nombre: String, conApellido apellido: String, conDni dni: String) {
}
agregarPersonaConNombre("Kenyi", conApellido: "Rodriguez", conDni: "87654321")


//RECOMENDADO
func agregarPersona(conNombre nombre: String, conApellido apellido: String, conDni dni: String) {
}
agregarPersona(conNombre: "Kenyi", conApellido: "Rodriguez", conDni: "87654321")


//RECOMENDADO
func agregarPersonaConNombre(_ nombre: String, apellido: String, dni: String) {
}
agregarPersonaConNombre("Kenyi", apellido: "Rodriguez", dni: "87654321")
