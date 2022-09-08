import SwiftUI

struct ContentView: View {
    
    @StateObject private var contentViewModel = ContentViewModel()
    
    var body: some View {
        if contentViewModel.bSuccess {
            Text("Estas Adentro :D")
        } else {
            VStack {
                Text("Autenticate")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Text(contentViewModel.strBiometrico)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Button {
                    contentViewModel.autenticate()
                } label: {
                    Text("Login")
                        .padding([.leading, .trailing], 35)
                        .padding([.top, .bottom], 7)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                .accentColor(.red)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
