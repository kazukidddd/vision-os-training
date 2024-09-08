//
//  ContentView.swift
//  Chapter3
//
//  Created by 木村和貴 on 2024/09/08.
//

import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
  let omikuji = Omikuji()
  @State var isRunning = false
  @State var angle = 0.0
  @State var opacity = 1.0

  var body: some View {
    VStack {
      //            タイトルテキストを追加
      Text("おみくじアプリ").padding().font(.largeTitle)
      ZStack {
        Image("omikuji_box")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 200)
          .rotationEffect(.degrees(angle))
          .opacity(opacity)
        Image(omikuji.result())
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 200)
          .background(omikuji.resultColor())
          .clipShape(Circle())
          .opacity(1.0 - opacity)
      }
      HStack {
        Button("おみくじを引く") {
          isRunning = true
          omikuji.select()
          withAnimation {
            angle = 180
          } completion: {
            withAnimation {
              opacity = 0
            }
          }
        }.disabled(isRunning)
        Button("もう一回") {
          isRunning = false
          angle = 0
          opacity = 1.0
        }.disabled(!isRunning)

      }.padding()

    }
    .padding()
  }
}

#Preview(windowStyle: .automatic) {
  ContentView()
}
