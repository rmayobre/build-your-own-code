package com.buildyourowncode.data

sealed class NumberDataType : DataType()

data class IntType(override val isNullable: Boolean = true) : NumberDataType() {

    override val sqlSyntax: String
        get() = "INT"
}

data class FloatType(val m: Int, val d: Int, override val isNullable: Boolean = true) : NumberDataType() {

    override val sqlSyntax: String
        get() =  "FLOAT ($m, $d)"
}

data class DoubleType(val m: Int, val d: Int, override val isNullable: Boolean = true) : NumberDataType() {

    override val sqlSyntax: String
        get() = "DOUBLE ($m, $d)"
}