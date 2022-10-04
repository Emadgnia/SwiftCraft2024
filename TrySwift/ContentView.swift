//
//  ContentView.swift
//  TrySwift
//
//  Created by Emad Ghorbaninia on 25/09/2022.
//

import SwiftUI
import DeckUI

struct ContentView: View {
    var body: some View {
        Presenter(deck: self.deck)
    }
}
extension ContentView {
    var deck: Deck {
        Deck(title: "Try Swift! World Fall 2022") {
            Slide(alignment: .center) {
                Title("How to Create", subtitle: "Libraries, frameworks, and swift packages for iOS")
            }
            
            Slide(padding: 100) {
                Title("Topics")
                Bullets {
                    Words("Create a new package for an existing project")
                    Words("Migrate different codes and classes to the package.")
                    
                    Words("Create a new framework for an existing project")
                    Words("Migrate different codes and classes to the framework.")
                    
                    Words("Make XCFramework")
                    Words("Create a new package for the XCFramework")

                    Words("Import everything back into the app.")

                    Words("Use your packages using Swift Package Manager.")
                }
            }
            Slide(padding: 100) {
                Title("Bonus content", subtitle: "if we had time")
                Bullets{
                    Words("Build a binary framework, XCFramework.")
                    Words("Document your package using DocC")
                    Words("Libraries vs Frameworks vs SwiftPackage vs Modules vs ...")
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
