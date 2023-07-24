//
//  ContentView.swift
//  iGame
//
//  Created by Rada Hristova on 21.07.23.
//

import SwiftUI

struct ContentView: View {
	@State private var games: [Game] = []
	@State private var selectedGame: Game? = nil
	
	var body: some View {
		NavigationView {
			List(selection: $selectedGame) {
				ForEach(games, id: \.id) { game in
					VStack(alignment: .leading) {
						AsyncImage(url: URL(string: game.thumbnail))
						Text(game.title)
							.font(.headline)
							.bold()
							.padding([.leading, .trailing], 12)
					}
					.onTapGesture {
						selectedGame = game
					}
				}
				.sheet(item: $selectedGame) { game in
					GameDetailsView(
						imageName: game.thumbnail,
						gameTitle: game.title,
						platform: game.platform,
						description: game.description
					)
				}
			}
			.task {
				do {
					games = try await model.fetchData()
				} catch {
					// TODO: Handle error
					games = []
				}
			}
			.navigationBarTitleDisplayMode(.large)
			.navigationTitle("Games List")
		}
	}
	
	@ObservedObject var model: GameViewModel
	
	init(model: GameViewModel) {
		self.model = model
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(model: GameViewModel())
	}
}
