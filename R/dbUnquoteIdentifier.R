#' Unquote identifiers
#'
#' Call this method to convert a [SQL] object created by [dbQuoteIdentifier()]
#' back to a list of [Id] objects.
#'
#' @inheritParams dbGetQuery
#' @param x An [SQL] or [Id] object.
#' @param ... Other arguments passed on to methods.
#'
#' @template methods
#' @templateVar method_name dbUnquoteIdentifier
#'
#' @inherit DBItest::spec_sql_unquote_identifier return
#' @inheritSection DBItest::spec_sql_unquote_identifier Failure modes
#' @inheritSection DBItest::spec_sql_unquote_identifier Specification
#'
#' @family DBIResult generics
#' @export
#' @examples
#' # Unquoting allows to understand the structure of a
#' # possibly complex quoted identifier
#' dbUnquoteIdentifier(
#'   ANSI(),
#'   SQL(c('"Catalog"."Schema"."Table"', '"Schema"."Table"', '"UnqualifiedTable"'))
#' )
#'
#' # The returned object is always a list,
#' # also for Id objects
#' dbUnquoteIdentifier(
#'   ANSI(),
#'   Id(catalog = "Catalog", schema = "Schema", table = "Table")
#' )
#'
#' # Quoting is the inverse operation to unquoting the elements
#' # of the returned list
#' dbQuoteIdentifier(
#'   ANSI(),
#'   dbUnquoteIdentifier(ANSI(), SQL("UnqualifiedTable"))[[1]]
#' )
#'
#' dbQuoteIdentifier(
#'   ANSI(),
#'   dbUnquoteIdentifier(ANSI(), Id(schema = "Schema", table = "Table"))[[1]]
#' )
setGeneric("dbUnquoteIdentifier",
  def = function(conn, x, ...) standardGeneric("dbUnquoteIdentifier")
)
