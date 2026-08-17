#!/bin/bash

typst compile main.typ output.pdf
typst compile --ppi 300 main.typ output.png