#' R Wrapper for Mermaid JS
#'
#' Render a memaidjs file
#'
#' @import htmlwidgets
#'
#' @export
mermaid <- function(diagram = "flowchart LR\n id", config = NULL,
                    width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    diagram = diagram,
    config = config
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'mermaid',
    x,
    width = width,
    height = height,
    package = 'mermaidwidget',
    elementId = elementId
  )
}

#' Shiny bindings for mermaid
#'
#' Output and render functions for using mermaid within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a mermaid diagram.
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name mermaid-shiny
#'
#' @export
mermaidOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'mermaid', width, height, package = 'mermaidwidget')
}

#' @rdname mermaid-shiny
#' @export
renderMermaid <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, mermaidOutput, env, quoted = TRUE)
}
