# install.packages() reports an unavailable package as a warning, not an error,
# so Rscript exits zero and the image ships without RUnit. Loading it here is
# what turns that into a failed build.
# CRAN's CDN first: it carries the newest RUnit, and CRAN asks automated builds
# to use a mirror rather than cran.r-project.org itself. The r-universe entry is
# a fallback for CRAN dropping RUnit again, and is one person's namespace, so it
# is not the first choice.
install.packages('RUnit', repos = c('https://cloud.r-project.org', 'https://romanzenka.r-universe.dev'))

if (!requireNamespace('RUnit', quietly = TRUE)) {
  writeLines('ERROR: RUnit did not install; see the install.packages output above', con = stderr())
  quit(status = 42)
}

writeLines(paste('Installed RUnit', packageVersion('RUnit')))
