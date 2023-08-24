//
//  SearchArea.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/25.
//

import SwiftUI



struct SearchArea: View {
    let array = [
        "Apple", "Naver", "Kakao", "KNU", "Luna", "Muho",
        "Joyce", "DevMuscle", "개발자", "애플", "네이버", "카카오",
        "경북대", "루나", "무호", "조이스", "홍지표"
    ]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                List {
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
                    }
                } //리스트의 스타일 수정
                .listStyle(PlainListStyle())
                //화면 터치시 키보드 숨김
                .onTapGesture {
                    hideKeyboard()
                }
            }
        }
    }
}



struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("기업, 채용 공고 검색", text: $text)
                    .foregroundColor(.primary)
                
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
        }
        .padding(.horizontal)
    }
}


// 화면 터치시 키보드 숨김
// SwiftUI에서는 지원하지 않는 기능, UIKit에서 가져와야 함
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct SearchArea_Previews: PreviewProvider {
    static var previews: some View {
        SearchArea()
    }
}
