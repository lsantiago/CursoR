# 1 Extraer datos que se disponen en R

data("CO2")
data("airquality")

# 2 Extraiga como un data.frame la
# variable de "conc" con los caos(filas)
# donde tipo (Type) es igual a Quebec

dfconc <- CO2["conc"][CO2["Type"]=="Quebec"]
dfconc
typeof(dfconc)


dfuptake <- CO2["uptake"][CO2["Type"]!="Quebec"]
dfuptake

typeof(dfconc)

# Covierta el data.frame de aiquality en una
# matriz. Use la función as.matrix

mairqual <- as.matrix(airquality)
windfilter <- mairqual["Ozone">30,3]

mairqual[c(54, 23)]



