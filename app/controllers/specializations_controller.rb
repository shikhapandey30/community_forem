class SpecializationsController < InheritedResources::Base

  private

    def specialization_params
      params.require(:specialization).permit(:name)
    end
end

