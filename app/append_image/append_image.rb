class AppendImage
    # METHOD: Intialize object when call new
    def initialize(data)
        # Create a copy of the data of object to know the location
        @data = data
    end

    # METHOD: Attach the image
    def attach_image(params_image)
        @data.image.attach(params_image)
        @data
    end
end