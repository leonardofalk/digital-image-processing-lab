require 'opencv'

class ImageCv
  include OpenCV

  attr_reader :file, :name, :path

  def initialize(image)
    @name = image.name
    @path = Rails.root.join("cv_images", image.name).to_s
    @file = File.new(@path, 'wb')
    @file.write(image.data)
    @file.close
  end

  def self.create_coronal
    name_base_axial = "mri_flair_axial"
    name_base_coron = "mri_flair_coronal"

    for qtd_coron in 0..216 do # y do axial
      write_file_name = "#{name_base_coron}#{216 - qtd_coron}.tif"
      coronal_image = CvMat.new(171, 181)

      for y_coron in 0..170 do # num arquivo do axial
        read_file_name = "#{name_base_axial}#{y_coron}.tif"
        axial_image = CvMat.load(Rails.root.join("cv_images", read_file_name).to_s, CV_LOAD_IMAGE_COLOR)

        for x_coron in 0..180 do # x_axial = x_coronal
          coronal_image[170 - y_coron, x_coron] = axial_image[qtd_coron, x_coron]
        end
      end

      coronal_image.save(Rails.root.join("cv_images", write_file_name).to_s)
    end

    return true
  end

  def self.create_sagital
    name_base_axial = "mri_flair_axial"
    name_base_sagital = "mri_flair_sagital"

    for qtd_sagital in 0..180 do # 180 - qtd_sagital = x_axial
      write_file_name = "#{name_base_sagital}#{qtd_sagital}.tif"
      sagital_image   = CvMat.new(171, 217)

      for y_sagital in 0..170 do # num arquivo do axial
        read_file_name = "#{name_base_axial}#{y_sagital}.tif"
        axial_image    = CvMat.load(Rails.root.join("cv_images", read_file_name).to_s, CV_LOAD_IMAGE_COLOR)

        for x_sagital in 0..216 do # 216 - x_sagital = y_axial
          sagital_image[170 - y_sagital, 216 - x_sagital] = axial_image[x_sagital, qtd_sagital]
        end
      end

      sagital_image.save(Rails.root.join("cv_images", write_file_name).to_s)
    end

    return true
  end

  def self.threshold(mat, limite = 150, save = false, path = nil)
    image = mat.threshold(limite, 255, CV_THRESH_BINARY)

    if save
      image.save(Rails.root.join("cv_images", path).to_s)
    end

    return image
  end

  def self.esclerosis_detection(limite, save_bins)
    name_base_axial = "mri_flair_axial"

    for qtd_axial in 0..170 do
      read_file_name  = "#{name_base_axial}#{qtd_axial}.tif"
      write_file_name = "esclerose#{qtd_axial}.tif"

      axial_image = CvMat.load(Rails.root.join("cv_images", read_file_name).to_s, CV_LOAD_IMAGE_COLOR)
      axial_size = axial_image.size
      thresh     = ImageCv.threshold(axial_image, limite, save_bins, "axial#{qtd_axial}_thresh#{limite}.tif")

      for x in 0..axial_size.width - 1 do
        for y in 0..axial_size.height - 1 do
          point = thresh[y, x].to_a

          if point[0] == 255.0 && point[1] == 255.0 && point[2] == 255.0
            point[0] = 0
            point[1] = 0
            point[2] = 255
            point[3] = 0.5

            axial_image[y, x] = point
          end
        end
      end

      axial_image.save(Rails.root.join("cv_images", write_file_name).to_s)
    end

    return true
  end
end
