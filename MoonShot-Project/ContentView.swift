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
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: Text("Detail View")) {
                    Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
        .navigationBarTitle("MoonShot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
