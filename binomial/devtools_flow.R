#Devtools Workflow:
#requires devtools!


# in order to install vignettes use devtools::install(build_vignettes = TRUE)
devtools::document()
devtools::check_man()
devtools::test()
devtools::build_vignettes()
devtools::build()
devtools::install()
.rs.restartR()
