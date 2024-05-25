package com.buildyourowncode

@JvmInline
value class Column(val name: String) {

    companion object {

        const val ALL_COLUMNS_VALUE = "*"

        val ALL = Column(ALL_COLUMNS_VALUE)
    }
}
