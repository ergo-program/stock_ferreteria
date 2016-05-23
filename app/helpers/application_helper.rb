module ApplicationHelper
	LONGITUD_TEXTO = 20 # longitud maxima del texto

  # Diminuye el contenido de la tabla
  def disminuir(texto)
    html = ""
    html << "<div class='on-hover' data-toggle='popover' data-placement='top' data-content='#{texto}'>" if texto.size > LONGITUD_TEXTO
      html << truncate(texto, length: LONGITUD_TEXTO, separator: ' ')
    html << '</div>' if texto.size > LONGITUD_TEXTO
    html.html_safe
  end
end
