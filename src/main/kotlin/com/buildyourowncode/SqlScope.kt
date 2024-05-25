package com.buildyourowncode

fun sql(scope: SqlScope.() -> Unit) {

}

interface SqlScope {

    fun create(scope: CreateScope.() -> Unit)
    fun insert(scope: InsertScope.() -> Unit)
    fun update(scope: UpdateScope.() -> Unit)
    fun delete(scope: DeleteScope.() -> Unit)
    fun select(scope: SelectScope.() -> Unit)
}

interface SelectScope {

    fun all()

    fun column(name: String)

    fun columns(vararg name: String)

    fun from(scope: FromScope.() -> Unit)
}

interface DeleteScope

interface CreateScope {

    fun database(name: String)
}

interface DropScope

interface InsertScope

interface UpdateScope

interface FromScope