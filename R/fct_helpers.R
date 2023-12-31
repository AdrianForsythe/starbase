#' helpers
#'
#' @description function for generating an entry form
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
library(shiny)

#Form for data entry
entry_form <- function(button_id){
  showModal(
    modalDialog(
      div(id=("entry_form"),
          tags$head(tags$style(".modal-dialog{ width:400px}")),
          tags$head(tags$style(HTML(".shiny-split-layout > div {overflow: visible}"))),
          fluidPage(
            fluidRow(
              textInput("uploader",label = labelMandatory("Name of curator")),
              textInput("evidence",label=labelMandatory("What evidence exists for Starship annotation?")),
              textInput("genus",label = labelMandatory("Enter genus name")),
              textInput("species",label = labelMandatory("Enter species name")),
              
              # TODO: store file and put path in SQL table
              fileInput("fna",label = labelMandatory("Upload Starship sequence"),accept = c(".fa",".fna",".fasta")),
              fileInput("gff3",label = labelMandatory("Upload Starship annotations (GFF3 format)"),accept = c(".gff",".gff3")),
              textAreaInput("comment", "Comment", placeholder = "", height = 100, width = "354px"),
              helpText(labelMandatory(""), paste("Mandatory field.")),
              actionButton(button_id, "Submit")
            ),
            easyClose = TRUE
          )
      )
    )
  )
}
    
# save form data into data_frame format
formData <- reactive({
  formData <- data.frame(
    fna = input$fna,
    starshipID = input$starshipID,
    ome = input$ome,
    gff3 = input$gff3,
    genus = input$genus,
    species = input$species,
    strain = input$strain,
    version = input$version,
    biosample = input$biosample,
    assembly_acc = input$assembly_acc,
    acquisition_date = input$acquisition_date,
    genomeSource = input$genomeSource,
    published = input$published,
    clade = input$clade,
    kingdom = input$kingdom,
    phylum = input$phylum,
    subphylum = input$subphylum,
    class = input$class,
    subclass = input$subclass,
    order = input$order,
    family = input$family,
    subfamily = input$subfamily,
    suborder = input$suborder,
    superfamily = input$superfamily,
    tribe = input$tribe,
    evidence = input$evidence,
    source = input$source,
    X.contigID = input$X.contigID,
    captainID = input$captainID,
    elementBegin = input$elementBegin,
    elementEnd = input$elementEnd,
    size = input$size,
    strand = input$strand,
    boundaryType = input$boundaryType,
    emptySiteID = input$emptySiteID,
    emptyContig = input$emptyContig,
    emptyBegin = input$emptyBegin,
    emptyEnd = input$emptyEnd,
    emptySeq = input$emptySeq,
    upDR = input$upDR,
    downDR = input$downDR,
    DRedit = input$DRedit,
    upTIR = input$upTIR,
    downTIR = input$downTIR,
    TIRedit = input$TIRedit,
    nestedInside = input$nestedInside,
    containNested = input$containNested,
    dr = input$dr,
    tir = input$tir,
    starship_family = input$starship_family,
    starship_navis = input$starship_navis,
    starship_haplotype = input$starship_haplotype,
    code = input$code,
    target = input$target,
    spok = input$spok,
    ars = input$ars,
    other = input$other,
    hgt = input$hgt,
    taxid = input$taxid,
    superkingdom = input$superkingdom,
    subkingdom = input$subkingdom,
    checksum = input$checksum,
    rowid = UUIDgenerate(),
    stringsAsFactors = FALSE)
  return(formData)
  
})