//
//  ContentView.swift
//  NSVeggieTracker
//
//  Created by Jamar Gibbs on 4/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var veggieCount = 0
    @State private var isShowingSheet = false
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Veggie Tracker")
                .font(.title)
                .bold()
                .foregroundColor(.gray)
            ZStack {
            
                VStack {
                
                    Rectangle()
                        .overlay(LinearGradient(gradient: Gradient(colors: [.purple, .blue, .white]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(40)
                        .shadow(color: .gray, radius: 10, x: 1.0, y: -2.0)
                        .frame(width: 400, height: 250, alignment: .center)
                }
                
                HStack {
                    VStack {
                        Text("Current")
                            .foregroundColor(.gray)
                            .font(.title)
                            .bold()
                            .padding(4)
                        
                        Text(String(veggieCount))
                            .font(.title)
                            .bold()
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.5))
                            .clipShape(Circle())
                    }
                  
                    VStack {
                        Text("Goal")
                            .foregroundColor(.gray)
                            .font(.title)
                            .bold()
                            .padding(4)
                        
                        Text("4")
                            .font(.title)
                            .bold()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.5))
                            .clipShape(Capsule())
                    }
                }
            }
            Spacer()
            
            Button(action: addVeggies, label: {
                Text("Add Veggies")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
                    .shadow(radius: 15)
            })
            
            .alert(isPresented: $isShowingSheet) {
                        Alert(title: Text("Congrats!"), message: Text("You ate all your Veggies today!! 🎉"), dismissButton: .default(Text("Nice!")))
                    }
        }
    }
    
    private func addVeggies() {
        veggieCount += 1
        checkSheet()
    }
    
    private func checkSheet() {
        if veggieCount >= 4 {
            isShowingSheet = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





// Zstack circle example
// add to the view's body

//ZStack {
//    Circle()
//        .foregroundColor(.blue)
//        .offset(x: -100)
//    Circle()
//        .foregroundColor(.purple)
//        .offset(x: -40)
//    Circle()
//        .foregroundColor(.orange)
//        .offset(x: 20)
//    Circle()
//        .foregroundColor(.yellow)
//        .offset(x: 60)
//}
//.frame(width: 400, height: 200, alignment: .center)
