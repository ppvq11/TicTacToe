//
//  SplashScreenView.swift
//  TicTacToe
//
//  Created by Muna Aiman Al-hajj on 15/11/1445 AH.
//

import SwiftUI


struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            PlayerEntryView()
        } else {
            ZStack {
                Color.appcolor
                    .edgesIgnoringSafeArea(.all)  // Make the background cover the entire screen

                VStack {
                    Image("Logo")  // Ensure this image is added to your asset catalog
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
//
//                    Text("")
//                        .font(.largeTitle)
//                        .foregroundColor(.white)  // Set text color to white for better contrast
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    SplashScreenView()
}
