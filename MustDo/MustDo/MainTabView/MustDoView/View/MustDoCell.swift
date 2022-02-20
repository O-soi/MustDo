//
//  MustDoCell.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import SwiftUI

struct MustDoCell: View {
    let mustDo: MustDo
    
    var body: some View {
        HStack {
            CircleGaugeView(progress: mustDo.gauge)
                .frame(width: 60, height: 60, alignment: .center)
                .padding()
            
            VStack(alignment: .leading, spacing: 5) {
                makeMustDoInfoView(title: "해야할 일", dataString: mustDo.title)
                makeMustDoInfoView(title: "소요 시간", dataString: "\(mustDo.elapsedSeconds)초")
                makeMustDoInfoView(title: "수행 시간", dataString: "\(mustDo.performedSeconds)초")
            }
            .padding([.top, .bottom])
            
            Spacer()
                
        }
    }
}

extension MustDoCell {
    func makeMustDoInfoView(title: String, dataString: String) -> some View {
        return HStack(alignment: .top) {
            Text(title)
                .font(.system(size: 10, weight: .bold))
                .padding(5)
                .background(Color.indigo)
                .foregroundColor(Color.white)
                .clipShape(Capsule())
            
            Text(dataString)
                .font(.system(size: 15, weight: .bold))
                .padding(.top, 2)
        }
    }
}

struct MustDoCell_Previews: PreviewProvider {
    static var previews: some View {
        MustDoCell(mustDo: dummyMustDo)
    }
}
