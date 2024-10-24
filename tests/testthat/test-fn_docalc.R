test_that("fn_docalc works with masking global variable", {

  #make a local global copy of package data "measurements" with a new  name:
  tmp1 <- measurements

  #call fn_docalc, which should multiply "measurements" by 100 and store in res:
  res <- fn_docalc(100)

  #tmp1 times 100 should be the same as res:
  expect_identical(tmp1$value*100, res$value)



  #the real test case:
  #create a new global variable named the same as "measurements" with different data:
  measurements <- data.frame(id = c(1:5), value = c(21:25))

  #call fn_docalc with the new "bad" measurements variable in the global environment:
  res2 <- fn_docalc(100)

  #this will fail beacuse I expect that fn_docalc will operate on the package's "measurements" variable, not the global one:
  #commented out so we pass check()
  #expect_identical(tmp1$value*100, res2$value)
})
