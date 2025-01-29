#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param ice_summary
#' @return
#' @author njtierney
#' @export
gg_ice <- function(ice_summary) {

  ggplot(ice_summary,
         aes(x = time,
             y = median)) +
    geom_line(colour = "grey10") +
    geom_ribbon(aes(ymin = q1,
                    ymax = q3),
                fill = "steelblue1",
                alpha = 0.3) +
    theme_minimal()

}
