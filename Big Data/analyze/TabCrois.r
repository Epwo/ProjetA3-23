tableau_croise <- function(df, var1, var2) {
    table <- ftable(df[[var1]], df[[var2]])
    # Create plot
    cont <- stats:::format.ftable(table,quote=FALSE)
    write.table(cont,sep=';',file = paste("Big Data/plots/crossTab",var1,"-",var2,".csv"))
    return(table)
}
