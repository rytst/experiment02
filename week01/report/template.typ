#let textL = 1.8em
#let textM = 1.6em
#let fontSerif = ("Noto Serif", "Noto Serif CJK JP")
#let fontSan = ("Noto Sans", "Noto Sans CJK JP")

#let project(title: "", author: "", year: none, body) = {
  set document(author: author, title: title)

  // Font
  set text(font: fontSerif, lang: "ja")

  // Heading
  set heading(numbering: (..nums) => {
    if nums.pos().len() > 1 {
      nums.pos().map(str).join(".") + " "
    } else {
      text(cjk-latin-spacing: none)[第 #str(nums.pos().first()) 章]
      h(1em)
    }
  })
  show heading: set text(font: fontSan, weight: "medium", lang: "ja")
  show heading.where(level: 1): it => {
    pagebreak()
    set text(size: 1.4em)
    pad(top: 3em, bottom: 2.5em)[
      #it
    ]
  }
  show heading.where(level: 2): it => pad(top: 1em, bottom: 0.6em, it)

  // Figure
  show figure: it => pad(y: 1em, it)
  show figure.caption: it => pad(top: 0.6em, it)

  // Outline
  show outline.entry: set text(font: fontSan, lang: "ja")
  show outline.entry.where(
    level: 1
  ): it => {
    v(0.2em)
    set text(weight: "semibold")
    it
  }

  align(center)[
    #v(6em)

    #block(text(textM)[#year 年度])
    #v(2em)
    #block(text(textM, "情報科学実験02"))
    #v(2em)
    #block(text(textM, "レポート課題"))

    // Title row.
    #align(horizon)[
      #block(text(textM, "実験テーマ"))
      #v(0.4em)
      #block(text(textM,  underline(offset: 0.2em, title)))
    ]

    #v(10em)

    // Author information.
    #v(2em)

    #block(text(textM)[#underline(offset: 0.2em)[実験実施日: #year 年10月10日]])
    
    #let today = datetime.today()
    #block(text(textM)[#underline(offset: 0.2em)[レポート提出日: #year 年 #today.month()月#today.day()日]])
    #block(text(textM)[#underline(offset: 0.2em)[提出期限: #year 年10月17日]])

    #v(2em)

    #block(text(textM)[#underline(offset: 0.2em)[報告者: J2200071 #author]])
    #block(text(textM)[#underline(offset: 0.2em)[実験グループ: A班]])
  ]

  pagebreak(weak: true)

  set par(justify: true)
  body
}

#let abstract(body) = {
  v(180pt)

  align(center)[
    #text(font: fontSan, size: textM, tracking: 2em, weight: "medium")[要旨]
  ]

  v(2em)

  set par(first-line-indent: 1em)
  body
  pagebreak(weak: true)
}
