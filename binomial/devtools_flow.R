#Devtools Workflow:
#requires devtools!


# if you don't need vignettes in index run with build_vignettes = FALSE
# in devtools::install()
devtools::document()
devtools::check_man()
devtools::test()
devtools::build_vignettes()
devtools::build()
devtools::install(build_vignettes = TRUE)
.rs.restartR()
