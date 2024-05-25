package com.buildyourowncode.data

sealed class TimeDataType : DataType()

data class DateType(override val isNullable: Boolean = true) : TimeDataType() {
    override val sqlSyntax: String
        get() = "DATE"
}

data class TimeType(override val isNullable: Boolean = true) : TimeDataType() {
    override val sqlSyntax: String
        get() = "TIME"
}