class CreatorsController < ApplicationController
  def show
    @creator = Creator.find(params[:id])
  end

  def import_assets
    @creator = Creator.find(params[:id])
    file = params[:json_file]

    # Kiểm tra nếu không có file được chọn
    unless file
      return redirect_to creator_path(@creator), alert: "Please select a JSON file."
    end

    # Đọc và parse JSON
    begin
      asset_data = JSON.parse(file.read)
    rescue JSON::ParserError
      return redirect_to creator_path(@creator), alert: "Invalid JSON format."
    end

    # Chứa thông báo lỗi từng dòng (nếu có)
    errors = []

    # Dùng transaction để rollback toàn bộ nếu có lỗi
    ActiveRecord::Base.transaction do
      asset_data.each_with_index do |item, index|
        asset = @creator.assets.build(
          title: item["title"],
          description: item["description"],
          file_url: item["file_url"],
          price: item["price"]
        )

        unless asset.save
          errors << "Asset #{index + 1}: #{asset.errors.full_messages.join(', ')}"
        end
      end

      # Có lỗi => rollback (dữ liệu không được lưu)
      raise ActiveRecord::Rollback if errors.any?
    end

    # Trả kết quả cho người dùng
    if errors.any?
      redirect_to creator_path(@creator), alert: "Import failed:\n#{errors.join("\n")}"
    else
      redirect_to creator_path(@creator), notice: "All assets imported successfully!"
    end
  end
end
