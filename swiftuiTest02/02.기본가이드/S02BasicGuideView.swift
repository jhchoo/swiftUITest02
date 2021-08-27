//
//  S02BasicGuideView.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/04.
//

import SwiftUI


struct MyVStackView: View {
    var body: some View {
        VStack {
            Text("1!").fontWeight(.bold).font(.system(size: 60))
            Text("2!").fontWeight(.bold).font(.system(size: 60))
            Text("3!").fontWeight(.bold).font(.system(size: 60))
        }.background(Color.blue)
    }
}

struct S02BasicGuideView: View {
    
    @State
    var isActive: Bool = false
    
    var body: some View {
        Color(UIColor.orange).overlay(
            
            NavigationView {
                VStack {
                    
                    HStack(spacing: 10) {
                        MyVStackView()
                        MyVStackView()
                        MyVStackView()
                    }
                    .padding(isActive ? 50 : 10)
                    .background(isActive ? Color.yellow : Color.red)
                    // 탭 제스쳐 추가.
                    .onTapGesture(count: 1, perform: {
                        print("크릭되었다.")
                        //self.isActive = !self.isActive
                        
                        // 에니메이션과 함께
                        withAnimation {
                            self.isActive = !self.isActive
                        }
                    })
                    
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 200, height: (5.0))
                        .padding(.top, 50)
                    
                    NavigationLink( destination: MyTextView(isActive: self.isActive) ) {
                            Text("이동")
                                .fontWeight(.heavy)
                                .font(.system(size: 60))
                                .foregroundColor(Color.white)
                                .frame(width: 200, height: 100, alignment: .center)
                    }
                    .background(Color.orange)
                    .cornerRadius(30)
            
                }
            }

        )
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            print("ContentView appeared!")
        }
        .onDisappear {
            print("ContentView disappeared!")
        }
    }
}





struct S02BasicGuideView_Previews: PreviewProvider {
    static var previews: some View {
        S02BasicGuideView()
    }
}
