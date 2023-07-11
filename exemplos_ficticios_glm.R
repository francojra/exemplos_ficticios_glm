# Criar o conjunto de dados fictício
dados <- data.frame(
  tempo_estudo = c(2, 4, 3, 6, 8),
  consumo_cafe = c(1, 2, 3, 2, 1),
  exercicio = c(30, 20, 40, 50, 60),
  concentracao = c(5, 6, 7, 8, 9),
  sono = c(5, 6, 10, 12, 8),
  desempenho = c(60, 65, 70, 75, 80)
)

# Aplicar a função GLM com todas as combinações
modelo <- glm(desempenho ~ ., data = dados, family = Gamma)
modelo1 <- glm(desempenho ~ . * ., data = dados, family = Gamma)

# Visualizar os resultados
summary(modelo)
summary(modelo1)

library(MuMIn)
dd <- dredge(modelo)
subset(dd, delta < 4)

# ------------------------------------------------------------------------------------------------------------------------------------------


# Criar o conjunto de dados fictício
dados <- data.frame(
  tempo_estudo = c(2, 4, 3, 5, 6),
  consumo_cafe = c(1, 2, 3, 2, 1),
  exercicio = c(30, 20, 40, 50, 60),
  concentracao = c(5, 6, 7, 8, 9),
  sono = c(7, 8, 6, 7, 8),
  desempenho = c(60, 65, 70, 75, 80)
)

# Criar todas as combinações possíveis entre as variáveis explicativas
comb_variaveis <- combn(names(dados)[1:5], 1)
interacoes <- apply(comb_variaveis, 2, paste, collapse = "*")
termos <- c(names(dados)[1:5], interacoes)

# Aplicar a função GLM com todas as combinações
formula <- paste("desempenho ~", paste(termos, collapse = "+"))
modelo <- glm(formula, data = dados)

# Visualizar os resultados
summary(modelo)






# Aplicar a função GLM com todas as combinações
modelo <- glm(variavel_independente ~ ., data = dados, family = )

# Visualizar os resultados
summary(modelo)

library(MuMIn)
selecao_modelo <- dredge(modelo)
subset(selecao_modelo, delta < 4)

