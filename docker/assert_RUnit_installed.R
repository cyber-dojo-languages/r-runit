# apt exits non-zero when it cannot fetch a package, so the build already stops
# on a failed download. This asserts the stronger property: that R can load what
# apt installed, and records which version shipped.
if (!requireNamespace('RUnit', quietly = TRUE)) {
  writeLines('ERROR: RUnit is installed but R cannot load it', con = stderr())
  quit(status = 42)
}

writeLines(paste('Installed RUnit', packageVersion('RUnit')))
