library(tidyverse)
library(data.table)
library(recommenderlab)
library(jsonlite)

load("recommender")

#' @get /recommend/<memberid>
recommend_products <- function(memberid) {
  recom <- as_data_frame(as(predict(productrecommender, transactionsbi[memberid,], n = 3), "list"), stringsAsFactors = "FALSE")
  colnames(recom) <- "PRODUCT_ID"
  recomproduct <- recom %>% left_join(products)
  return(toJSON(recomproduct))
}

#' @get /history/<memberid>
product_history <- function(memberid) {
  toJSON(transactions_small[MEMBER_ID == memberid] %>% left_join(products))
}
