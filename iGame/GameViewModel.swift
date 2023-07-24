//
//  GameViewModel.swift
//  iGame
//
//  Created by Rada Hristova on 22.07.23.
//

import Foundation

final class GameViewModel: ObservableObject {
	func fetchData() async throws -> [Game] {
		guard let url = URL(string: "https://www.freetogame.com/api/games") else {
			throw URLError(.badURL)
		}
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			do {
				return try JSONDecoder().decode(Array<Game>.self, from: data)
			} catch {
				throw error
			}
		} catch {
			throw error
		}
	}
}
