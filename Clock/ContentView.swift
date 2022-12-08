//
//  ContentView.swift
//  Clock
//
//  Created by Talal El Zeini on 11/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            TestView()
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct TestView: View {
    @State private var size = CGSize.zero
    
    @State var timeNow = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var dateFormatter: DateFormatter {
        let fmtr = DateFormatter()
        fmtr.dateFormat = "HH:mm:ss"
        return fmtr
    }
    var body: some View {
        Text(timeNow)
            .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height)
            .font(Font.custom("Avenir", size: 180))
            .fixedSize()
        .onReceive(timer) { _ in
                self.timeNow = dateFormatter.string(from: Date())
        }
        .rotationEffect(Angle(degrees: 90))
        .frame(width: size.height, height: size.width)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
