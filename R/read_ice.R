#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param nameme1
#' @return
#' @author njtierney
#' @export
read_ice <- function(file,
                     time,
                     # casey extent
                     crop_ext = c(
                       2375000,
                       2875000,
                       -1300000,
                       -8e+05
                     )){
  # annoying warning about extents, which we fix later
  ice <- suppressWarnings(terra::rast(file))
  ext(ice) <- ext(-3950000, 3950000, -3950000, 4350000 )
  crs(ice) <- "EPSG:3976"
  cropped_ice <- crop(ice, crop_ext)[[1]]
  # create land
  cropped_ice[cropped_ice > 250] <- NA
  # resolve a scaling issue - due to values being byte encoded
  cropped_ice <- cropped_ice / 2.5
  cropped_ice
  time(cropped_ice) <- time
  cropped_ice
}
