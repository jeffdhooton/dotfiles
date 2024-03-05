local all_languages = { "javascript", "typescript", "vue", "javascriptreact", "typescriptreact" }

local snippet_collection = require("luasnip.session.snippet_collection")

for _, lang in ipairs(all_languages) do
  snippet_collection.clear_snippets(lang)
end

local ls = require "luasnip"

local fmt = require("luasnip.extras.fmt").fmt


local s = ls.snippet
local i = ls.insert_node

local try_catch = {
  s(
    "tryc",
    fmt(
      [[
try {{
  {}
}} catch (error) {{
  {}
}}
      ]],
      {
        i(1, ""),
        i(2, "console.error(error);")
      }
    )
  )
}

local info = {
  s(
    "info",
    fmt(
      [[
console.log("INFO: {}");
      ]],
      {
        i(1, ""),
      }
    )
  )
}

local use_effect = {
  s(
    "eff",
    fmt(
      [[
useEffect(() => {{
  {}
}}, [{}])
      ]],
      {
        i(1, ""),
        i(2, ""),
      }
    )
  )
}

local use_state_js = {
  s(
    "state",
    fmt(
      [[
const [{}, {}] = useState({});
      ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
      }
    )
  )
}

local use_state_ts = {
  s(
    "state",
    fmt(
      [[
const [{}, {}] = useState<{}>({});
      ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
      }
    )
  )
}

local vue_scaffold = {
  s(
    "tem",
    fmt(
      [[
<template>
  <div>
  </div>
</template>

<script setup lang="{}">
{}
</script>
      ]],
      {
        i(1, ""),
        i(2, ""),
      }
    )
  )
}



local function add_snippet_for_languages(languages, snippet)
  for _, lang in ipairs(languages) do
    ls.add_snippets(lang, snippet)
  end
end

add_snippet_for_languages(all_languages, try_catch)
add_snippet_for_languages(all_languages, info)
add_snippet_for_languages({ "javascriptreact", "typescriptreact" }, use_effect)
add_snippet_for_languages({ "javascriptreact" }, use_state_js)
add_snippet_for_languages({ "typescriptreact" }, use_state_ts)
add_snippet_for_languages({ "vue" }, vue_scaffold)
