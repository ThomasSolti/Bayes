;;; -*- Mode: Lisp; common-lisp-style: poem -*-

;;; Copyright (c) 2013 Matthias Hölzl
;;;
;;; This file is licensed under the MIT license; see the file LICENSE in the root directory for
;;; further information.

(in-package #:common-lisp-user)

(eval-when (:compile-toplevel :load-toplevel :execute)

(defparameter *bayes-test-exports*
  '(#:*my-bayes-net*
    #:*node-a*
    #:*node-b*
    #:*node-c*
    #:*node-d*
    #:*node-e*
    #:build-cpt-lhs-for-given-nodes
    #:compute-node-value-index
    #:cpt-contains-node
    #:node-build-cpt
    #:node-get-named-value-lists
    #:node-get-named-value-list
    #:node-potential-dimensions
    #:node-value-index-table
    #:process-class-slots
    #:process-class-slot
    #:process-class-options))

(defparameter *bayes-utilities-exports*
  '(#:define-class
    #:equals
    #:values-for-type))

(defparameter *bayes-exports*
  '(#:bayes-net    
    #:discrete-node
    #:make-bayes-net
    #:make-discrete-node
    #:make-node
    #:multiply-factors
    #:node
    #:node-cardinality
    #:node-cpt
    #:node-discrete-p
    #:node-domain-values
    #:node-kind
    #:node-name
    #:node-parents
    #:node-potential-rhs
    #:node-potential-dimensions
    #:node-probability
    #:node-type
    #:node-variables
    #:print-potential
    #:sum-out-vars))
)

(defpackage #:bayes-implementation
  (:shadowing-import-from #:c2mop
                          #:defgeneric
                          #:defmethod
                          #:standard-generic-function)
  (:use #:common-lisp
        #:alexandria #:c2mop #:iterate)
  (:nicknames #:bayes-impl)
  (:export . #.*bayes-test-exports*)
  (:export . #.*bayes-utilities-exports*)
  (:export . #.*bayes-exports*))

(defpackage #:bayes-utilities
  (:use #:common-lisp #:bayes-implementation)
  (:nicknames #:bayes-utils)
  (:export . #.*bayes-utilities-exports*))

(defpackage #:bayes
  (:use #:common-lisp #:bayes-implementation)
  (:export . #.*bayes-exports*))

(defpackage #:bayes-user
  (:use #:common-lisp #:common-lisp-user
        #:alexandria #:bayes-utilities #:bayes)
  #+define-nicknames-for-poem-packages
  (:nicknames #:bu))

