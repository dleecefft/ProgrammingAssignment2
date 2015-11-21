plusFunc <- function(){
    plustwo <- function(y) {
        x <-y +2
        return(x)
    }
    plusthree <- function(y){
        x <- y +3
        return(x)
    }
    list(plustwo = plustwo, plusthree = plusthree)
}