(ede-cpp-root-project "DELETE"
                      :file "~/DELETE/main.c"
                      :include-path '( "/inc" )
                      )

(ede-cpp-root-project "AVR PID"
                      :file "~/Downloads/avr/IAR/Makefile"
                      :include-path '( "/" )
                      :system-include-path '( "/usr/local/Cellar/avr-gcc/9.2.0/avr/include/"
                                              "/usr/local/Cellar/avr-gcc/9.2.0/avr/include/avr/")
                      :spp-table '( ("mmcu" . "atmega328" )
                                    ("__AVR_ATmega328P__" . " " ) )
                      :spp-files '( "/usr/local/Cellar/avr-gcc/9.2.0/avr/include/avr/iom328p.h" )
                      )

(provide 'setup-ede-projects)
