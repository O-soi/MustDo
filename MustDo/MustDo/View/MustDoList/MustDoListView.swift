//
//  MustDoListView.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import SwiftUI
import Presenter

public struct MustDoListView: View {
    @ObservedObject private var interactor: MustDoListInteractor
    
    public init(interactor: MustDoListInteractor) {
        self.interactor = interactor
    }
    
    public var body: some View {
        ZStack {
            VStack {
                NavigationView(
                    title: "MustDo",
                    rightButtonTap: interactor.routeAddMustDoScene
                )
                .frame(height: 40)
                
                TodayChangeView(
                    currentDay: $interactor.currentDay,
                    movePrevDay: interactor.movePrevDay,
                    moveNextDay: interactor.moveNextDay
                )
                .frame(height: 40)
                
                mustDoList()
            }
            
            if interactor.isLoading {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .overlay(ProgressView().progressViewStyle(.circular))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear {
            interactor.viewDidLoad()
        }
    }
}

// MARK: set up LazyVGrid

extension MustDoListView {
    func mustDoList() -> some View {
        GeometryReader { gp in
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.flexible())],
                    content: {
                        ForEach(interactor.items) { item in
                            MustDoItemView(mustDo: item)
                                .frame(width: gp.size.width - 32)
                                .background(.white)
                                .cornerRadius(15)
                                .padding([.top, .bottom], 5)
                                .onAppear {
                                    guard item == interactor.items.last else { return }
                                    interactor.scrollToBottom()
                                }
                        }
                    })
            }
            .padding(.top, 8)
            .background(Color.init(hex: "F6F6F6"))
        }
    }
}

struct MustDoListView_Previews: PreviewProvider {
    static var previews: some View {
        MustDoListView(interactor: MustDoListInteractor())
    }
}
