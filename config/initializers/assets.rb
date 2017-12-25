# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w( store.js )
Rails.application.config.assets.precompile += %w( pages.js )
Rails.application.config.assets.precompile += %w( products.js )
Rails.application.config.assets.precompile += %w( users.js )
Rails.application.config.assets.precompile += %w( comments.js )
Rails.application.config.assets.precompile += %w( orders.js )
Rails.application.config.assets.precompile += %w( charges.js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( sessions.css )
Rails.application.config.assets.precompile += %w( line_items.css )
Rails.application.config.assets.precompile += %w( orders.css )
Rails.application.config.assets.precompile += %w( store.css )
Rails.application.config.assets.precompile += %w( products.css )
Rails.application.config.assets.precompile += %w( pages.css )
Rails.application.config.assets.precompile += %w( categories.css )
Rails.application.config.assets.precompile += %w( posts.css )
Rails.application.config.assets.precompile += %w( carts.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( post_attachments.css )
Rails.application.config.assets.precompile += %w( product_attachments.css )
Rails.application.config.assets.precompile += %w( comments.css )
Rails.application.config.assets.precompile += %w( product_comments.css )
Rails.application.config.assets.precompile += %w( charges.css )
Rails.application.config.assets.precompile += %w( password_resets.css )