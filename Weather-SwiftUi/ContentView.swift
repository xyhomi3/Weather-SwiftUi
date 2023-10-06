//
//  ContentView.swift
//  Weather-SwiftUi
//
//  Created by HOMi3Verse on 05/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Dakar, SN")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 30)
                
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
                
                Button{
                    isNight.toggle()
                } label:{
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backGroundColor: .white)
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

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180 )
            Text("\(temperature)°")
                .font(.system(size: 81, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backGroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backGroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

