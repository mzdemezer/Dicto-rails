@DictoRails.module "Base.CategoriesApp", (CategoriesApp, App, Backbone, Marionette, $, _) ->

  class CategoriesApp.Category extends App.Views.Layout
    template: "_base/categories/category"

    regions:
      childrenRegion: ".category-children"

    onFormSubmit: ->
      false

    onShow: ->
      subcategories = @model.get("subcategories")
      if subcategories?.length > 0
        childrenView = new CategoriesApp.Categories
          collection: subcategories
        @childrenRegion.show childrenView


  class CategoriesApp.Categories extends App.Views.CollectionView
    itemView: CategoriesApp.Category
    className: "category-children-region"
