//
//  ContentView.swift
//  Assignment1-CS193P
//
//  Created by Margo Naumenko on 25.07.2021.
//

import SwiftUI

struct ContentView: View {

    let animalsEmojis = ["🐶","🐱","🐭","🦊","🐻","🐨","🐮","🐸","🐺","🐴","🐗","🐵","🐧","🐔","🐯","🦁"]
    let flagsEmojis = ["🇦🇲","🇦🇼","🇧🇾","🇧🇬","🇬🇧","🇻🇪","🇩🇪","🇷🇺","🇸🇨","🇮🇱","🇨🇨","🇵🇪","🇰🇵"]
    let plantEmojis = ["🌷","🎋","🪴","🌵","🌲","🌳","☘️","🌾","🌹","🌺","🌻"]
    @State var emojis: [String] = []
    var body: some View {
        VStack {
            Label{
                Text("Memorize!")

            } icon: {
            }
           .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    ForEach(emojis, id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fill)
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
