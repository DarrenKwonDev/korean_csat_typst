// 모의고사 첫 페이지용 빈 틀
// 아래 값만 바꾸면 제목과 쪽수를 재사용할 수 있습니다.
#let exam-title = "모의고사"
#let subject = "수학 영역"
#let period = "제 2 교시"
#let form = "홀수형"
#let page-number = 1
#let total-pages = 20

#set page(
  paper: "a4",
  margin: 0mm,
  fill: white,
)
#set text(font: "Apple SD Gothic Neo", fill: black)

// 상단 시험명
#place(top + left, dx: 0mm, dy: 17.2mm)[
  #box(width: 210mm)[
    #align(center)[#text(size: 12.5pt, weight: "medium")[#exam-title]]
  ]
]

// 상단 우측 쪽수
#place(top + left, dx: 192.3mm, dy: 15.4mm)[
  #text(size: 21pt, font: "Times New Roman")[#page-number]
]

// 교시 표시
#place(top + left, dx: 15.5mm, dy: 28.7mm)[
  #rect(
    width: 25.5mm,
    height: 8.7mm,
    radius: 4.4mm,
    stroke: 0.7pt,
    inset: 0pt,
  )[#align(center + horizon)[#text(size: 12.5pt, weight: "bold")[#period]]]
]

// 과목명
#place(top + left, dx: 0mm, dy: 26.0mm)[
  #box(width: 210mm)[
    #align(center)[#text(size: 27pt, weight: "bold")[#subject]]
  ]
]

// 시험지 형 표시
#place(top + left, dx: 173.8mm, dy: 30.7mm)[
  #rect(
    width: 21.7mm,
    height: 11.7mm,
    radius: 1mm,
    stroke: 0.7pt,
    inset: 0pt,
  )[#align(center + horizon)[#text(size: 16pt, weight: "bold")[#form]]]
]

// 문제 영역의 가로선과 중앙 세로선
#place(top + left, dx: 15.5mm, dy: 45mm)[
  #line(length: 180mm, stroke: 0.8pt)
]
#place(top + left, dx: 105.5mm, dy: 45mm)[
  #line(length: 229.5mm, angle: 90deg, stroke: 0.8pt)
]

// 하단 중앙 쪽수 상자 (현재 쪽 / 전체 쪽)
#place(top + left, dx: 98.6mm, dy: 278.5mm)[
  #rect(width: 13.8mm, height: 6.7mm, stroke: 0.55pt)
]
#place(top + left, dx: 98.6mm, dy: 285.2mm)[
  #line(length: 15.35mm, angle: -25.9deg, stroke: 0.45pt)
]
#place(top + left, dx: 100.0mm, dy: 279.0mm)[
  #text(size: 9pt, font: "Times New Roman")[#page-number]
]
#place(top + left, dx: 106.8mm, dy: 281.6mm)[
  #text(size: 9pt, font: "Times New Roman", weight: "bold")[#total-pages]
]

// 빈 본문이 있어도 페이지를 실제로 생성합니다.
#v(297mm)
