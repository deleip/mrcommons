#' @importFrom magclass getRegionList<-
#' @importFrom luscale groupAggregate
convertLUH2v2<-function(x,subtype){
  
  x <- toolCoord2Isocell(x)
  mapping <- toolMappingFile(type="cell",name="CountryToCellMapping.csv",readcsv=TRUE)
  getRegionList(x) <- rep("GLO",ncells(x))
  out  <- groupAggregate(data = x,query = mapping,from="cell",to="iso",dim=1)
  out  <- toolCountryFill(out,fill=0, verbosity = 2)
  return(out)
}
