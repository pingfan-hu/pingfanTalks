local function surveycode(args, kwargs)
    local highlight = kwargs['highlight'] or "13-28"

    return pandoc.RawBlock('markdown', [[
::: {.column width="43%"}
````{r}
#| eval: false
#| echo: true
#| code-line-numbers: "]] .. highlight .. [["
---
format: html
echo: false
warning: false
---
```{r}
library(surveydown)
```
::: {#welcome .sd-page}
# Welcome to our survey!
```{r}
sd_question(
  type  = 'mc',
  id    = 'penguins',
  label = "What's your favorite penguin?",
  option = c(
    'Adélie'    = 'adelie',
    'Chinstrap' = 'chinstrap',
    'Gentoo'    = 'gentoo'
  )
)
sd_next()
```
:::
::: {#end .sd-page}
This is the last page of the survey.
```{r}
sd_close()
```
:::
````
:::
]])
end

return {
    ['shortcodes'] = {
        surveycode = surveycode
    }
}