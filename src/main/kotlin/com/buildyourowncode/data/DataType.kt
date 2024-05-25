package com.buildyourowncode.data

sealed class DataType {

    abstract val isNullable: Boolean

    protected abstract val sqlSyntax: String

    fun toSqlSyntax(): String = buildString {
        append(sqlSyntax)
        if (isNullable) append(" NOT NULL")
    }
}