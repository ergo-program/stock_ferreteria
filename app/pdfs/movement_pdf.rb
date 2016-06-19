class MovementPdf < Prawn::Document
  def initialize(movement, view)
    super(top_margin: 70)
    @movement = movement
    @view = view
    
    move_down(15)
    stroke_horizontal_rule
    move_down(20)
    movement_inicio
    move_down(15)
    movements    
    move_down(15)
    movement_fin

    repeat :all do
      #header
      margen=0
      unless Parameter.first.imagen.file.nil?
        image "#{Rails.root}/public/#{Parameter.first.imagen}", height: 50, width: 100, at: [bounds.left, bounds.top+50]
        margen=130
      end
      bounding_box([bounds.left+margen, bounds.top+50], :width => 200, :height => 100) do
        text "#{Parameter.first.nombre}", :size => 20, :style => :bold_italic
        text "Direccion: #{Parameter.first.direccion}", :size => 8, :style => :italic
        text "Telefono: #{Parameter.first.telefono}", :size => 8, :style => :italic
        text "Email: #{Parameter.first.email}", :size => 8, :style => :italic
      end
      #footer
      number_pages "Pag. <page> de <total>", at: [200,-10], :size => 8
      number_pages "Impreso el #{Time.now}", at: [bounds.right-200,-10], width: 200, align: :right, :size => 8
    end
  end

  protected

  def movement_inicio
    text "Detalle de compra", align: :center, size: 15, style: :bold
    move_down(10)
    text "Fecha: #{fecha_format(@movement.fecha)}", size: 10
    if @movement.person_id.present?
      text "Cliente: #{@movement.person_nombre}", size: 10
      text "RUC o C.I.: #{@movement.person_documento}", size: 10
      text "Dirección: #{@movement.person_direccion}", size: 10
      text "Teléfono: #{@movement.person_telefono}", size: 10
    end
  end

  def movement_fin
    text "Total: #{price(@movement.d_movements.sum(:total))}", size: 10, style: :bold
  end
  
  def movements
    table movement_rows do
      row(0).font_style = :bold 
      self.position = :center
      self.cell_style = {:font => "Helvetica", :size => 10, :border_color => "878787"}
      self.header = true
      self.column_widths = [50, 200, 100, 80, 100]
    end
  end

  def movement_rows
    [["Código", "Producto","Precio", "Cantidad", "Total"]] +
    @movement.d_movements.map do |movimiento|
      [Product.find(movimiento.product_id).codigo,Product.find(movimiento.product_id).nombre, number(movimiento.precio), movimiento.cantidad, number(movimiento.precio*movimiento.cantidad)]
    end
  end

  def fecha_format(fecha)
    fecha.to_formatted_s(:db)
  end

  def price(num)
    @view.number_to_currency(num, :unit => "Gs.")
  end
  
  def number(num)
    @view.number_to_currency(num, :unit => "")
  end

end
