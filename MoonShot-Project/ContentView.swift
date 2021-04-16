//
//  ContentView.swift
//  MoonShot-Project
//
//  Created by Jared Paubel on 4/14/21.
//  Copyright © 2021 IN185 BS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showLaunchDate = false
    
        var body: some View {
            NavigationView {
                List(missions) { mission in
                    
                    NavigationLink(
                        destination: MissionView(mission: mission, astronauts: self.astronauts),
                        label: {
                        
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                            
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                
                                Text(self.showLaunchDate ? mission.formattedLaunchDate: self.crewNames(actualMission: mission))
                            }
                        })
                }
                .navigationBarTitle("MoonShot")
                .navigationBarItems(trailing: Button(
                    action: { self.showLaunchDate.toggle()
                    }, label: {
                        Text(showLaunchDate ? "Crew" : "Dates")
                }))
        }
    }
    
    func crewNames(actualMission: Mission) -> String {
        var temp = [String]()
        for crewName in actualMission.crew {
            temp.append(crewName.name.capitalized)
        }
        return temp.joined(separator: ", ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
