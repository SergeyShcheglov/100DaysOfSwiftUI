//
//  ContentView.swift
//  Drawing
//
//  Created by Sergey Shcheglov on 25.01.2022.
//

import SwiftUI

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}
struct ContentView: View {
    @State private var rows = 4
    @State private var columns = 4
    @State private var checkboardView = false
    @State private var arrowView = false
    @State private var rectangleView = false
    @State private var spirographView = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button("Checkboard") {
                        checkboardView.toggle()
                        arrowView = false
                        rectangleView = false
                        spirographView = false
                    }
                    Button("Arrow") {
                        arrowView.toggle()
                        checkboardView = false
                        rectangleView = false
                        spirographView = false
                    }
                    Button("Rectangle") {
                        rectangleView.toggle()
                        arrowView = false
                        checkboardView = false
                        spirographView = false
                    }
                    Button("Spirograph") {
                        spirographView.toggle()
                        arrowView = false
                        rectangleView = false
                        checkboardView = false
                    }
                }
                
            //some code with if conditions to switch views
                
            Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = 8
                    columns = 16
                }
            }
        }
            .navigationTitle("Drawing")
            .sheet(isPresented: $checkboardView) {
                ContentView()
            }
            .sheet(isPresented: $arrowView) {
                ArrowView()
            }
            .sheet(isPresented: $rectangleView) {
                RectangleView()
            }
            .sheet(isPresented: $spirographView) {
                SpirographView()
            }
            
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                Button {
//                    changeView.toggle()
//                } label: {
//                    Image(systemName: "switch.2")
//                    Text("tap")
//                }
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        RectangleView()
//                    } label: {
//                        Image(systemName: "r.circle")
//
//                    }
//                }
//            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
