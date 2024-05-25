package com.buildyourowncode

import java.nio.file.Paths
import java.sql.DriverManager

private const val JDBC_SQLITE_PROTOCOL = "jdbc:sqlite"
private const val RESOURCE_DIR = "/src/main/resources"
private const val DATABASE_FILE = "test_sqlite.db"

fun main() {
    val projectDirAbsolutePath = Paths.get("").toAbsolutePath().toString()
    val resourcesDirPath = Paths.get(projectDirAbsolutePath, RESOURCE_DIR)
    val connection = DriverManager.getConnection("$JDBC_SQLITE_PROTOCOL:$resourcesDirPath/$DATABASE_FILE")
    connection.close()
    println("Connection closed!")
//    sql {
//        select {
//            column("my_column")
//            from {
//
//            }
//        }
//    }
}