## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
tar_source()

# facilitate this working in parallel
controller <- crew_controller_local(
  name = "my_controller",
  workers = 4,
  seconds_idle = 3
)

tar_option_set(
  controller = controller
)

## tar_plan supports drake-style targets and also tar_target()
tar_plan(

  files = nsidcfiles(),

  # files_to_read_in = tail(files, 5000),
  files_to_read_in = tail(files, 100),

  ice_files = files_to_read_in$source,
  ice_dates = files_to_read_in$date,

  # then next let's add a crossing with another station

  tar_terra_rast(
    ice_rasts,
    read_ice(ice_files, ice_dates),
    pattern = map(ice_files, ice_dates)
  ),

  tar_file(
    ice_gifs,
    write_ice_gif(ice_rasts = ice_rasts,
                  gif_file = "sea_ice.gif")
  )


)
