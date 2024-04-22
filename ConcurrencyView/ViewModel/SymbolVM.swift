//
//  SymbolVM.swift
//  ConcurrencyView
//
//  Created by Macbook Pro on 22/04/24.
//

import Foundation

class SymbolVM: ObservableObject {
    @Published var symbols: [Symbol] = Symbol.dummyData
    
    // MARK: - ASYNCHRONOUS
    @MainActor
    func downloadImageWithoutBlockingUI() async {
        let urlString = "https://res.cloudinary.com/dlll8lmww/image/upload/v1713407646/Screenshot_2024-04-18_at_09.30.41_cry2ay.png?uui=\(UUID().uuidString)"
        guard let url = URL(string: urlString) else {return}
        // global() = semuanya berjalan di main thread
        // main() = ada yg berjalan di main dan background thread
        
        // sync akan melakukan aktivitas secara serial atau linear sehingga
        // ketika aktivitas background berjalan main thread akan terblok
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            print(url)
        } catch {
            print("Error: Downloading Imgae: \(error.localizedDescription)")
        }
    }

    
    // MARK: - SYNCHRONOUS
    func downloadImageAndBlockUI() {
        let urlString = "https://res.cloudinary.com/dlll8lmww/image/upload/v1713407646/Screenshot_2024-04-18_at_09.30.41_cry2ay.png?uui=\(UUID().uuidString)"
        guard let url = URL(string: urlString) else {return}
        // global() = semuanya berjalan di main thread
        // main() = ada yg berjalan di main dan background thread
        
        // sync akan melakukan aktivitas secara serial atau linear sehingga
        // ketika aktivitas background berjalan main thread akan terblok
        
        // async sebaliknya
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 2)
            let output = try? Data(contentsOf: url)
            print(output!)
            print(url)
        }
    }
}
