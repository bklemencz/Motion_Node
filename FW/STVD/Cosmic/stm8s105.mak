# ST Visual Debugger Generated MAKE File, based on stm8s105.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=C:\PROGRA~2\COSMIC\FSE_CO~1\CXSTM8
ToolsetBin=C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8
ToolsetInc=C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Hstm8
ToolsetLib=C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Lib
ToolsetIncOpts=-i"C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Hstm8" 
ToolsetLibOpts=-l"C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Lib" 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))


# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=Debug
ProjectSFile=stm8s105
TargetSName=$(ProjectSFile)
TargetFName=$(ProjectSFile).elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +modsl0 +debug -pxp +compact -l -dSTM8S105 -i..\.. -i..\..\inc $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) $(ProjectSFile).elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Debug\serialcomms.$(ObjectExt) : ..\..\serialcomms.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\config.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h ..\..\delay.h c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\math.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\rfcomms.$(ObjectExt) : ..\..\rfcomms.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\rfcomms.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h ..\..\config.h ..\..\delay.h c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\math.h ..\..\lt8900.h ..\..\serialcomms.h ..\..\main.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\adc.$(ObjectExt) : ..\..\adc.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\adc.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h ..\..\config.h ..\..\delay.h c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\math.h c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\float.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\ws2811.$(ObjectExt) : ..\..\ws2811.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\ws2811.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h ..\..\config.h ..\..\delay.h c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\math.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\delay.$(ObjectExt) : ..\..\delay.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\delay.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\eeprom.$(ObjectExt) : ..\..\eeprom.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\eeprom.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\lt8900.$(ObjectExt) : ..\..\lt8900.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\lt8900.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h ..\..\delay.h ..\..\config.h c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\math.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\main.$(ObjectExt) : ..\..\main.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h ..\..\lt8900.h ..\..\delay.h ..\..\config.h c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\math.h ..\..\eeprom.h ..\..\ws2811.h ..\..\adc.h ..\..\rfcomms.h ..\..\serialcomms.h ..\..\main.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_it.$(ObjectExt) : ..\..\stm8s_it.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\stm8s_it.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h ..\..\delay.h ..\..\adc.h ..\..\config.h c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\math.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\stm8s_it.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_adc1.$(ObjectExt) : ..\..\src\stm8s_adc1.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_awu.$(ObjectExt) : ..\..\src\stm8s_awu.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_beep.$(ObjectExt) : ..\..\src\stm8s_beep.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_clk.$(ObjectExt) : ..\..\src\stm8s_clk.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_exti.$(ObjectExt) : ..\..\src\stm8s_exti.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_flash.$(ObjectExt) : ..\..\src\stm8s_flash.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_gpio.$(ObjectExt) : ..\..\src\stm8s_gpio.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_i2c.$(ObjectExt) : ..\..\src\stm8s_i2c.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_itc.$(ObjectExt) : ..\..\src\stm8s_itc.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_iwdg.$(ObjectExt) : ..\..\src\stm8s_iwdg.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_rst.$(ObjectExt) : ..\..\src\stm8s_rst.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_spi.$(ObjectExt) : ..\..\src\stm8s_spi.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim1.$(ObjectExt) : ..\..\src\stm8s_tim1.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim2.$(ObjectExt) : ..\..\src\stm8s_tim2.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim3.$(ObjectExt) : ..\..\src\stm8s_tim3.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim4.$(ObjectExt) : ..\..\src\stm8s_tim4.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_uart2.$(ObjectExt) : ..\..\src\stm8s_uart2.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_uart2.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_wwdg.$(ObjectExt) : ..\..\src\stm8s_wwdg.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_wwdg.h ..\..\inc\stm8s.h ..\..\stm8s_conf.h ..\..\inc\stm8s_adc1.h ..\..\inc\stm8s_awu.h ..\..\inc\stm8s_beep.h ..\..\inc\stm8s_clk.h ..\..\inc\stm8s_exti.h ..\..\inc\stm8s_flash.h ..\..\inc\stm8s_gpio.h ..\..\inc\stm8s_i2c.h ..\..\inc\stm8s_itc.h ..\..\inc\stm8s_iwdg.h ..\..\inc\stm8s_rst.h ..\..\inc\stm8s_spi.h ..\..\inc\stm8s_tim1.h ..\..\inc\stm8s_tim2.h ..\..\inc\stm8s_tim3.h ..\..\inc\stm8s_tim4.h ..\..\inc\stm8s_uart2.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

