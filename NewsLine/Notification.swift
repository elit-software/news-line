import UIKit
import UserNotifications

class Notification {

    static func requestAndRegister(application: UIApplication, delegate: UNUserNotificationCenterDelegate) {
        requestNotificationsAuthorization(delegate: delegate)
        application.registerForRemoteNotifications()
    }

    static func requestNotificationsAuthorization(delegate: UNUserNotificationCenterDelegate) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("requestNotificationsAuthorizationGranted? \(granted)")
        }
        center.delegate = delegate
    }
}
