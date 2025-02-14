require 'json'

Jekyll::Hooks.register :site, :post_write do |site|
  index = []
  site.posts.docs.each do |post|
    index << {
      id: post.url,
      title: post.data['title'],
      content: post.content
    }
  end

  File.write('search-index.json', JSON.generate(index))
end