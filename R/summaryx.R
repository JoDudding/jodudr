#' Create distribution stats for a variable
#'
#' @param data A dataframe/tibble
#' @param var A numeric variable
#'
#' @return A tibble containing summary stats
#' @export
#'
#' @examples
#' dplyr::as_tibble(mtcars) |> summaryx(mpg)
summaryx <- function(data, var) {
  data |>
    dplyr::summarise(
      min = min({{ var }}, na.rm = TRUE),
      p1 = stats::quantile({{ var }}, probs = 0.01, na.rm = TRUE, names = FALSE),
      p5 = stats::quantile({{ var }}, probs = 0.05, na.rm = TRUE, names = FALSE),
      p10 = stats::quantile({{ var }}, probs = 0.1, na.rm = TRUE, names = FALSE),
      p25 = stats::quantile({{ var }}, probs = 0.25, na.rm = TRUE, names = FALSE),
      median = stats::median({{ var }}, na.rm = TRUE),
      p75 = stats::quantile({{ var }}, probs = 0.75, na.rm = TRUE, names = FALSE),
      p90 = stats::quantile({{ var }}, probs = 0.9, na.rm = TRUE, names = FALSE),
      p95 = stats::quantile({{ var }}, probs = 0.95, na.rm = TRUE, names = FALSE),
      p99 = stats::quantile({{ var }}, probs = 0.99, na.rm = TRUE, names = FALSE),
      max = max({{ var }}, na.rm = TRUE),
      n_obs = dplyr::n(),
      sum = sum({{ var }}, na.rm = TRUE),
      mean = mean({{ var }}, na.rm = TRUE),
      sd = stats::sd({{ var }}, na.rm = TRUE),
      lci_95 = mean({{ var }}, na.rm = TRUE) -
        stats::qnorm(0.975) * stats::sd({{ var }}, na.rm = TRUE),
      uci_95 = mean({{ var }}, na.rm = TRUE) +
        stats::qnorm(0.975) * stats::sd({{ var }}, na.rm = TRUE),
      n_miss = sum(is.na({{ var }})),
      n_zero = sum({{ var }} == 0, na.rm = TRUE),
      pct_miss = mean(is.na({{ var }})),
      .groups = "drop"
    ) |>
    dplyr::mutate(
      pct_zero = n_zero / n_obs
    )
}
