import Combine
import Foundation
import LocalAuthentication

class ContentViewModel: ObservableObject {
    
    private let didChange = PassthroughSubject<ContentViewModel, Never>()
    @Published var bHasBiometric = false {
        didSet {
            didChange.send(self)
        }
    }
    @Published var bSuccess = false {
        didSet {
            didChange.send(self)
        }
    }
    @Published var strBiometrico = "" {
        didSet {
            didChange.send(self)
        }
    }
    
    private let laContext = LAContext()
    
    init() {
        validaBiometrico()
    }
    
    private func validaBiometrico() {
        var error: NSError?
        bHasBiometric = laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        print(laContext.biometryType.rawValue)
        if laContext.biometryType == .none {
            strBiometrico = "Usuario y contraseña"
        }
        if laContext.biometryType == .touchID {
            strBiometrico = "Touch ID"
        }
        if laContext.biometryType == .faceID {
            strBiometrico = "Face ID"
        }
    }
    
    public func autenticate() {
        laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Porfis autenticate") { bAcces, error in
            DispatchQueue.main.async {
                print(bAcces)
                self.bSuccess = bAcces
            }
        }
    }
    
}
