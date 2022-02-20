//
//  CircleGaugeView.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import SwiftUI

struct CircleGaugeView: View {
    @State var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            makeCircleGauge(geometry)
        }
    }
}

extension CircleGaugeView {
    func makeCircleGauge(_ geometry: GeometryProxy) -> some View {
        let width: CGFloat = geometry.size.width
        
        return ZStack {
            Circle()
                .trim(from: 0.0, to: 1)
                .stroke(Color.indigo.opacity(0.3), style: StrokeStyle(lineWidth: 50.0/375.0 * width))
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(Color.indigo, lineWidth: 50.0/375.0 * width)
                .rotationEffect(Angle(degrees: -180))
            
            Text("\(Int(self.progress*100))%")
                .font(.system(size: 100/375.0 * width, weight: .bold, design: .rounded))
                .foregroundColor(.indigo)
        }
    }
}

struct CircleGaugeView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGaugeView(progress: 0.3)
            .frame(width: 200, alignment: .center)
    }
}
