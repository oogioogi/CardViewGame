//
//  Pie.swift
//  CardViewGame
//
//  Created by 이용석 on 2021/07/18.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle : Angle
    var clockWise: Bool = false
    
    
    func path(in rect: CGRect) -> Path {

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.height, rect.width) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.x + radius * CGFloat(sin(startAngle.radians))
        )
        
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !clockWise
        )
        p.addLine(to: center)
        return p
    }
    
    
}
