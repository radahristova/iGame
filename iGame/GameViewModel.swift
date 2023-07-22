//
//  GameViewModel.swift
//  iGame
//
//  Created by Rada Hristova on 22.07.23.
//

import Foundation

final class GameViewModel: ObservableObject {
	@Published var games = [Game]()
	
	init() {
		fetchData()
	}
	
	func fetchData() {
		guard let url = URL(string: "https://www.freetogame.com/api/games") else {
			return
		}
		
		URLSession.shared.dataTask(with: url) { (data, _, _) in
			if let data = data {
				do {
					let results = try JSONDecoder().decode(Array<Game>.self, from: data)
					DispatchQueue.main.async {
						self.games = results
					}
				} catch {
					print("Error occured with: \(error)")
				}
			}
		}.resume()
	}
}
