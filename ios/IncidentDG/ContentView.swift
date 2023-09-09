//
//  ContentView.swift
//  IncidentDG
//
//  Created by Randy Fong on 9/9/23.
//

import SwiftUI
import SwiftUIGIF

struct ContentView: View {
    // MARK: State
    @State private var drawings = [Drawing]()
    @State private var prompt: String = ""
    @State private var showIcons = false
    @State private var location1 = originPoint
    @State private var location2 = originPoint
    @State private var location3 = originPoint
    
    @State private var giftImages = [GifImage]()
    
    // MARK: Constant
    let imageFrameHeight: CGFloat = 80
    static let originPoint = CGPoint(x: 50, y: 50)
    
    // MARK: Network
    let gifNetwork = GifNetwork()

    // MARK: Gestures
    var simpleDrag1: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location1 = value.location
            }
    }
    var simpleDrag2: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location2 = value.location
            }
    }
    var simpleDrag3: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location3 = value.location
            }
    }
    
    // MARK: Body
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Enter prompt", text: $prompt, axis: .vertical)
                        .frame(width: 300, height: 100, alignment: .top)
                    HStack {
                        Button("Send") {
                            print("Prompt Sent")
                            Task {
                                showIcons = false
                                let images = await gifNetwork.loadDataAndImages(prompt)
                                await MainActor.run {
                                    giftImages = images
                                    showIcons = true
                                }
                            }
                        }
                        Spacer()
                        Button("Reset") {
                            withAnimation {
                                prompt = ""
                                drawings = [Drawing]()
                                location1 = ContentView.originPoint
                                location2 = ContentView.originPoint
                                location3 = ContentView.originPoint
                            }
                        }
                    }
                    .frame(height: 20)
                }
                Section {
                    VStack {
                        ZStack(alignment: .top) {

                            DrawingPad(drawings: $drawings)
                                .offset(x: 0, y: 100)
                                .frame(height: 400)
                            HStack(alignment: .center) {
                                if showIcons && giftImages.count == 3 {
                                    GIFImage(data: giftImages[0].animatedGif)
                                        .foregroundColor(.pink)
                                        .frame(width: imageFrameHeight, height: imageFrameHeight)
                                        .position(location1)
                                        .gesture(
                                            simpleDrag1
                                        )
                                    GIFImage(data: giftImages[1].animatedGif)
                                        .foregroundColor(.blue)
                                        .frame(width: imageFrameHeight, height: imageFrameHeight)
                                        .position(location2)
                                        .gesture(
                                            simpleDrag2
                                        )
                                    GIFImage(data: giftImages[2].animatedGif)
                                        .foregroundColor(.green)
                                        .frame(width: imageFrameHeight, height: imageFrameHeight)
                                        .position(location3)
                                        .gesture(
                                            simpleDrag3
                                        )
   
//                                    GIFImage(name: "carBlue")
//                                        .foregroundColor(.pink)
//                                        .frame(width: imageFrameHeight, height: imageFrameHeight)
//                                        .position(location1)
//                                        .gesture(
//                                            simpleDrag1
//                                        )
//                                    GIFImage(name: "carRed")
//                                        .foregroundColor(.blue)
//                                        .frame(width: imageFrameHeight, height: imageFrameHeight)
//                                        .position(location2)
//                                        .gesture(
//                                            simpleDrag2
//                                        )
//                                    GIFImage(name: "dog") // load from assets
//                                        .foregroundColor(.green)
//                                        .frame(width: imageFrameHeight, height: imageFrameHeight)
//                                        .position(location3)
//                                        .gesture(
//                                            simpleDrag3
//                                        )
                                }
                            } // HStack
//                            .frame(height: imageFrameHeight)
                        } // ZStack
                        Spacer()
                    }  // VStack
                } // Section
                .frame(height: 500)
            }   // Form
        } // VStack
    } // Body
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
