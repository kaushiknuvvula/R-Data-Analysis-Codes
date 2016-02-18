
library(datasets)
library(arules)
data("Groceries")
summary(Groceries)
rules <- apriori(Groceries, parameter=list(support=0.001,confidence=0.5))
rules
inspect(head(sort(rules,by="lift"),3))

# Scatter
plot(rules)
plot(rules,measure=c("support","lift"),shading="confidence")
plot(rules,measure=c("support","lift"),shading="confidence",interactive=T)
plot(rules,shading="order",control=list(main="Two-key plot"))

# Matrix-based
subrules <- rules[quality(rules)$confidence > 0.8]
plot(subrules,method="matrix",measure="lift")
plot(subrules,method="matrix",measure="lift",control=list(reorder=T))
plot(subrules,method="matrix",measure=c("lift","confidence"))
plot(subrules,method="matrix",measure=c("lift","confidence"),control=list(reorder=T))
plot(subrules,method="matrix3D",measure="lift")
plot(subrules,method="matrix3D",measure="lift",control=list(reorder=T))

# Grouped Matrix-based
plot(rules,method="grouped")
plot(rules,method="grouped",control=list(k=50))

# Graph-based 
subrules2 <- head(sort(rules, by="lift"), 10)
plot(subrules2, method="graph")
plot(subrules2, method="graph",control=list(type="items"))

# parallel coordinates
plot(subrules2, method="paracoord")
plot(subrules2, method="paracoord",control=list(reorder=T))

# Double Decker
oneRule <- sample(rules,1)
inspect(oneRule)
plot(oneRule,method="doubledecker",data=Groceries)
