;;; -*- Mode: Lisp; common-lisp-style: poem -*-

;;; Copyright (c) 2013 Matthias Hölzl
;;;
;;; This file is licensed under the MIT license; see the file LICENSE in the root directory for
;;; further information.

(in-package #:bayes-tests)

(in-root-suite)

(defsuite (bayes-suite
           :documentation "Tests for the Bayes library."))

(defsuite (bayes-macro-suite
           :in bayes-suite
           :documentation "Tests for the macros of the Bayes library."))

(defsuite (bayes-utilities-suite
           :in bayes-suite
           :documentation "Tests for the utility functions of the Bayes library."))

(defsuite (bayes-nodes-suite
           :in bayes-suite
           :documentation "Tests for nodes."))
