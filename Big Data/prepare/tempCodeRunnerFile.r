
missing_columns <- apply(rows_with_missing, 2, function(col) any(is.na(col)))
missing_columns <- names(data)[missing_columns]

for (i in 1:nrow(rows_with_missing)) {
  missing_values <- rows_with_missing[i, ]
  missing_index <- which(missing_rows)[i]
  
  cat("Missing values in row", missing_index, ": \n")
  
  for (column in missing_columns) {
    value <- missing_values[column]
    if (is.na(value)) {
      cat(column, "\n")
    }
  }
  
  cat("\n")
}