//
//  ContentView.swift
//  CustomShapesExamples
//
//  Created by Joyce Tao on 2022-11-17.
//

import SwiftUI

struct Diagonal: Shape {
    func path(in rect: CGRect) -> Path {
        
        // The path that describes the shape
        var path = Path()
        
        // Here is where we'd describe the shape...
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Send back (return) the path that describes the shape
        return path
        
    }
    
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 0))
        
        return path
        
    }

}

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path ()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY/3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY / 3))
        path.addLine(to: CGPoint(x: rect.midX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY / 3 * 2))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY / 3 * 2))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY / 3))
        
        return path
    }
    
}

struct OlympicRings: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        for i in 0...4 {
            if i <= 2 {
                path.addEllipse(in: CGRect(x: 50 + i * 170, y: 50, width: 150, height: 150))
            } else {
                path.addEllipse(in: CGRect(x: 135 + (i - 3) * 170, y: 135, width: 150, height: 150))
            }
        }
        
        return path
        
    }
    
}

struct StarPattern: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path ()
        
        let gridXCoordinate = rect.maxX / 4
        let gridYCoordinate = rect.maxY / 4
        
        path.move(to: CGPoint(x: gridXCoordinate, y: gridYCoordinate))
        // MARK: Top Pieces
        // First piece (from left)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: gridXCoordinate, y: gridYCoordinate * 2))
        path.addLine(to: CGPoint(x: 0, y: gridYCoordinate))
        path.addLine(to: CGPoint(x: gridXCoordinate, y: gridYCoordinate))
        // Second piece
        path.addLine(to: CGPoint(x: gridXCoordinate, y: 0))
        path.addLine(to: CGPoint(x: gridXCoordinate * 2, y: gridYCoordinate))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        // Third piece
        path.move(to: CGPoint(x: gridXCoordinate * 2, y: gridYCoordinate))
        path.addLine(to: CGPoint(x: gridXCoordinate * 3, y: 0))
        path.addLine(to: CGPoint(x: gridXCoordinate * 3, y: gridYCoordinate))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        // Fourth piece
        path.move(to: CGPoint(x: gridXCoordinate * 3, y: gridYCoordinate))
        path.addLine(to: CGPoint(x: rect.maxX, y: gridYCoordinate))
        path.addLine(to: CGPoint(x: gridXCoordinate * 3, y: gridYCoordinate * 2))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        // MARK: Bottom Pieces
        // First piece (from right)
        path.move(to: CGPoint(x: gridXCoordinate * 3, y: gridYCoordinate * 2))
        path.addLine(to: CGPoint(x: rect.maxX, y: gridYCoordinate * 3))
        path.addLine(to: CGPoint(x: gridXCoordinate * 3, y: gridYCoordinate * 3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        // Second piece
        path.move(to: CGPoint(x: gridXCoordinate * 3, y: gridYCoordinate * 3))
        path.addLine(to: CGPoint(x: gridXCoordinate * 3, y: rect.maxY))
        path.addLine(to: CGPoint(x: gridXCoordinate * 2, y: gridYCoordinate * 3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        // Third piece
        path.move(to: CGPoint(x: gridXCoordinate * 2, y: gridYCoordinate * 3))
        path.addLine(to: CGPoint(x: gridXCoordinate, y: rect.maxY))
        path.addLine(to: CGPoint(x: gridXCoordinate, y: gridYCoordinate * 3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        // Fourth piece
        path.move(to: CGPoint(x: gridXCoordinate, y: gridYCoordinate * 3))
        path.addLine(to: CGPoint(x: 0, y: gridYCoordinate * 3))
        path.addLine(to: CGPoint(x: gridXCoordinate, y: gridYCoordinate * 2))
        
        return path
        
    }
    
}

struct ContentView: View {
    var body: some View {
//        Diagonal()
//        Diamond()
//        Arrow()
//        OlympicRings()
        StarPattern()
            .stroke()
            .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
