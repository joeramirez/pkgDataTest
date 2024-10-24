test_that("fn_docalc2 works with masking global variable", {

  #make a local global copy of package data "measurements" with a new  name:
  tmp1 <- measurements2

  #call fn_docalc, which should multiply "measurements" by 100 and store in res:
  res <- fn_docalc2(100)

  #tmp1 times 100 should be the same as res:
  expect_identical(tmp1$value*100, res$value)



  #the real test case:
  #create a new global variable named the same as "measurements" with different data:
  measurements2 <- data.frame(id = c(1:5), value = c(21:25))

  #call fn_docalc with the new "bad" measurements variable in the global environment:
  res2 <- fn_docalc2(100)

  expect_identical(tmp1$value*100, res2$value)
})
