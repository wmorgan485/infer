test_that("aliases work", {
  expect_equal(
    gss_calc %>%
      get_pvalue(obs_stat = -0.2, direction = "right") %>%
      dplyr::pull(),
    expected = 1,
    tolerance = eps
  )

  expect_silent(gss_permute %>% get_ci())
})

test_that("old aliases produce warning", {
  expect_snapshot(
    res <- gss_calc %>%
      p_value(obs_stat = -0.2, direction = "right") %>%
      dplyr::pull()
  )

  expect_equal(res, 1)

  expect_snapshot(res_ <- gss_permute %>% conf_int())
})
