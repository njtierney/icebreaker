#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param ice_rasts
#' @param gif_file
#' @return
#' @author njtierney
#' @export
write_ice_gif <- function(ice_rasts = ice_rasts,
                          ice_map = ice_map,
                          gif_file = "sea_ice.gif") {

  png_dir <- tempdir()
  png_files <- file.path(
    png_dir,
    sprintf("frame%03d.png", seq_len(length(ice_rasts)))
  )
  par(ask = FALSE)
  for(i in seq_len(length(ice_rasts))){
    png(png_files[[i]])
    date_title <- format(time(ice_rasts[[i]]), "%d %B %Y")
    plot(
      ice_rasts[[i]],
      range = c(0, 100),
      col = gray.colors(n = 100, start = 0, end = 0.9),
      background = "black",
      main = date_title
    )
    plot(
      ice_map,
      lwd = 2,
      border = "hotpink",
      add = TRUE
    )
    dev.off()
  }
  gif_file <- gifski(png_files = png_files,
                     gif_file = gif_file,
                     delay = 0.2)

  gif_file


}
