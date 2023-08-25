//
//  CardArea.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/25.
//

import SwiftUI

struct CardArea: View {
    let sideSpacing: CGFloat = 20 // Card 좌우 공백
    let totalSpacing: CGFloat = 60 // 전체 뷰에서 Card를 제외한 공백
    
    @State var index: Int = 0
    
    @GestureState var offset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            let adjustmentWidth = (totalSpacing / 2) - sideSpacing
            let width = geo.size.width - (totalSpacing - sideSpacing)
            
            HStack (spacing: 20){
                CardDetailView(imageName: "JobCard")
                    .frame(width: UIScreen.main.bounds.width * 0.84)
                CardDetailView(imageName: "JobCard2")
                    .frame(width: UIScreen.main.bounds.width * 0.84)
                CardDetailView(imageName: "JobCard3")
                    .frame(width: UIScreen.main.bounds.width * 0.84)
            } // HStack
            .padding(.horizontal, 20)
            //.border(.red)
            .offset(x: (CGFloat(index) * (-width) + (index != 0 ? adjustmentWidth : 0) + offset))
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, inoutState, inoutTransaction in
                        inoutState = value.translation.width
                    })
                    .onChanged({ value in })
                    .onEnded { value in
                        // draw gesture로 변화된 width값
                        let widthOffset = value.translation.width
                        let howSwap = -widthOffset / width
                        let isNextIndex = howSwap.rounded()
                        
                        index = max(min(index+Int(isNextIndex), 2), 0)
                        
                    }) // gesture
        } // GeometryReader
        //        .frame(height: 509)
        .animation(.easeInOut, value: offset == 0)
        
    }
}


struct CardDetailView: View {
    var imageName: String = "JobCard"
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.85)
        }
        .shadow(radius: 5, x: 1, y: 1)
        //.border(.red)
    }
}

struct CardArea_Previews: PreviewProvider {
    static var previews: some View {
        CardArea()
        CardDetailView(imageName: "JobCard")
    }
}
