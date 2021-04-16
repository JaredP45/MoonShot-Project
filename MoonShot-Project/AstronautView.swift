//
//  AstronautView.swift
//  MoonShot-Project
//
//  Created by Jared Paubel on 4/14/21.
//  Copyright © 2021 IN185 BS. All rights reserved.
//

import SwiftUI



struct AstronautView: View {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronaut: Astronaut
    
    var astronautMissions: [String] {
        var temp = [String]()
        for mission in missions {
            for crew in mission.crew {
                if astronaut.id == crew.name {
                    temp.append(mission.displayName)
                }
            }
        }
        return temp
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text("Missions Participated in:")
                        .font(.headline)
                    ForEach(self.astronautMissions, id:\.self) { mission in
                        Text(mission)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.blue)
                    }
                    
                    Text(self.astronaut.description)
                        .padding()
                    .layoutPriority(1)
                    
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
