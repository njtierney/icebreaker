#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title

#' @return
#' @author njtierney
#' @export
amsrfiles <- function() {
  seaice <- sooty::datasource(id = "antarctica-amsr2-asi-s3125-tif")
  data.frame(
    date = seaice@source$date,
    source = seaice@source$source
  )
}
