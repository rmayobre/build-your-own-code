package com.buildyourowncode.data

sealed class StringDataType : DataType()

data class CharType(val size: Int, override val isNullable: Boolean = true) : StringDataType() {

    override val sqlSyntax: String
        get() = "CHAR ($size)"

    init {
        require(size in 0..255)
    }
}

data class VarCharType(val size: Int, override val isNullable: Boolean = true) : StringDataType() {

    override val sqlSyntax: String
        get() = "VARCHAR ($size)"

    init {
        require(size in 0..65535)
    }
}

data class TextType(override val isNullable: Boolean = true) : StringDataType() {

    override val sqlSyntax: String
        get() = "TEXT"
}