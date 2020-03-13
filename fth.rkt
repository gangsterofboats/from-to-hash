#lang racket
#|
#############################################################################
# FromToHash - Solve a job interview puzzle                                 #
# Copyright (C) 2020 Michael Wiseman                                        #
#                                                                           #
# This program is free software: you can redistribute it and/or modify      #
# it under the terms of the GNU Affero General Public License as            #
# published by the Free Software Foundation, either version 3 of the        #
# License, or (at your option) any later version.                           #
#                                                                           #
# This program is distributed in the hope that it will be useful,           #
# but WITHOUT ANY WARRANTY; without even the implied warranty of            #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             #
# GNU Affero General Public License for more details.                       #
#                                                                           #
# You should have received a copy of the GNU Affero General Public License  #
# along with this program.  If not, see <https://www.gnu.org/licenses/>.    #
#############################################################################
|#
(require srfi/13)

(define (to-hash input)
  (define letters "acdegilmnoprstuw")
  (define h 7)
  (for ([i (in-range 0 (string-length input))])
    (set! h (+ (* h 37) (string-index letters (string-ref input i)))))
  (values h))

(define (from-hash input length)
  (define letters "acdegilmnoprstuw")
  (define output "")
  (for ([i (in-range length 0 -1)])
    (define l-index 0)
    (define h (modulo (- input l-index) 37))
    (for ([index (in-range 0 16)]
          #:when (not (equal? h 0)))
      (set! h (modulo (- input index) 37))
      (set! l-index index))
    (set! input (exact-round (/ (- input l-index) 37)))
    (set! output (string-append (string (string-ref letters l-index)) output)))
  (values output))

(define test-th (to-hash "leepadg"))
(displayln test-th)
(define test-fh (from-hash 910897038977002 9))
(displayln test-fh)
