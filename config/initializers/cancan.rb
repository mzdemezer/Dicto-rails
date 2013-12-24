module CanCan
  class ControllerResource

    def resource_instance
      if load_instance?
        if use_decent_exposure?
          @controller.send(instance_name)
        else
          @controller.instance_variable_get("@#{instance_name}")
        end
      end

    end

    def use_decent_exposure?
      @options[:decent_exposure] && @controller.respond_to?(instance_name)
    end

    # Extends CanCan in such a way that it supports the way that decent
    # exposure sets collection variables.
    #
    def collection_instance
      collection_name = instance_name.to_s.pluralize
      if @controller.instance_variable_defined? "@#{collection_name}"
        @controller.instance_variable_get("@#{collection_name}")
      elsif @controller.respond_to?(collection_name, true)
        @controller.send(collection_name)
      end
    end
  end
end
