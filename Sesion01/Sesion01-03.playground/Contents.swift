import UIKit

let json = ["name" : "Kenyi"]

var nombre: String? = json["nombre"]
print(nombre ?? "No tiene nombre")

func agregarAlumno(nombre: String, apellido: String) {
}


let txtNombre = UITextField()
let txtApellido = UITextField()


func clickBtnGuardar() {
    
    if txtNombre.text == nil {
        print("Ingresa un nombre para el alumno")
        return
    }
    
    if txtApellido.text == nil {
        print("Ingresa un apellido para el alumno")
        return
    }
}


//Guard let -> crea una variable segura en el contexto actual
//El return es obligatorio
func clickBtnGuardarGuardLet() {
    
    guard let nombreSeguro = txtNombre.text, nombreSeguro.count != 0 else {
        print("Ingresa un nombre para el alumno")
        return
    }
        
    guard let apellidoSeguro = txtApellido.text, apellidoSeguro.count != 0 else {
        print("Ingresa un apellido para el alumno")
        return
    }
    
    agregarAlumno(nombre: nombreSeguro, apellido: apellidoSeguro)
}

//if let -> crear una variable segura en un nuevo contexto
func clickBtnGuardIfLet1() {
    
    if let nombreSeguro = txtNombre.text, nombreSeguro.count != 0 {
        
        if let apellidoSeguro = txtApellido.text, apellidoSeguro.count != 0 {
            agregarAlumno(nombre: nombreSeguro, apellido: apellidoSeguro)
        }else{
            print("Ingresa un apellido para el alumno")
        }
        
    }else{
        print("Ingresa un nombre para el alumno")
    }
}

func clickBtnGuardIfLet2() {
    
    if let nombreSeguro = txtNombre.text, nombreSeguro.count != 0,
       let apellidoSeguro = txtApellido.text, apellidoSeguro.count != 0 {
        
        agregarAlumno(nombre: nombreSeguro, apellido: apellidoSeguro)
    }else{
        print("Alguno de los campos esta vacio")
    }
}


let txtNumero1 = UITextField()
txtNumero1.text = "20"
let txtNumero2 = UITextField()
txtNumero2.text = "5"

//NO RECOMENDADO
func clickBtnOperar() {
    
    if txtNumero1.text == nil && txtNumero1.text?.count == 0 {
        print("Ingrese primer número")
        return
    }
    
    if txtNumero2.text == nil && txtNumero2.text?.count == 0 {
        print("Ingrese segundo número")
        return
    }
    
    let n1 = Int(txtNumero1.text ?? "")
    let n2 = Int(txtNumero2.text ?? "")
    
    if n1 == nil {
        print("El primer número es incorrecto")
        return
    }
    
    if n2 == nil {
        print("El segundo número es incorrecto")
        return
    }
    
    let suma = (n1 ?? 0) + (n2 ?? 0)
    let resta = (n1 ?? 0) - (n2 ?? 0)
    let prod = (n1 ?? 0) * (n2 ?? 0)
    let div = (n1 ?? 0) / (n2 ?? 0)
    
    print("Suma: \(suma)\nResta: \(resta)\nProd: \(prod)\nDic: \(div)")
}

//RECOMENDADO
func clickBtnOperarGuardLet() {
    
    guard let n1TextoSeguro = txtNumero1.text, n1TextoSeguro.count != 0 else {
        print("Ingrese primer número")
        return
    }
    
    guard let n2TextoSeguro = txtNumero2.text, n2TextoSeguro.count != 0 else {
        print("Ingrese primer número")
        return
    }
    
    guard let n1Seguro = Int(n1TextoSeguro) else {
        print("El primer número es incorrecto")
        return
    }
    
    guard let n2Seguro = Int(n2TextoSeguro) else {
        print("El segundo número es incorrecto")
        return
    }
    
    let suma = n1Seguro + n2Seguro
    let resta = n1Seguro - n2Seguro
    let prod = n1Seguro * n2Seguro
    let div = n1Seguro / n2Seguro
    
    print("Suma: \(suma)\nResta: \(resta)\nProd: \(prod)\nDic: \(div)")
}

clickBtnOperarGuardLet()
