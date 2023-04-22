meta:
  id: arinc429
doc: |
  arinc429 is a messy format for avionics component data interchange.
  Messages are fixed size 32 bit words but with a variety of standard
  and non-standard encodings.

  See https://en.wikipedia.org/wiki/ARINC_429 and
  https://gama.aero/documents/gama-publication-11-arinc-429-general-aviation-subset-version-6-0

seq:
  - id: label
    type: b8be
  - id: sdi
    type: b2be  
  - id: data
    type: 
      switch-on: label
      cases:
        1: gama_001
        2: gama_002
        _: b19be
  - id: ssm
    type: b2be  
  - id: parity
    type: b1
    
types:
  gama_001: 
    seq:
      - id: tenths_of_naut_mi
        type: b4be
      - id: units_of_naut_mi
        type: b4be
      - id: tens_of_naut_mi
        type: b4be
      - id: hundreds_of_naut_mi
        type: b4be
      - id: thousands_of_naut_mi
        type: b4be
    instances:
      distance:
        value: tens_of_naut_mi * 10.0
  gama_002: 
    seq:
      - id: spares
        type: b4be
      - id: tenths_of_minutes
        type: b4be
      - id: units_of_minutes
        type: b4be
      - id: tens_of_minutes
        type: b4be
      - id: hundres_of_minutes
        type: b4be


    