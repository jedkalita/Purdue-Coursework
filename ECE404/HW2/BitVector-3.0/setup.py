#!/usr/bin/env python

### setup.py

from distutils.core import setup

setup(name='BitVector',
      version='3.0',
      author='Avinash Kak',
      author_email='kak@purdue.edu',
      maintainer='Avinash Kak',
      maintainer_email='kak@purdue.edu',
      url='http://RVL4.ecn.purdue.edu/~kak/dist/BitVector-3.0.html',
      download_url='http://RVL4.ecn.purdue.edu/~kak/dist/BitVector-3.0.tar.gz?download',
      description='A pure-Python memory-efficient packed representation for bit arrays',
      long_description='''
This class presents a pure-Python memory-efficient packed 
representation for bit arrays.

**Version 3.0** is a Python 3.x compliant version of the
latest incarnation of the BitVector class.  **This version
should run with both Python 2.x and Python 3.x.**

The class is provided with the following operators/methods:

-      __getitem__
-      __setitem__
-      __len__
-      __iter__
-      __contains__
-      __getslice__
-      __str__
-      __int__
-      __add__
-      __eq__, __ne__, __lt__, __le__, __gt__, __ge__
-      __or__
-      __and__
-      __xor__
-      __invert__
-      __lshift__
-      __rshift__
-      __add__
-      count_bits 
-      count_bit_sparse       (faster for sparse bit vectors)     
-      deep_copy
-      divide_into_two
-      gcd
-      gf_divide              (for divisions in GF(2^n))
-      gf_MI                  (for multiplicative inverse in GF(2^n))
-      gf_multiply            (for multiplications in GF(2))
-      gf_multiply_modular    (for multiplications in GF(2^n))
-      hamming_distance
-      intValue               (for returning the integer value) 
-      isPowerOf2
-      isPowerOf2_sparse      (faster for sparse bit vectors)
-      jaccard_distance
-      jaccard_similarity
-      length                 
-      multiplicative_inverse
-      next_set_bit
-      pad_from_left
-      pad_from_right
-      permute
-      rank_of_bit_set_at_index
-      read_bits_from_file
-      read_bits_from_fileobject
-      reset
-      reverse
-      runs
-      shift_left             for non-circular left shift
-      shift_right            for non-circular right shift
-      slice assignment
-      setValue
-      unpermute
-      write_to_file
-      write_bits_to_fileobject

          ''',
      license='Python Software Foundation License',
      keywords='bit array, bit vector, bit string, logical operations on bit fields',
      platforms='All platforms',
      classifiers=['Topic :: Utilities', 'Programming Language :: Python'],
      packages=['']
)
