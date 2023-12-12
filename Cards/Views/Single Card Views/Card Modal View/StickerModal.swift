//
//  StickerModal.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI

struct StickerModal: View {
    @State private var stickerNames: [String] = []

    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(stickerNames, id: \.self) { sticker in
                    Image(uiImage: image(from: sticker))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
        .onAppear {
            stickerNames = Self.loadStickers()
        }
    }

    static func loadStickers() -> [String] {
        var themes: [URL] = []
        var stickerNames: [String] = []

        let fileManager = FileManager.default

        if let resourcePath = Bundle.main.resourcePath,
           let enumerator = fileManager.enumerator(
            at: URL(fileURLWithPath: resourcePath + "/Stickers"),
            includingPropertiesForKeys: nil,
            options: [
                .skipsSubdirectoryDescendants,
                .skipsHiddenFiles
            ]) {
            for case let url as URL in enumerator where url.hasDirectoryPath {
                themes.append(url)
            }
        }
        for theme in themes {
            if let files = try? fileManager.contentsOfDirectory(atPath: theme.path) {
                for file in files {
                    stickerNames.append(theme.path + "/" + file)
                }
            }
        }
        return stickerNames
    }

    func image(from path: String) -> UIImage {
        print("loading", path)
        return UIImage(named: path) ?? UIImage(named: "error-image") ?? UIImage()
    }
}

#Preview {
    StickerModal()
}
