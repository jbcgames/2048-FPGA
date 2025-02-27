# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35ticpg236-1L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/estudiante/Final_Digital_2048/Final_Digital_2048.cache/wt [current_project]
set_property parent.project_path /home/estudiante/Final_Digital_2048/Final_Digital_2048.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo /home/estudiante/Final_Digital_2048/Final_Digital_2048.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/Demo21/BIN2BCD_0a999.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/new/Dibujo2.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/imports/Demo21/Display.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/DownArrow.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/LeftArrow.vhd
  {/home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/Ejemplo Demo/MouseCtl.vhd}
  {/home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/Ejemplo Demo/Ps2Interface.vhd}
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/RightArrow.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/UpArrow.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/cientoveintiocho.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/cuatro.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/imports/Laboratorio_4/debounce.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/deisyseis.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/Descargas/display34segm2.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/dos.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/doscientoscincuentayseis.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/dosmilcuarentayocho.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/milveinticuatro.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/ocho.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/imports/Laboratorio_4/ps2_keyboard.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/Laboratorio_4/ps2_keyboard_to_ascii.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/quinientosdoce.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/sesentaycuatro.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/new/treintaydos.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/imports/Demo21/vga_ctrl_640x480_60Hz.vhd
  /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/sources_1/imports/imports/Demo21/VGACounter.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/constrs_1/imports/Descargas/Basys3_Master.xdc
set_property used_in_implementation false [get_files /home/estudiante/Final_Digital_2048/Final_Digital_2048.srcs/constrs_1/imports/Descargas/Basys3_Master.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top VGACounter -part xc7a35ticpg236-1L


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef VGACounter.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file VGACounter_utilization_synth.rpt -pb VGACounter_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
