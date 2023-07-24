//
//  Game.swift
//  iGame
//
//  Created by Rada Hristova on 22.07.23.
//

import Foundation

struct Game: Decodable, Identifiable, Hashable {
	let id = UUID()
	let title: String
	let thumbnail: String
	let platform: String
	let description: String
	
	private enum CodingKeys: String, CodingKey {
		case title, thumbnail, platform
		case description = "short_description"
	}
}
