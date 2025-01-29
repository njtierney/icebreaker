#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param ice_rasts
#' @return
#' @author njtierney
#' @export
summarise_ice <- function(ice_rasts) {

  ice_fivenum <- fivenum(values(ice_rasts)) |>
    setNames(c("min", "q1", "median", "q3", "max"))

  summary_data <- ice_fivenum |>
  as.list() |>
    as_tibble() |>
    mutate(
      time = time(ice_rasts),
      .before = everything()
    )

  summary_data

}
