@objc(NativeInput) class NativeInput : CDVPlugin {
    func echo(_ command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult(
                status: CDVCommandStatus_ERROR
        )

        let msg = command.arguments[0] as? String ?? ""

        if msg.characters.count > 0 {
            // Swiftの場合
            let alert = NSAlert()
            alert.messageText = "入力エラー"
            alert.informativeText = msg
            alert.addButton(withTitle: "わかりました")
            alert.runModal()



            pluginResult = CDVPluginResult(
                    status: CDVCommandStatus_OK,
                    messageAs: msg
            )
        }

        self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
        )
    }
}
