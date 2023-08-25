//
//  ResearchJobView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/25.
//

import SwiftUI

struct ResearchJobView: View {
    @State private var searchText = ""
    
    let jobtypeList: [String] = ["Front", "Backend", "iOS", "Android", "AI"]
    
//    @State private var status = UserDefaults.standard.string(forKey: "status") // 사용자 "구직자" or "구인자"
    
    @State var status = "구직자"
    var body: some View {
        VStack(spacing: 0){
            SearchBar(text: $searchText)
                .padding(.top, 10)
                .padding(.bottom, 19)
            
            // jobtypeList 선택
            HStack (spacing: 10){
                ForEach(jobtypeList, id: \.self) { jobtype in
                    Button {
                        // action
                    } label: {
                        Text(jobtype)
                            .font(.pretendard(.medium, size: 20))
                            .foregroundColor(.textLight300)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 6)
                            .background(Color(.secondarySystemBackground).cornerRadius(10).opacity(0.4))
                    }
                }
            }.padding(.bottom, 15)
            
            CardArea()
            
            
            NavigationLink {
                // destination
                if status=="구인자" { // 구인자 -> 공고 올리기
                    UploadJobOfferView()
                } else { // 구직자 -> 기업 정보 뷰
                    JobDetailView()
                }
                
            } label: {
                Text(status=="구인자" ? "구인 공고 올리기" : "지원하기")
                    .font(.pretendard(.bold, size: 16))
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(Color.mainPrimary500.cornerRadius(12))
            } .padding(.horizontal, 19)
                .padding(.bottom, 25)

            Spacer()
        }
        //화면 터치시 키보드 숨김
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct ResearchJobView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResearchJobView()
        }
    }
}
