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
        HStack(spacing: 3) {
            VStack {
                Spacer()
                
                Text("\(Int(mustDo.gauge*100))%")
                    .padding([.leading], 8)
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .frame(width: 80, alignment: .leading)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.init(hex: "D5D5D5"), lineWidth: 2)
            )
            
            HStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text("\(mustDo.title)")
                        .padding([.leading], 8)
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.init(hex: "62C15B"), lineWidth: 2)
            )
            
            VStack {
                Spacer()
                
                Text("\(mustDo.elapsedSeconds / 3600)시간")
                    .padding([.leading], 8)
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .frame(width: 50, alignment: .leading)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.init(hex: "D5D5D5"), lineWidth: 2)
            )
        }
        .padding([.leading], 36)
        .padding([.trailing], 24)
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
