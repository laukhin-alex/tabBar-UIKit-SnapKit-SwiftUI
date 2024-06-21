//
//  ComicCellView.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 29.05.23.
//

import SwiftUI
import Kingfisher

struct ComicCellView: View {
    @State private var showDetail = false
    @State private var selectedImage: IdentifiableURL?
        // передать всю модель
    let comic: Comic

    var body: some View {
        HStack {
            Button {
                showDetail = true
            } label: {
                HStack {
                    Text(comic.title ?? "")
                    Spacer()
                    KFImage(comic.thumbnail?.url)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 50)
                }
            }
            Spacer()
        }
        .font(.headline)
        .foregroundColor(Color.black)
        .sheet(isPresented: $showDetail) {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showDetail.toggle()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
                .font(.title)
                .foregroundColor(Color.black)
                .padding(.top, 15)
                HStack(alignment: .center) {
                    Text(comic.title ?? "")
                }
                .padding()
                .font(.title)
                KFImage(comic.thumbnail?.url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        if comic.description != "" {
                            HStack {
                                Text("Description")
                                    .font(.headline)
                                Spacer()
                            }
                            Text(comic.description ?? "")
                        } else {
                            Text("Sorry, we've lost the information")
                        }
                        if comic.variantDescription != "" {
                            HStack {
                                Text("Something interesting")
                                    .font(.headline)
                                Spacer()
                            }
                            Text(comic.variantDescription ?? "")
                            Spacer()
                        }
                    }
                    if comic.images?.count ?? 0 > 1 {
                        VStack(alignment: .leading) {
                            Text("Associated images")
                                .font(.headline)
                            ScrollView(.horizontal, showsIndicators: true) {
                                HStack(spacing: 10) {
                                    ForEach(comic.images ?? [], id: \.self) { image in
                                        KFImage(image.url)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 100)
                                            .onTapGesture {
                                                self.selectedImage = IdentifiableURL(url: image.url ?? URL(string: "blank.image")!) // MARK: Wrap imageUrl with IdentifiableURL
                                            }
                                    }
                                }
                                Spacer()
                            }
                        }
                        .padding(.top)
                        .sheet(item: $selectedImage) { selectedImage in
                            HStack {
                                Spacer()
                                Button {
                                    self.selectedImage = nil
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                }
                            }
                            .font(.title)
                            .foregroundColor(Color.black)
                            .padding([.top, .trailing], 15)
                            Spacer()
                            KFImage(selectedImage.url)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Spacer()
                        }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal)
            .font(.body)
        }
    }
}

struct ComicCellView_Previews: PreviewProvider {
    static var previews: some View {
        ComicCellView(comic: Comic(id: 1,
                                   title: "ff",
                                   pageCount: 2,
                                   thumbnail: nil,
                                   variantDescription: "",
                                   description: "",
                                   images: []
                                  )
        )
    }
}
