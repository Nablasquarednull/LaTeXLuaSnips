-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
-- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts.
--
--
return {
-- Add an 'm' subscript when typing 'mm' after a letter. 
s({trig = "([^%a])mm", wordTrig = false, regTrig = true},
  fmta(
    "<>$<>$",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  ),
{condition = in_mathzone}
),
-- Add a * superscript (conjugate) when typing cj after a letter. 
s({trig = '([%a%)%]%}])cj', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>^{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("*")
    }
  ),{condition = in_mathzone}

),

-- Add a dagger superscript when typing dg after a letter. 
s({trig = '([%a%)%]%}])dg', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>^{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("\\dagger")
    }
  ),{condition = in_mathzone}

),

-- Temporary snippiets for adding sub and superscripts for a few numbers until we figure out how to properly use regex. 
s({trig=";0",snippetType= "autosnippet",dscr= "Adds ^0",wordTrig = false},
    {
      t("^{0}"),
  },{condition = in_mathzone}),

s({trig=";1",snippetType= "autosnippet",dscr= "Adds ^1",wordTrig = false},
    {
      t("^{1}"),
  },{condition = in_mathzone}),

s({trig=";2",snippetType= "autosnippet",dscr= "Adds ^2",wordTrig = false},
    {
      t("^{2}"),
  },{condition = in_mathzone}),

s({trig=";3",snippetType= "autosnippet",dscr= "Adds ^3",wordTrig = false},
    {
      t("^{3}"),
  },{condition = in_mathzone}),

s({trig=";4",snippetType= "autosnippet",dscr= "Adds ^4",wordTrig = false},
    {
      t("^{4}"),
  },{condition = in_mathzone}),

s({trig=":0",snippetType= "autosnippet",dscr= "Adds _0",wordTrig = false},
    {
      t("_{0}"),
  },{condition = in_mathzone}),

s({trig=":1",snippetType= "autosnippet",dscr= "Adds _1",wordTrig = false},
    {
      t("_{1}"),
  },{condition = in_mathzone}),

s({trig=":2",snippetType= "autosnippet",dscr= "Adds _2",wordTrig = false},
    {
      t("_{2}"),
  },{condition = in_mathzone}),

s({trig=":3",snippetType= "autosnippet",dscr= "Adds _3",wordTrig = false},
    {
      t("_{3}"),
  },{condition = in_mathzone}),

s({trig=":4",snippetType= "autosnippet",dscr= "Adds _4",wordTrig = false},
    {
      t("_{4}"),
  },{condition = in_mathzone}),

s({trig=";-1",snippetType= "autosnippet",dscr= "Adds ^{-1}",wordTrig = false},
    {
      t("^{-1}"),
  },{condition = in_mathzone}),

s({trig=".min",snippetType= "autosnippet",dscr= "Adds a 'min' subscript.",wordTrig = false},
    {
      t("_{\\text{min}}"),
  },{condition = in_mathzone}),

s({trig=".max",snippetType= "autosnippet",dscr= "Adds 'max' subscript.",wordTrig = false},
    {
      t("_{\\text{max}}"),
  },{condition = in_mathzone}),

s({trig=".eff",snippetType= "autosnippet",priority = 1001, dscr= "Adds an 'eff' subscript.",wordTrig = false},
    {
      t("_{\\text{eff}}"),
  },{condition = in_mathzone}),

}
