class OrderForPDF < Prawn::Document

    def initialize(order_for)
      super()

     # 複数メソッドで利用できるようにするため
      # インスタンス変数に代入
      @order = order_for

      # 全体のフォントを設定
      # font "vendor/fonts/ipaexg.ttf"

      # ヘッダー部分の表示
      header
      # ヘッダーリード部分の表示
      header_lead
      # テーブル部分の表示
      table_content
    end

    def header
      # size 28 で "Order"という文字を表示
      text "Order", size: 28

      # stroke(線)の色を設定し、線を引く
      stroke_color "eeeeee"
      stroke_line [0, 680], [530, 680]
    end

    def header_lead
      # カーソルを指定
      y_position = cursor - 30

      # bounding_boxで記載箇所を指定して、textメソッドでテキストを記載
      bounding_box([100, y_position], :width => 270, :height => 50) do
        font_size 10.5
        text "Contract No:  #{@order.id}"
        move_down 3
        text "Order Date:  #{@order.created_at}"
      end
    end


    def table_content
      # tableメソッドは2次元配列を引数(line_item_rows)にとり、それをテーブルとして表示する
      # ブロック(do...end)内でテーブルの書式の設定をしている
        table sold_product_rows do
          # 全体設定
          cells.padding = 8          # セルのpadding幅
          cells.borders = [:bottom,] # 表示するボーダーの向き(top, bottom, right, leftがある)
          cells.border_width = 0.5   # ボーダーの太さ

          # 個別設定
          # row(0) は0行目、row(-1) は最後の行を表す
          row(0).border_width = 1.5
          row(-2).border_width = 1.5
          row(-1).background_color = "f0ad4e"
          row(-1).borders = []

          self.header     = true  # 1行目をヘッダーとするか否か
          self.row_colors = ['dddddd', 'ffffff'] # 列の色
          self.column_widths = [50, 190, 90, 70, 90] # 列の幅
        end
      end

  # テーブルに表示するデータを作成(2次元配列)
      def sold_product_rows
        # テーブルのヘッダ部
        arr = [["#", "Style Name", "Size", "Color", "Unit Price", "Quantity", "Total Price"]]

        # テーブルのデータ部
          @order.sold_products.map.with_index do |item, i|
            arr << [i+1, item.product.style_number, item.color.name, item.size.name, item.price, item.quantity, item.total_price]
          end

    # テーブルの合計部
        arr << ["", "", "", "Total", @order.total_price]
        return arr
      end

end