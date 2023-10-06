//
//  ContentView.swift
//  Weather-SwiftUi
//
//  Created by HOMi3Verse on 05/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: 15){
                Text("Dakar, SN")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack{
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    Text("30°")
                        .font(.system(size: 70, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                Spacer()
                
                HStack(spacing: 20){
                    WeatheDayView(dayOfWeek: "TUE",
                                  imageName: "cloud.sun.fill",
                                  temperature: 29)
                    
                    WeatheDayView(dayOfWeek: "WED",
                                  imageName: "sun.max.fill",
                                  temperature: 36)
                    
                    WeatheDayView(dayOfWeek: "THU",
                                  imageName: "cloud.sun.fill",
                                  temperature: 30)
                    
                    WeatheDayView(dayOfWeek: "FRI",
                                  imageName: "cloud.sun.fill",
                                  temperature: 31)
                    
                    WeatheDayView(dayOfWeek: "SAT",
                                  imageName: "sunset.fill",
                                  temperature: 26)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatheDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing:5){
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
