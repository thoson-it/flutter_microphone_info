package it.thoson.microphone_info

import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.media.MicrophoneInfo
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*

/** MicrophoneInfoPlugin */
class MicrophoneInfoPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "microphone_info")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
//        val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
//        val microphones: List<MicrophoneInfo> = audioManager.microphones
        val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
        val microphones: Array<AudioDeviceInfo> = audioManager.getDevices(AudioManager.GET_DEVICES_INPUTS)
        val microphonesMap: ArrayList<Map<String, Any>> = ArrayList()
        microphones.forEach {
            val map = mutableMapOf<String, Any>()
            map["type"] = it.type
            map["id"] = it.id
            microphonesMap.add(map)
        }
        if (call.method == "getMicrophoneInfo") {
            result.success(microphonesMap)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
