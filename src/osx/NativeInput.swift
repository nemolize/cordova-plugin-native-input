@objc(NativeInput) class NativeInput: CDVPlugin {
    func echo(_ command: CDVInvokedUrlCommand) {

        self.commandDelegate.run(inBackground: {
            let msg = command.arguments[0] as? String ?? ""

            if msg.characters.count > 0 {
                // Swiftの場合
//                let alert = NSAlert()
//                alert.messageText = "入力エラー"
//                alert.informativeText = msg
//                alert.addButton(withTitle: "わかりました")
//                alert.runModal()


                let pluginResult: CDVPluginResult = CDVPluginResult(
                        status: CDVCommandStatus_OK,
                        messageAs: msg
                )
                pluginResult.setKeepCallbackAs(true)

                self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
                print("done")
                pluginResult.setKeepCallbackAs(false)
                self.commandDelegate.send(pluginResult, callbackId: command.callbackId)

            }
        })

        let pluginResult: CDVPluginResult = CDVPluginResult(status: CDVCommandStatus_NO_RESULT)
        pluginResult.setKeepCallbackAs(true)


        self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
        )
    }
}