$(ProjectSFile).elf :  $(OutputPath)\serialcomms.o $(OutputPath)\rfcomms.o $(OutputPath)\adc.o $(OutputPath)\ws2811.o $(OutputPath)\delay.o $(OutputPath)\eeprom.o $(OutputPath)\lt8900.o $(OutputPath)\main.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_iwdg.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim3.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart2.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\stm8s105.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 -m$(OutputPath)\$(TargetSName).map $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
	find  "segment" $(OutputPath)\$(TargetSName).map
clean : 
	-@erase $(OutputPath)\serialcomms.o
	-@erase $(OutputPath)\rfcomms.o
	-@erase $(OutputPath)\adc.o
	-@erase $(OutputPath)\ws2811.o
	-@erase $(OutputPath)\delay.o
	-@erase $(OutputPath)\eeprom.o
	-@erase $(OutputPath)\lt8900.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_iwdg.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim3.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart2.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\stm8s105.elf
	-@erase $(OutputPath)\stm8s105.elf
	-@erase $(OutputPath)\stm8s105.map
	-@erase $(OutputPath)\serialcomms.ls
	-@erase $(OutputPath)\rfcomms.ls
	-@erase $(OutputPath)\adc.ls
	-@erase $(OutputPath)\ws2811.ls
	-@erase $(OutputPath)\delay.ls
	-@erase $(OutputPath)\eeprom.ls
	-@erase $(OutputPath)\lt8900.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_iwdg.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim3.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart2.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
endif

# 
# Release
# 
ifeq "$(CFG)" "Release"


OutputPath=Release
ProjectSFile=stm8s105
TargetSName=stm8s105
TargetFName=stm8s105.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +mods0 -pp $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $< 
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) stm8s105.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Release\serialcomms.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\rfcomms.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\adc.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\ws2811.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\delay.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\eeprom.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\lt8900.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\main.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_it.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8_interrupt_vector.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_adc1.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_awu.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_beep.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_clk.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_exti.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_flash.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_gpio.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_i2c.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_itc.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_iwdg.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_rst.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_spi.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim1.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim2.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim3.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim4.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_uart2.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_wwdg.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

stm8s105.elf :  $(OutputPath)\serialcomms.o $(OutputPath)\rfcomms.o $(OutputPath)\adc.o $(OutputPath)\ws2811.o $(OutputPath)\delay.o $(OutputPath)\eeprom.o $(OutputPath)\lt8900.o $(OutputPath)\main.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_iwdg.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim3.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart2.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\stm8s105.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\serialcomms.o
	-@erase $(OutputPath)\rfcomms.o
	-@erase $(OutputPath)\adc.o
	-@erase $(OutputPath)\ws2811.o
	-@erase $(OutputPath)\delay.o
	-@erase $(OutputPath)\eeprom.o
	-@erase $(OutputPath)\lt8900.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_iwdg.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim3.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart2.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\stm8s105.elf
	-@erase $(OutputPath)\stm8s105.map
	-@erase $(OutputPath)\stm8s105.st7
	-@erase $(OutputPath)\stm8s105.s19
	-@erase $(OutputPath)\serialcomms.ls
	-@erase $(OutputPath)\rfcomms.ls
	-@erase $(OutputPath)\adc.ls
	-@erase $(OutputPath)\ws2811.ls
	-@erase $(OutputPath)\delay.ls
	-@erase $(OutputPath)\eeprom.ls
	-@erase $(OutputPath)\lt8900.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_iwdg.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim3.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart2.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
endif
