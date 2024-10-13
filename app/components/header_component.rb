# Компонент для отображения заголовка каждой страницы
#
# @param title [String] Заголовок страницы
# @param description [String] Описание страницы (опционально)
# @yieldparam content [String] HTML-контент (опционально)
#
# @example
#   <%= render HeaderComponent.new(title: t('view.classifiers.classifier')) do %>
#       <%= link_to t('audit.export_ok'), field_selector_articles_article_versions_path, class: 'button' %>
#   <% end %>
class HeaderComponent < ViewComponent::Base
  def initialize(title:, description: nil)
    super()
    @title = title
    @description = description
  end
end
