// 모의고사 첫 페이지용 빈 틀
// 아래 값만 바꾸면 제목과 쪽수를 재사용할 수 있습니다.
#let exam-title = "문제 생성 엔진 테스트를 위한 typst 모의고사"
#let subject = "수학 영역"
#let period = "제 2 교시"
#let form = "홀수형"
#let page-number = 1
#let total-pages = 20


// ----------------------------
// 전역 설정
// ----------------------------
#set page(
  paper: "a4",
  margin: 0mm,
  fill: white,
)
#set text(font: "Apple SD Gothic Neo", fill: black)



// ----------------------------
// 문제에서 반복해서 사용하는 서식 함수
// ----------------------------
#let problem-title(number) = text(size: 11pt, weight: "bold", [#number.])
#let problem-body(body) = {
  set par(leading: 0.85em) // 줄 간격 0.85em
  show math.lr: set math.lr(size: 1em) // 괄호 자동 확대 방지
  text(size: 10.5pt, tracking: 0.035em, body) // 자간 0.035em
}
#let problem(number, body) = problem-body[
  #problem-title(number) #h(1.2mm)#body
]
#let point-label(name) = text(
  font: "Times New Roman",
  style: "italic",
  name,
)

// ----------------------------
// 상단 템플릿
// ----------------------------

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

// 왼쪽 열 문항 유형 표시
#place(top + left, dx: 15.7mm, dy: 48.3mm)[
  #rect(
    width: 30.2mm,
    height: 6.5mm,
    stroke: 0.55pt,
    inset: 0pt,
  )[
    #align(center + horizon)[
      #text(size: 11pt, weight: "bold")[단답형]
    ]
  ]
]

// ─────────────────────────────────────────────────────────────
// 문제 콘텐츠 삽입 영역
//
// 첫 페이지의 문제는 아래 주석과 "하단 중앙 쪽수 상자" 사이에 넣습니다.
// 모든 문제는 절대 좌표 #place(...)로 배치하여 위의 템플릿과 분리합니다.
//
// 왼쪽 열:  x = 15.5mm ~ 105.5mm
// 오른쪽 열: x = 105.5mm ~ 195.5mm
// 본문 높이: y = 45mm ~ 274.5mm
// 문제 번호는 왼쪽 경계에 가깝게 두고, 문제 본문은 번호 뒤에서 자연스럽게 시작합니다.
//
// [문제 1 삽입 위치 — 왼쪽 열 상단]
#place(top + left, dx: 15.7mm, dy: 62mm)[
  #box(width: 85.8mm)[
    #problem(1)[
      세 점 
      #point-label("O")$(0, 0)$, 
      #point-label("A")$(1, sqrt(3))$,
      #point-label("B")$(2, 0)$과 제 2사분면 위의 점 #point-label("A'") 에 대하여 $overline(O A) = overline(O A')$ 이고 $angle A' O A = 60 degree$ 일 때, 삼각형 #point-label("A'OA")의 외접원과 선분 #point-label("A' B")의 교점 중 점 #point-label("A'")이 아닌 점을 #point-label("P")$(a, b)$라 하자. #point-label("3ab")의 값을 구하시오.
    ]
  ]
]
//
// [문제 2 삽입 위치 — 왼쪽 열 하단]
// 권장 시작 위치: dx: 15.7mm, dy: 160mm
//
// [문제 3 삽입 위치 — 오른쪽 열 상단]
// 권장 시작 위치: dx: 110mm, dy: 50mm
//
// [문제 4 삽입 위치 — 오른쪽 열 하단]
// 권장 시작 위치: dx: 110mm, dy: 145mm
// ─────────────────────────────────────────────────────────────

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
