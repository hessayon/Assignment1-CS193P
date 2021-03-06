//
//  ContentView.swift
//  Assignment1-CS193P
//
//  Created by Margo Naumenko on 25.07.2021.
//

import SwiftUI

struct ContentView: View {

    let animalsEmojis = ["ðķ","ðą","ð­","ðĶ","ðŧ","ðĻ","ðŪ","ðļ","ðš","ðī","ð","ðĩ","ð§","ð","ðŊ","ðĶ"]
    let flagsEmojis = ["ðĶðē","ðĶðž","ð§ðū","ð§ðŽ","ðŽð§","ðŧðŠ","ðĐðŠ","ð·ðš","ðļðĻ","ðŪðą","ðĻðĻ","ðĩðŠ","ð°ðĩ"]
    let plantEmojis = ["ð·","ð","ðŠī","ðĩ","ðē","ðģ","âïļ","ðū","ðđ","ðš","ðŧ"]
    @State var emojis: [String] = []
    @State var emojisCount: Int = 0
    var body: some View {
        VStack {
            Label{
                Text("Memorize!")

            } icon: {
            }
           .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    if emojisCount != 0 {
                        ForEach(emojis[0...emojisCount], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fill)
                        }
                    }
                }
            }
            .foregroundColor(.orange)
            Spacer()
            HStack{
                animalTheme
                Spacer()
                plantTheme
                Spacer()
                flagTheme
            }
            .padding(.horizontal)
        }
    }
    var animalTheme : some View {
        Button{
            emojisCount = Int.random(in: 4..<animalsEmojis.count)
            emojis = animalsEmojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "tortoise")
                    .font(.largeTitle)
                Text("Animals")
                    
            }
            
        }
    }
    var plantTheme : some View {
        Button{
            emojisCount = Int.random(in: 4..<plantEmojis.count)
            emojis = plantEmojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "leaf")
                    .font(.largeTitle)
                Text("Plants")
            }

        }
    }
    var flagTheme : some View {
        Button{
            emojisCount = Int.random(in: 4..<flagsEmojis.count)
            emojis = flagsEmojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "flag")
                    .font(.largeTitle)
                Text("Flags")
            }
            
        }
    }

}

struct CardView: View {
    @State var isFaceUp = true
    let content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 30)
            if isFaceUp {
                shape
                    .fill(Color.white)
                shape
                    .strokeBorder(lineWidth: 7)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
