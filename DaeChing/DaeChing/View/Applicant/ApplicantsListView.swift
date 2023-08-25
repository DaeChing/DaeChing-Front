//
//  ApplicationsListView.swift
//  DaeChing
//
//  Created by 신서연 on 2023/08/25.
//
import SwiftUI

struct ApplicationsListView: View {
    var body: some View {
        NavigationView {
            VStack {
                TopArea()
                    .padding(.top, 20)
                JobListView(dateText: "23.8.20", jobText: "iOS 개발자", numApplicants: "10명")
                JobListView(dateText: "23.7.10", jobText: "백앤드 개발자", numApplicants: "15명")
                JobListView(dateText: "23.5.18", jobText: "프론트앤드 개발자", numApplicants: "12명")
                Spacer()

            }
            .navigationBarTitle("관리", displayMode: .inline)
        }
    }
}
func TopArea() -> some View {
   VStack(alignment: .leading) {
       HStack {
           cuteBtn(btnColor: .blue, btnText: "공고 수", textColor: .white, btnnum: "3")
           Spacer()
           cuteBtn(btnColor: .gray.opacity(0.1), btnText: "채용 완료", textColor: .gray, btnnum: "0")
       }
       .padding(.horizontal,20)
       .padding(.trailing, 130)
       RoundedRectangle(cornerRadius: 5)
           .stroke(Color.black, lineWidth: 1)
           .foregroundColor(.clear)
           .frame(width: 86,height: 35)
           .overlay {
               HStack {
                   Text("지난 1개월")
                       .font(.system(size: 12))
                       .padding(.leading,7)
                   Spacer()
                       Image(systemName: "chevron.down")
                           .font(.system(size: 8))
                           .padding(.trailing,7)

               }
           }
           .padding(.leading,20)
           .padding(.vertical,17)
   }
}


struct JobListView : View {
    var dateText = ""
    var jobText = ""
    var numApplicants = ""
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            VStack {
                HStack {
                    Text(dateText)
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                        .foregroundColor(.gray)
                        .padding(.leading,20)
                    Spacer()
                    Text(jobText)
                        .font(.custom("Pretendard", size: 16).weight(.bold))
                    Spacer()
                    Text("지원자 수")
                        .font(.custom("Pretendard", size: 16).weight(.bold))
                    Spacer()
                    NavigationLink(destination: InfoApplicantsView()) {
                        Image(systemName: "chevron.right")
                            .padding(.trailing,20)
                    }
                }

                HStack {
                    Text("개발 경력직 채용")
                        .font(.custom("Pretendard", size: 12).weight(.medium))
                        .foregroundColor(.gray)
                    Spacer()

                    Text(numApplicants)
                        .font(.custom("Pretendard", size: 12).weight(.medium))
                        .foregroundColor(.gray)

                }.padding(.horizontal, 120)
                    .padding(.vertical, 10)


            }
            .padding(.vertical, 20)
        }
    }
}

struct ApplicationsListView_Previews: PreviewProvider {
    static var previews: some View {

            ApplicationsListView()

    }
}
