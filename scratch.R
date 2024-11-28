tar_load(ice_rasts)

ice_rasts

png_dir <- tempdir()
png_files <- file.path(
  png_dir,
  sprintf("frame%03d.png", seq_len(length(ice_rasts)))
)
par(ask = FALSE)
for(i in seq_len(length(ice_rasts))){
  png(png_files[[i]])
  plot(
    ice_rasts[[i]],
    range = c(0, 100),
    col = gray.colors(n = 100, start = 0, end = 0.9),
    background = "saddlebrown",
    main = time(ice_rasts[[i]])
  )
  dev.off()
}
gif_file <- gifski(png_files = png_files,
                   gif_file = "sea_ice.gif",
                   delay = 0.2)

gif_file




