import SwiftUI

struct UserSettingView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                Group {
//                    NavigationLink(destination: UserSettingView()) {
                        Cell(title: "更改密码")
//                    }
                    Line()
                }
                Group {
                            Cell(title: "更改名称")
                            Line()
                        }

                }
            .background(Color("White"))
        }.background(Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 0.1))
        
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarItems(leading:
                                ZStack{
                                    HStack{
                                        Spacer(minLength: 0.5*W)
                                        Text("账号与安全")
                                        Spacer(minLength: 0.5*W)
                                    }
                                    HStack{
                                        Spacer()
                                        Button(action:{
                                            self.presentationMode.wrappedValue.dismiss()
                                        }){
                                            Image(systemName: "chevron.left")
                                            .foregroundColor(.primary)
                                        }
                                        Spacer(minLength: W*0.99)


                                    }
                                })

    }


struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
    }
}

private struct Cell: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .padding()
        }
        .frame(height: 54)
    }
}
}
