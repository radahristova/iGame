//
//  GameDetailsView.swift
//  iGame
//
//  Created by Rada Hristova on 24.07.23.
//

import SwiftUI

struct GameDetailsView: View {	var imageName: String
	var gameTitle: String
	var platform: String
	var description: String
	
	var body: some View {
		VStack {
			AsyncImage(url: URL(string: imageName))
				.cornerRadius(12)
			HStack {
				Text(gameTitle)
				Text(platform)
			}
			Text(description)
		}
	}
}

#if DEBUG
struct GameDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		GameDetailsView(
			imageName: "",
			gameTitle: "Overwatch 2",
			platform: "PC (Windows)",
			description: "A hero-focused first-person team shooter from Blizzard Entertainment."
		)
	}
}
#endif
