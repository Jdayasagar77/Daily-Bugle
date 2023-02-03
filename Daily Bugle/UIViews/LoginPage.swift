//
//  LoginPage.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 03/02/23.
//

import SwiftUI

struct LoginPage: View {

    let bubble1 = CircleViewModel(height: 40, width: 30, x: 30, y: 100, color: Color.black, lifetime: 5)
    let bubble2 = CircleViewModel(height: 50, width: 30, x: 30, y: 100, color: Color.black, lifetime: 5)
    let bubble3 = CircleViewModel(height: 40, width: 30, x: 30, y: 100, color: Color.black, lifetime: 5)
    let bubble4 = CircleViewModel(height: 40, width: 30, x: 30, y: 100, color: Color.black, lifetime: 5)
    let bubble5 = CircleViewModel(height: 40, width: 30, x: 30, y: 100, color: Color.black, lifetime: 5)
    let bubble6 = CircleViewModel(height: 40, width: 30, x: 30, y: 100, color: Color.black, lifetime: 5)
    let bubble7 = CircleViewModel(height: 40, width: 30, x: 30, y: 100, color: Color.black, lifetime: 5)
    
    @State var change = true
    
    @State var opacity: Double = 0
    
        var body: some View {
            
            Circle()
                .foregroundColor(bubble1.color)
                .opacity(opacity)
                .frame(width: bubble1.width, height: bubble1.height)
                .position(x: bubble1.x, y: bubble1.y)
                .onAppear {
                    
                    withAnimation(.linear(duration: bubble1.lifetime).repeatForever()){
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation(.linear(duration: bubble1.lifetime/2).repeatForever()) {
                            self.opacity = 1
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation(Animation.linear(duration: bubble1.lifetime/4).repeatForever()) {
                            self.change.toggle()
                            //Go sideways
                            bubble1.x += bubble1.xFinalValue()
                            
                        }
                    }
                }
            
        }

    }


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}



class CircleViewModel: Identifiable, ObservableObject{
    
    let id: UUID = UUID()
    @Published var x: CGFloat
    @Published var y: CGFloat
    @Published var color: Color
    @Published var width: CGFloat
    @Published var height: CGFloat
    @Published var lifetime: TimeInterval = 0
    
    init(height: CGFloat, width: CGFloat, x: CGFloat, y: CGFloat, color: Color, lifetime: TimeInterval){
        self.height = height
        self.width = width
        self.color = color
        self.x = x
        self.y = y
        self.lifetime = lifetime
    }
    
    func xFinalValue() -> CGFloat {
        return CGFloat.random(in: 0...400)
    }
    func yFinalValue() -> CGFloat {
        return CGFloat.random(in: 0...700)
    }
    
}
