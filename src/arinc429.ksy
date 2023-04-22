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
        3: gama_003
        4: gama_004
        5: gama_005
        6: gama_006
        7: gama_007
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
        value: (thousands_of_naut_mi * 1000.0) + (hundreds_of_naut_mi * 100.0) + (tens_of_naut_mi * 10.0) + (units_of_naut_mi * 1.0) + (tenths_of_naut_mi * 0.1)
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
    instances:
      time:
        value: (hundres_of_minutes * 100.0) + (tens_of_minutes * 10.0) + (units_of_minutes * 1.0) + (tenths_of_minutes * 0.1)
  gama_003:
    seq:
      - id: tenths_of_knots
        type: b4be
      - id: units_of_knots
        type: b4be
      - id: tens_of_knots
        type: b4be
      - id: hundreds_of_knots
        type: b4be
      - id: thousands_of_knots
        type: b4be
    instances:
      speed:
        value: (thousands_of_knots * 1000.0) + (hundreds_of_knots * 100.0) + (tens_of_knots * 10.0) + (units_of_knots * 1.0) + (tenths_of_knots * 0.1)
  gama_004:
    seq:
      - id: spare
        type: b4be
      - id: tenths_of_degrees
        type: b4be
      - id: units_of_degrees
        type: b4be
      - id: tens_of_degrees
        type: b4be
      - id: hundreds_of_degrees
        type: b4be
    instances:
      heading:
        value: (hundreds_of_degrees * 100.0) + (tens_of_degrees * 10.0) + (units_of_degrees * 1.0) + (tenths_of_degrees * 0.1)
  gama_005:
    seq:
      - id: hsi_course_select_master_control
        type: b1
      - id: spares
        type: b7be
      - id: units_of_degrees
        type: b4be
      - id: tens_of_degrees
        type: b4be
      - id: hundreds_of_degrees
        type: b4be
    instances:
      course:
        value: (hundreds_of_degrees * 100.0) + (tens_of_degrees * 10.0) + (units_of_degrees * 1.0)
  gama_006:
    seq:
      - id: spares
        type: b8be
      - id: units_of_degrees
        type: b4be
      - id: tens_of_degrees
        type: b4be
      - id: hundreds_of_degrees
        type: b4be
    instances:
      course:
        value: (hundreds_of_degrees * 100.0) + (tens_of_degrees * 10.0) + (units_of_degrees * 1.0)
  gama_007:
    seq:
      - id: thousandths_of_mhz
        type: b4be
      - id: hundredths_of_mhz
        type: b4be
      - id: tenths_of_mhz
        type: b4be
      - id: units_of_mhz
        type: b4be
      - id: tens_of_mhz
        type: b4be
    instances:
      frequency:
        value: (tens_of_mhz * 10.0) + (units_of_mhz * 1.0) + (tenths_of_mhz * 0.1) + (hundredths_of_mhz * 0.01) + (thousandths_of_mhz * 0.001)