//
//  ContentView.swift
//  Memorize
//
//  Created by Millan Bhandari on 9/6/22.
//

import SwiftUI

struct ContentView: View {
    let TransportEmojis = ["🚚", "✈️", "🚌", "🚝", "🚉", "🚛", "🚢", "🚘", "🛺", "🛵", "🚁", "🚀", "🚙", "🚲", "🚒", "🚂", "🛬", "🏍️", "🚓", "🚴🏻", "🛴", "🚆", "🚑", "🛶"].shuffled()
    @State var emojis: Array = ["🚚", "✈️", "🚌", "🚝", "🚉", "🚛", "🚢", "🚘", "🛺", "🛵", "🚁", "🚀", "🚙", "🚲", "🚒", "🚂", "🛬", "🏍️", "🚓", "🚴🏻", "🛴", "🚆", "🚑", "🛶"].shuffled()
    let SmileyEmojis: Array = ["😀", "😆", "🥹", "😂", "🥲", "😇", "😉", "😍", "🤪", "🧐", "🤓", "😎", "🥳", "🥶", "🤥", "🥵", "🤡", "😈"]
    let SpaceEmojis: Array = ["🔭", "🪐", "☄️", "🛸", "👽", "🛰", "🚀", "👾", "👨🏻‍🚀", "🌌"]
    @State var emojiCount = 6
    var body: some View {
            VStack {
                Text("Memorize!")
                    .fontWeight(.bold)
                    .font(.title)
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: "\(emoji)")
                    })
                }
                .foregroundColor(.red)
                Spacer()
                HStack {
                    buttons
                }
                .padding()
            }
        .padding(.horizontal)
    }
    
    var buttons: some View {
        HStack {
            Button {
                emojis.removeAll()
                emojis = TransportEmojis
            } label: {
                VStack {
                    Image(systemName: "car")
                    Text("Vehicles")
                }
            }
            Button {
                emojis.removeAll()
                emojis = SmileyEmojis
            } label: {
                VStack {
                    Image(systemName: "face.smiling")
                    Text("Smiley")
                }
            }
            .padding()
            Button {
                emojis.removeAll()
                emojis = SpaceEmojis
            } label: {
                VStack {
                    Image(systemName: "airplane.circle")
                    Text("Space")
                }
                
            }
            
        }
    }
    var remove: some View {
        Button {
            emojiCount -= 1
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button {
            emojiCount += 1
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var shuffle: some View {
        Button {
            emojis[0..<emojiCount].shuffle()
        } label: {
            HStack {
                Text("Shuffle")
                Image(systemName: "shuffle.circle")
            }
        }
    }
}

struct CardView: View {
    var content : String
    @State var isFaceUp : Bool = true
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .frame(width: 75.0, height: 125.0)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
        
    }
}
