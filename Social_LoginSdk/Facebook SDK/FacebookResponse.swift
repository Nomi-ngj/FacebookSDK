//
//  FacebookResponse.swift
//  Social_LoginSdk
//
//  Created by Nouman Gul on 21/11/2020.
//

import Foundation

struct FacebookResponse : Codable {

        let email : String?
        let firstName : String?
        let gender : String?
        let id : String?
        let lastName : String?
        let name : String?

        enum CodingKeys: String, CodingKey {
                case email = "email"
                case firstName = "first_name"
                case gender = "gender"
                case id = "id"
                case lastName = "last_name"
                case name = "name"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                email = try values.decodeIfPresent(String.self, forKey: .email)
                firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
                gender = try values.decodeIfPresent(String.self, forKey: .gender)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
                name = try values.decodeIfPresent(String.self, forKey: .name)
        }

}
