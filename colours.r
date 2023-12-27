x = c(24, 13, 7, 5, 3, 2)
barplot(x)

barplot(x, col = "red3")
barplot(x, col = "slategray3")

barplot(x, col= rgb(255, 0, 0, max = 255))

barplot(x, col = c("red3", "slategray3"))


barplot(x, col= rainbow(6))