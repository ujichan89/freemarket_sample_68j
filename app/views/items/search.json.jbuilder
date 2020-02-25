json.array! @m_cat do |m_cat|
  json.id   m_cat.id
  json.genre m_cat.genre
end

json.array! @s_cat do |s_cat|
  json.id   s_cat.id
  json.genre s_cat.genre
end