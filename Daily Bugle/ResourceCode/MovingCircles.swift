//
//  MovingCircles.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 04/02/23.
//

import SwiftUI
struct MovingCircles: View {
    @State var moveX = true
    @State var moveY = true
    @State var moveX2 = true
    @State var moveY2 = true
    @State var rotate1 = true
    var body: some View {
        ZStack{
            Circle().frame(width:50, height:50)
                .offset(x: moveX ? 0:100, y: moveY ? 0:100)
                .animation(Animation.easeInOut(duration:1).delay(0).repeatForever())
               .rotationEffect(.degrees(rotate1 ? 0:350))
                .offset(x: moveX2 ? 0:-100, y: moveY2 ? 0:-200)
                .animation(Animation.easeInOut(duration:1).delay(1).repeatForever())
            
                .onAppear(){
                    self.moveX.toggle();
                    self.moveY.toggle();
                    self.moveX2.toggle();
                    self.moveY2.toggle();
                    self.rotate1.toggle();
                    //    self..toggle()
            }
        }
} }

struct MovingCircles_Previews: PreviewProvider {
    static var previews: some View {
        MovingCircles()
    }
}
