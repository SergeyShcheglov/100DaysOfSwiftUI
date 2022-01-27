//
//  ArrowView.swift
//  Drawing
//
//  Created by Sergey Shcheglov on 27.01.2022.
//

import SwiftUI

struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
    
}

struct ArrowView: View {
    @State private var thicknessAmount = 50.0
    var body: some View {
        Arrow()
            .stroke(Color.green, lineWidth: thicknessAmount)
            .onTapGesture {
                withAnimation {
                    thicknessAmount = Double.random(in: 1...100)
                }
            }

            
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
