//
//  MarvelComicsView.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 27.05.23.
//

import SwiftUI

struct MarvelComicsView: View {
    @ObservedObject private var marvelComicsViewModel = MarvelComicsViewModel()

    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            List {
                ForEach(marvelComicsViewModel.comics, id: \.id) { comic in
                    ComicCellView(comic: comic)
                        .onAppear {
                            if marvelComicsViewModel.canLoad && self.marvelComicsViewModel.comics.isNearEnd(comic) {
                                self.marvelComicsViewModel.fetch()
                            }
                        }
                }
            }
            .navigationBarItems(leading: Image("marvel")
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44))
            .navigationBarItems(trailing: Image("spiderman")
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44))
            .navigationBarTitle(Text("Marvel Comics"), displayMode: .inline)
            .onAppear {
                marvelComicsViewModel.fetch()
            }
            
            if marvelComicsViewModel.isLoading {
                ActivityIndicator(isAnimating: $marvelComicsViewModel.isLoading)
            }
        }
        .alert(item: $marvelComicsViewModel.error) { error in
            Alert(title: Text("Ops..."), message: Text(error.message), dismissButton: .cancel())
        }
    }
}

struct MarvelComicsView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelComicsView()
    }
}
