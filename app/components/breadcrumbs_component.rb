class BreadcrumbsComponent < ViewComponent::Base
  attr_reader :items

  def initialize(items: nil)
    @items = items
  end

  # Use `#before_render` to ensure context-dependent logic runs at the right time
  def before_render
    # If items weren't passed, generate them dynamically based on the request path
    @items ||= generate_breadcrumbs
  end

  private

  # Generate breadcrumbs based on the current path
  def generate_breadcrumbs
    path_segments = controller.request.fullpath.split("/").reject(&:blank?)
    path_segments.each_with_index.map do |segment, index|
      {
        name: segment.titleize,
        url: index < path_segments.size - 1 ? "/#{path_segments[0..index].join('/')}" : nil
      }
    end
  end
end
