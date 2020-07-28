//
//  RegistrationViewModel.swift
//  Registro
//
//  Created by Pedro Hamue on 17/07/20.
//  Copyright © 2020 Pedro Hamue. All rights reserved.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject{
    //Entrada de datos usuario
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    //Valores de validación del formulario
    @Published var usernameLenghtValid = false
    @Published var passwordLenghtValid = false
    @Published var passwordCapitalLetter = false
    @Published var passwordsMatch = false
    private var cancellableObjects:  Set<AnyCancellable> = []
    init(){
        $username
            .receive(on:RunLoop.main)
            .map{ username in
                return username.count >= 6
            }
                .assign(to: \.usernameLenghtValid, on:self)
        .store(in: &cancellableObjects)
    $password
        .receive(on: RunLoop.main)
        .map{ password in
            return password.count >= 8
        }
        .assign(to: \.passwordLenghtValid, on: self)
    .store(in: &cancellableObjects)
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                let pattern = "[A-Z]"
                if let _ = password.range(of: pattern, options: .regularExpression){
                   return true
                }else{
                    return false
                }
        }
        .assign(to: \.passwordCapitalLetter, on: self)
        .store(in: &cancellableObjects)
        Publishers.CombineLatest($password,$confirmPassword)
            .receive(on: RunLoop.main)
            .map{ (password,confirmPassword) in
                return !password.isEmpty && (password == confirmPassword)
        }
        .assign(to: \.passwordsMatch,on: self)
         .store(in: &cancellableObjects)
    }
    
    }

