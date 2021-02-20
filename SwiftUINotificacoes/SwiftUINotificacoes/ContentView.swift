//
//  ContentView.swift
//  SwiftUINotificacoes
//
//  Created by admin on 20/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Enviar Notificação") {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
                success, error in
                if success {
                    print("autorizacao garantida")
                } else if let error = error {
                    print(error.localizedDescription)
                }
                
                let content = UNMutableNotificationContent()
                
                content.title = "SwiftUI Notification App"
                
                content.subtitle = "enviada a partir do meu app"
                
                content.body = " Notificação Disparada"
                
                content.sound = UNNotificationSound.default
                
                let imageName = "applelogo"
                
                guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else {
                    return
                }
                
                let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
                
                content.attachments = [attachment]
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                
                let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
               
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


