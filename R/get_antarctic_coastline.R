#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title

#' @return
#' @author njtierney
#' @export
get_antarctic_coastline <- function(ice_rasts) {

  coastline <- vect(
    "/vsizip//vsicurl/https://github.com/wmgeolab/geoBoundaries/raw/main/releaseData/CGAZ/geoBoundariesCGAZ_ADM0.zip",
    query = "SELECT shapeGroup FROM geoBoundariesCGAZ_ADM0 WHERE shapeGroup IN ('ATA')")

  coastline <- project(coastline,
                       crs(ice_rasts[[1]]))

  coastline
}
