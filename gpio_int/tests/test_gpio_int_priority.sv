`ifndef GPIO_INT_CASE3__SV
`define GPIO_INT_CASE3__SV

class test_gpio_int_priority extends base_test;

   function new(string name = "test_gpio_int_priority", uvm_component parent = null);
      super.new(name,parent);
   endfunction 
   extern virtual function void build_phase(uvm_phase phase); 
   `uvm_component_utils(test_gpio_int_priority)
endclass

function void test_gpio_int_priority::build_phase(uvm_phase phase);
   super.build_phase(phase);

   $display("\n\t========================================================");
   $display("\t\tExcuting test pattern is : [ %s ]", get_type_name);
   $display("\t========================================================\n\n");

   uvm_config_db#(uvm_object_wrapper)::set(this, 
                                           "v_sqr.configure_phase", 
                                           "default_sequence", 
                                           gpio_int_mask_clr_fd_vseq::type_id::get());
   uvm_config_db#(uvm_object_wrapper)::set(this, 
                                           "v_sqr.main_phase", 
                                           "default_sequence", 
                                           intr_priority_compare_vseq::type_id::get());
endfunction

`endif
