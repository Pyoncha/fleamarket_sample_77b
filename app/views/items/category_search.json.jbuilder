json.array! @childrens do |children|
  json.id children.id
  json.name children.name
end

json.array! @grandchilds do |grandchild|
  json.id grandchild.id
  json.name grandchild.name
end