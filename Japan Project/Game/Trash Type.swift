//
//  Trash Type.swift
//  Japan Project
//
//  Created by Vasapol on 10/2/2565 BE.
//

import Foundation

struct TrashN: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case Picture_Name
        case Trash_Color
    }
    
    var id = UUID()
    var name: String
    var Picture_Name: String
    var Trash_Color: String
    
}

