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
                }
                RawView { Spacer() }
                Bullets {
                    Words("Create a new framework for an existing project")
                    Words("Migrate different codes and classes to the framework.")
                }
                RawView { Spacer() }
                Bullets {
                    Words("Make XCFramework")
                    Words("Create a new package for the XCFramework")
                }
                RawView { Spacer() }
                Bullets {
                    Words("Import everything back into the app.")
                }
                RawView { Spacer() }
                Bullets {
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
            Slide(padding: 30) {
                Title("Build a binary framework, XCFramework.")
                Code("""
                * iOS
                xcodebuild archive \
                
                -scheme NetworkingFramework \
                
                -configuration Release \
                
                -destination 'generic/platform=iOS' \
                
                -archivePath './build/NetworkingFramework.framework-iphoneos.xcarchive' \
                
                SKIP_INSTALL=NO \
                
                BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
                """)
                Code("""
                * Simulator
                xcodebuild archive \
                
                -scheme NetworkingFramework \
                
                -configuration Release \
                
                -destination 'generic/platform=iOS Simulator' \
                
                -archivePath './build/NetworkingFramework.framework-iphonesimulator.xcarchive' \
                
                SKIP_INSTALL=NO \
                
                BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
                """)
                RawView { Spacer() }
                Code("""
                * MacOS
                xcodebuild archive \
                
                -scheme NetworkingFramework \
                
                -configuration Release \
                
                -destination 'platform=macOS,arch=x86_64' \
                
                -archivePath './build/NetworkingFramework.framework-catalyst.xcarchive' \
                
                SKIP_INSTALL=NO \
                
                BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
                """)
            }
            Slide(padding: 30) {
                Title("Build a binary framework, XCFramework.")
                Code("""
                xcodebuild -create-xcframework \
                
                -framework './build/NetworkingFramework.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/NetworkingFramework.framework' \
                
                -framework './build/NetworkingFramework.framework-iphoneos.xcarchive/Products/Library/Frameworks/NetworkingFramework.framework' \
                
                -framework './build/NetworkingFramework.framework-catalyst.xcarchive/Products/Library/Frameworks/NetworkingFramework.framework' \
                
                -output './build/NetworkingFramework.xcframework'
                """)
            }
            Slide(padding: 30) {
                Title("DocC Using Github",subtitle: "https://emadgnia.github.io/NetworkingFramework/documentation/networkingframework/")
                Code("""
                    (xcrun --find docc) process-archive \
                    
                    transform-for-static-hosting PATH_TO_doccarchive_FILE/ \
                    
                    --output-path PATH_TO_EXPORTEDFOLDER/docs \
                    
                    --hosting-base-path /GITHUB_REPO_NAME
                    
                    """)
            }
            Slide {
                Title("Framework or What?")
                
                Columns {
                    Column {
                        Bullets(style: .bullet) {
                            Words("Frameworks")
                            Words("Libraries")
                            Words("SwiftPackage")
                            Words("Modules")
                        }
                    }
                    
                    Column {
                        Media(.bundleImage("Diagram"))
                    }
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
