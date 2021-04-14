//
//  Mission.swift
//  MoonShot-Project
//
//  Created by Jared Paubel on 4/14/21.
//  Copyright © 2021 IN185 BS. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
