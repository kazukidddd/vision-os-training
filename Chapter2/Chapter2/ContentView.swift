//
//  ContentView.swift
//  Chapter2
//
//  Created by 木村和貴 on 2024/09/08.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            RealityView{ content in
//                3Dモデルを読み込んでEntityに設定
                let model = try! await Entity(named: "Scene",
                                              in: realityKitContentBundle)
                
//                読み込んだ3Dモデルを登録
                content.add(model)
            }
                .padding(.bottom, 50)

            Text("Hello, world!")
            Button("click") {
                print("click!!")
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
