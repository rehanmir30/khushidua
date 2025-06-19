# Flutter Sound Record plugin keep rules
-keep class com.josephcrowell.flutter_sound_record.** { *; }

# Keep Flutter Engine & plugins
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.engine.** { *; }
-keep class io.flutter.** { *; }

# Avoid stripping classes used by reflection
-keep class * extends io.flutter.plugin.common.MethodCallHandler
-keep class * extends io.flutter.plugin.common.EventChannel$StreamHandler
