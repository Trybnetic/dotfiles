# Start
.First <- function() {
  # Print a welcome message
  message("Welcome back ", Sys.getenv("USER"),"!\n","Working directory is: ", getwd())
  # Set local lib path
  .libPaths("/home/trybnetic/.R/")

  # colorize R output,
  if (interactive()) {
    library(colorout)
  }
}

# Set CRAN repository
options(repos = structure(c(CRAN = "https://cran.hafro.is/")))

# customize your R prompt
options(prompt = paste(paste(Sys.info()[c("user", "nodename")], collapse = "@"),"[R] > "))
