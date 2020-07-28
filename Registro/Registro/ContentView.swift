//
//  ContentView.swift
//  Registro
//
//  Created by Pedro Hamue on 17/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import SwiftUI

struct ContentView: View {

@ObservedObject private var registrationVM = RegistrationViewModel()
    var body: some View {
      
        VStack{
            Text("Crea una Cuenta")
                .font(.system(.largeTitle,design: .rounded))
                .bold()
                .padding(.bottom,50)
            
            SingleFormView(fieldName: "Nombre de Usuario",fieldValue: $registrationVM.username)
            ValidationFormView(iconName: registrationVM.usernameLenghtValid ? "checkmark.circle" : "xmark.circle",iconColor: registrationVM.usernameLenghtValid ? Color.green: Color.red, formText: "Mínimo 6 caracteres",conditionChecked: registrationVM.usernameLenghtValid)
                .padding()
            SingleFormView(fieldName: "Contraseña", fieldValue: $registrationVM.password, isProtected: true)
            VStack{
                ValidationFormView(iconName: registrationVM.passwordLenghtValid ? "checkmark.circle" : "xmark.circle",iconColor: registrationVM.passwordLenghtValid ? Color.green : Color.red,formText: "Mínimo 8 caracteres",conditionChecked: registrationVM.passwordLenghtValid)
                ValidationFormView(iconName: registrationVM.passwordCapitalLetter ? "checkmark.circle" : "xmark.circle",iconColor: registrationVM.passwordCapitalLetter ? Color.green : Color.red,formText: "Mínimo una Mayúscula",conditionChecked: registrationVM.passwordCapitalLetter)
                
            }.padding()
            SingleFormView(fieldName: "Confirmar Contraseña", fieldValue: $registrationVM.confirmPassword, isProtected: true)
            ValidationFormView(iconName: registrationVM.passwordsMatch ? "checkmark.circle" : "xmark.circle",iconColor: registrationVM.passwordsMatch ? Color.green : Color.red,formText: "Las dos contraseñas deben coincidir",conditionChecked: registrationVM.passwordsMatch)

                .padding()
                .padding(.bottom,30)
            Button(action: {
                
            }){
                Text("Registrarme")
                    .font(.system(.title,design:.rounded))
                    .bold()
                    .foregroundColor(.white)
                .padding()
                    .background(LinearGradient(gradient:Gradient(colors:[Color.red,Color.orange]),startPoint:.leading, endPoint:.trailing))
                .cornerRadius(10)
            }
            HStack{
                Text("¿Ya tienes una cuenta?")
                    .font(.system(.body,design: .rounded))
                .bold()
                Button(action: {

                }){
                    Text("Entra Ahora")
                        .font(.system(.headline))
                        .foregroundColor(Color.green)
                }
         
            }.padding()
            Spacer()
        }.padding()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct SingleFormView: View{
    var fieldName = ""
    @Binding var fieldValue: String
    var isProtected = false
    
    var body: some View{
        VStack{
            if isProtected{
                SecureField(fieldName,text:$fieldValue)
                               .font(.system(size:18,weight:.bold,design: .rounded))
                               .padding(.horizontal)
            }else{
                TextField(fieldName, text: $fieldValue)
                .font(.system(size:18,weight:.bold,design: .rounded))
                .padding(.horizontal)
            }
            Divider()
                .frame(height:1)
                .background(Color.gray)
                .padding(.horizontal)
        }

}
        
}
struct ValidationFormView: View{
    var iconName = "xmark.circle"
    var iconColor = Color(red: 0.9,green: 0.5,blue: 0.5)
    var formText = ""
    var conditionChecked = false
    var body: some View{
        HStack{
            Image(systemName:iconName)
                .foregroundColor(iconColor)
            Text(formText)
                .font(.system(.body,design: .rounded))
                .foregroundColor(.gray)
                .strikethrough(conditionChecked)
            Spacer()
        }
    }
}
}
