plugins {
    kotlin("jvm") version "1.9.23"
}

group = "com.buildyourowncode"
version = "1.0-SNAPSHOT"

repositories {
//    jcenter()
    mavenCentral()
    google()
}

dependencies {
//    rootProject.libs
    testImplementation(kotlin("test"))
//    implementation("org.slf4j:slf4j-api:1.7.36")
    implementation("org.xerial:sqlite-jdbc:3.45.3.0")
//    implementation("androidx.sqlite:sqlite:2.4.0")
//    // Kotlin
//    implementation("androidx.sqlite:sqlite-ktx:2.4.0")

//    implementation("androidx.sqlite:sqlite-bundled:2.4.0")
}

tasks.test {
    useJUnitPlatform()
}