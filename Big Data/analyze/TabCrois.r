library(gridExtra)
tableau_croise <- function(df, var1, var2) {
    table <- ftable(df[[var1]], df[[var2]])
    # Create plot
    write.table(table, file = "Big Data/plots/cc.pdf.txt", sep = ",", quote = FALSE, row.names = F)
    return(table)
}
