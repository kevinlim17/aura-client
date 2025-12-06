package com.example.aura_client

import android.os.Bundle
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.util.*

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.aura.tts/file"
    private var tts: TextToSpeech? = null
    private var ttsInitialized = false

    init {
        android.util.Log.d("NativeTTS", "=== MainActivity CONSTRUCTOR called ===")
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        android.util.Log.d("NativeTTS", "=== MainActivity onCreate called ===")
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        android.util.Log.d("NativeTTS", "=== configureFlutterEngine called ===")
        android.util.Log.d("NativeTTS", "Registering Method Channel: $CHANNEL")

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            android.util.Log.d("NativeTTS", "Method call received: ${call.method}")
            when (call.method) {
                "synthesizeToFile" -> {
                    val text = call.argument<String>("text")
                    val filename = call.argument<String>("filename")
                    val language = call.argument<String>("language") ?: "ko-KR"
                    val pitch = call.argument<Double>("pitch")?.toFloat() ?: 1.0f
                    val rate = call.argument<Double>("rate")?.toFloat() ?: 1.0f

                    if (text.isNullOrEmpty() || filename.isNullOrEmpty()) {
                        result.error("INVALID_ARGUMENTS", "Text and filename are required", null)
                        return@setMethodCallHandler
                    }

                    synthesizeToFile(text, filename, language, pitch, rate) { filePath ->
                        if (filePath != null) {
                            result.success(filePath)
                        } else {
                            result.error("SYNTHESIS_FAILED", "Failed to synthesize speech to file", null)
                        }
                    }
                }
                "isTtsAvailable" -> {
                    result.success(ttsInitialized)
                }
                "getAvailableVoices" -> {
                    val language = call.argument<String>("language") ?: "ko-KR"
                    val voices = getAvailableVoices(language)
                    result.success(voices)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

        // Initialize TTS
        initializeTts()
    }

    private fun initializeTts() {
        tts = TextToSpeech(this) { status ->
            if (status == TextToSpeech.SUCCESS) {
                ttsInitialized = true
                android.util.Log.d("NativeTTS", "TTS initialized successfully")
            } else {
                ttsInitialized = false
                android.util.Log.e("NativeTTS", "TTS initialization failed")
            }
        }
    }

    private fun synthesizeToFile(
        text: String,
        filename: String,
        language: String,
        pitch: Float,
        rate: Float,
        callback: (String?) -> Unit
    ) {
        if (!ttsInitialized || tts == null) {
            android.util.Log.e("NativeTTS", "TTS not initialized")
            callback(null)
            return
        }

        try {
            // Set language
            val locale = parseLocale(language)
            val languageResult = tts?.setLanguage(locale)
            if (languageResult == TextToSpeech.LANG_MISSING_DATA || languageResult == TextToSpeech.LANG_NOT_SUPPORTED) {
                android.util.Log.e("NativeTTS", "Language not supported: $language")
                callback(null)
                return
            }

            // Set pitch and rate
            tts?.setPitch(pitch)
            tts?.setSpeechRate(rate)

            // Prepare output file
            val outputDir = applicationContext.getExternalFilesDir(null)
            val outputFile = File(outputDir, "$filename.wav")

            android.util.Log.d("NativeTTS", "Synthesizing to: ${outputFile.absolutePath}")
            android.util.Log.d("NativeTTS", "Text length: ${text.length} characters")

            // Set utterance progress listener
            tts?.setOnUtteranceProgressListener(object : UtteranceProgressListener() {
                override fun onStart(utteranceId: String?) {
                    android.util.Log.d("NativeTTS", "Synthesis started")
                }

                override fun onDone(utteranceId: String?) {
                    android.util.Log.d("NativeTTS", "Synthesis completed: ${outputFile.absolutePath}")
                    runOnUiThread {
                        if (outputFile.exists() && outputFile.length() > 0) {
                            callback(outputFile.absolutePath)
                        } else {
                            android.util.Log.e("NativeTTS", "Output file is empty or does not exist")
                            callback(null)
                        }
                    }
                }

                @Deprecated("Deprecated in Java")
                override fun onError(utteranceId: String?) {
                    android.util.Log.e("NativeTTS", "Synthesis error (deprecated callback)")
                    runOnUiThread {
                        callback(null)
                    }
                }

                override fun onError(utteranceId: String?, errorCode: Int) {
                    android.util.Log.e("NativeTTS", "Synthesis error: $errorCode")
                    runOnUiThread {
                        callback(null)
                    }
                }
            })

            // Synthesize to file
            val params = Bundle()
            params.putString(TextToSpeech.Engine.KEY_PARAM_UTTERANCE_ID, filename)

            val result = tts?.synthesizeToFile(text, params, outputFile, filename)

            if (result != TextToSpeech.SUCCESS) {
                android.util.Log.e("NativeTTS", "synthesizeToFile returned error: $result")
                callback(null)
            }
        } catch (e: Exception) {
            android.util.Log.e("NativeTTS", "Exception during synthesis: ${e.message}")
            e.printStackTrace()
            callback(null)
        }
    }

    private fun getAvailableVoices(language: String): List<String> {
        if (!ttsInitialized || tts == null) {
            return emptyList()
        }

        try {
            val locale = parseLocale(language)
            val voices = tts?.voices?.filter { voice ->
                voice.locale.language == locale.language
            }?.map { it.name } ?: emptyList()

            android.util.Log.d("NativeTTS", "Available voices for $language: $voices")
            return voices
        } catch (e: Exception) {
            android.util.Log.e("NativeTTS", "Error getting voices: ${e.message}")
            return emptyList()
        }
    }

    private fun parseLocale(language: String): Locale {
        val parts = language.split("-")
        return when (parts.size) {
            1 -> Locale(parts[0])
            2 -> Locale(parts[0], parts[1])
            else -> Locale(parts[0], parts[1], parts[2])
        }
    }

    override fun onDestroy() {
        tts?.stop()
        tts?.shutdown()
        super.onDestroy()
    }
}