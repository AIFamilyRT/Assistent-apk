
#!/bin/bash
set -e
mkdir -p app/build
export ANDROID_JAR=$PREFIX/share/aapt/android.jar
find app/src/main/java -name "*.java" > sources.txt
javac -source 1.8 -target 1.8 -d app/build -cp "$ANDROID_JAR" @sources.txt
cd app/build && jar cf ../assistent.jar .
cd ../..
aapt package -f -M AndroidManifest.xml -S app/src/main/res -I $ANDROID_JAR -F assistent.unaligned.apk app
dx --dex --output=classes.dex app/assistent.jar
aapt add assistent.unaligned.apk classes.dex
zipalign -f 4 assistent.unaligned.apk Assistent.apk
apksigner sign --ks debug.keystore --ks-pass pass:android --key-pass pass:android --out Assistent-signed.apk Assistent.apk
