//
//  ContentView.swift
//  iGame
//
//  Created by Rada Hristova on 21.07.23.
//

import SwiftUI

struct ContentView: View {
	@StateObject var list = GameViewModel()
	
	var body: some View {
		NavigationView {
			List {
				ForEach(list.games, id: \.self) { item in
					VStack(alignment: .leading) {
						AsyncImage(url: URL(string: item.thumbnail))
						Text(item.title)
							.font(.headline)
							.bold()
							.padding([.leading, .trailing], 12)
					}
					.listRowSeparator(.hidden)
				}
			}
			.navigationBarTitleDisplayMode(.large)
			.navigationTitle("Games List")
		}
	}
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
