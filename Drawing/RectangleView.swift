//
//  RectangleView.swift
//  Drawing
//
//  Created by Sergey Shcheglov on 27.01.2022.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var startPoint = UnitPoint(x: 0.5, y: 0.0)
    var endPoint = UnitPoint(x: 0.5, y: 1.0)
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: startPoint,
                            endPoint: endPoint
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}



struct RectangleView: View {
    @State private var colorCycle = 0.0
    @State private var startPointX = 0.5
    @State private var startPointY = 0.0
    @State private var endPointX = 0.5
    @State private var endPointY = 1.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle, startPoint: UnitPoint(x: startPointX, y: startPointY), endPoint: UnitPoint(x: endPointX, y: endPointY))
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
            
            VStack {
                Text("Linear Gradient")
                    .font(.title3)
                    .padding(.top, 10)
                
                HStack(spacing: 30) {
                    VStack {
                        Text("Start point")
                            .font(.headline)
                        
                        HStack {
                            Text("X")
                            Slider(value: $startPointX)
                        }
                        
                        HStack {
                            Text("Y")
                            Slider(value: $startPointY)
                        }
                    }
                    
                    VStack {
                        Text("End point")
                            .font(.headline)
                        
                        HStack {
                            Text("X")
                            Slider(value: $endPointX)
                        }
                        
                        HStack {
                            Text("Y")
                            Slider(value: $endPointY)
                        }
                    }
                }
            }
        }
    }
}
    struct RectangleView_Previews: PreviewProvider {
        static var previews: some View {
            RectangleView()
        }
    }

