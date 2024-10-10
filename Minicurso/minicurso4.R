library(ggplot2)
ggplot(data = iris)
ggplot(
  data = iris,
  mapping = aes(x = Petal.Length, y = Petal.Width, shape = Species)
) +
  geom_point()

ggplot(
  data = iris,
  mapping = aes(x = Petal.Length, y = Petal.Width, color = Species, shape = Species)
) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot(
  data = iris,
  mapping = aes(color = especie)
) +
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width)) +
  geom_smooth(method = "lm")  

ggplot(data = iris) + geom_point(mapping = aes(x = Petal.Length, y = Petal.Width)) + labs(title = "Gráfico de Dispersão", x = "Comprimento da Pétala", y = "Largura da Pétala")

ggplot(data = iris, mapping = aes(x = Species)) + geom_bar(
  mapping = aes(fill = Species)
)

ggplot(data = iris, mapping = aes(x = Petal.Length)) + geom_histogram(
  mapping = aes(fill = Species),
  binwidth = 0.5
)

ggplot(data = iris, mapping = aes(x = Sepal.Length)) + geom_density(
  mapping = aes(fill = Species), alpha = 0.5
) + labs(title = "Densidade de Sepal.Length", x = "Comprimento da Sépala", y = "Densidade", fill = "Espécie")

normalize = function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

library(dplyr)

normalize <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

mutate(
  iris,
  Petal.Length = normalize(Petal.Length),
  Petal.Width = normalize(Petal.Width)
) |>
  ggplot() +
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width))
