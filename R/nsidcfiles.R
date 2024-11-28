#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title

#' @return
#' @author njtierney
#' @export
nsidcfiles <- function(objects = NULL) {
  if (missing(objects)) {
    objects <- idt:::.objects()
  }
  pattern <- c(
    "nsidc\\.org",
    # "NSIDC-0051\\.002",
    "PS_S",
    "nc$"
  )

  files <- idt:::.findfiles(pattern, objects = objects)
  if (nrow(files) < 1) {
    stop("no files found")
  }
  files <- dplyr::mutate(files, date = as.POSIXct(as.Date(stringr::str_extract(
    basename(.data$source),
    "[0-9]{8}"
  ), "%Y%m%d"), tz = "UTC"))
  dplyr::select(
    dplyr::arrange(dplyr::distinct(files, date,
      .keep_all = TRUE
    ), date), .data$date, .data$source, .data$Bucket,
    .data$Key, .data$protocol
  )
}
