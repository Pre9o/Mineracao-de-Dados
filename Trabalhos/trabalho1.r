library(jsonlite)
library(stringi)
library(arules)


corrigir_json <- function(file_path) {
  if (!file.exists(file_path)) {
    stop("O arquivo não existe: ", file_path)
  }
  
  json_text <- readLines(file_path, warn = FALSE)
  
  dentro_produtos <- FALSE
  for (i in seq_along(json_text)) {
    if (grepl('"produtos": \\[', json_text[i])) {
      dentro_produtos <- TRUE
    } 
    
    if (dentro_produtos && grepl('\\]', json_text[i])) {
      dentro_produtos <- FALSE
    }
    
    if (dentro_produtos) {
      if (grepl('\\]', json_text[i + 1])) {
        json_text[i] <- gsub('"(.*?)"(?!,)', '"\\1"', json_text[i], perl = TRUE)
      } else {
        json_text[i] <- gsub('"(.*?)"(?!,)', '"\\1",', json_text[i], perl = TRUE)
      }
    }

    json_text[i] <- gsub('"produtos",:', '"produtos":', json_text[i])

  }
  
  
  writeLines(json_text, "padaria_trab_corrigido.json")
}

file_path <- "Trabalhos/padaria_trab.json"

corrigir_json(file_path)

data <- fromJSON("padaria_trab_corrigido.json", simplifyVector = FALSE)

corrigir_caracteres <- function(texto) {
  return(stri_unescape_unicode(texto))
}

modificar_nome_produto <- function(produto) {
  produto <- tolower(produto)
  produto <- strsplit(produto, " ")[[1]][1]
  return(produto)
}

for (i in seq_along(data)) {
  data[[i]]$compra <- i
  data[[i]]$produtos <- sapply(data[[i]]$produtos, corrigir_caracteres)
  #data[[i]]$produtos <- sapply(data[[i]]$produtos, modificar_nome_produto)
}

write_json(data, "padaria_trab_modificado.json", pretty = TRUE)

produtos_list <- lapply(data, function(x) x$produtos)

transacoes <- as(produtos_list, "transactions")

regras <- apriori(transacoes, parameter = list(supp = 0.05, conf = 0.4))

regras <- subset(regras, size(lhs(regras)) > 0)

regrasDoce <- apriori(transacoes, parameter = list(supp = 0.02, conf = 0.3))

subsetRegrasDoce <- subset(regrasDoce, size(lhs(regrasDoce)) > 0)

subsetRegrasDoce <- subset(subsetRegrasDoce, rhs(subsetRegrasDoce) %in% "Doce")

inspect(regras)

inspect(subsetRegrasDoce)
