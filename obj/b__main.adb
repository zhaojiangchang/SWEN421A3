pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E102 : Short_Integer; pragma Import (Ada, E102, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "ada__io_exceptions_E");
   E046 : Short_Integer; pragma Import (Ada, E046, "ada__strings_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__strings__maps_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings__maps__constants_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "ada__tags_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "ada__streams_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "interfaces__c_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "interfaces__c__strings_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exceptions_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "system__file_control_block_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "system__file_io_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "system__finalization_root_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "ada__finalization_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "system__task_info_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "system__object_reader_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "system__dwarf_lines_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__secondary_stack_E");
   E036 : Short_Integer; pragma Import (Ada, E036, "system__traceback__symbolic_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "ada__real_time_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__text_io_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__tasking__restricted__stages_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "pump_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "pump_unit_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "cash_register_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "pump_unit_objects_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "pay_task_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "pump_unit_setup_task_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "send_pump_info_to_cashregister_task_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "sprint_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "taskrunner_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E006 := E006 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__text_io__finalize_spec");
      begin
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "system__file_io__finalize_body");
      begin
         E097 := E097 - 1;
         F2;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      Partition_Elaboration_Policy : Character;
      pragma Import (C, Partition_Elaboration_Policy, "__gnat_partition_elaboration_policy");

      procedure Activate_All_Tasks_Sequential;
      pragma Import (C, Activate_All_Tasks_Sequential, "__gnat_activate_all_tasks");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      Partition_Elaboration_Policy := 'S';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E087 := E087 + 1;
      Ada.Strings'Elab_Spec;
      E046 := E046 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E052 := E052 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E086 := E086 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E025 := E025 + 1;
      System.File_Control_Block'Elab_Spec;
      E105 := E105 + 1;
      System.Finalization_Root'Elab_Spec;
      E100 := E100 + 1;
      Ada.Finalization'Elab_Spec;
      E098 := E098 + 1;
      System.Task_Info'Elab_Spec;
      E153 := E153 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      System.File_Io'Elab_Body;
      E097 := E097 + 1;
      E140 := E140 + 1;
      E063 := E063 + 1;
      Ada.Tags'Elab_Body;
      E089 := E089 + 1;
      E048 := E048 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Os_Lib'Elab_Body;
      E102 := E102 + 1;
      System.Secondary_Stack'Elab_Body;
      E017 := E017 + 1;
      E041 := E041 + 1;
      E061 := E061 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E036 := E036 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E162 := E162 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E006 := E006 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E132 := E132 + 1;
      PUMP_UNIT_OBJECTS'ELAB_SPEC;
      E164 := E164 + 1;
      E109 := E109 + 1;
      Send_Pump_Info_To_Cashregister_Task'Elab_Body;
      E168 := E168 + 1;
      Pump_Unit_Setup_Task'Elab_Body;
      E166 := E166 + 1;
      Pay_Task'Elab_Body;
      E130 := E130 + 1;
      E107 := E107 + 1;
      E127 := E127 + 1;
      E111 := E111 + 1;
      Taskrunner'Elab_Spec;
      E128 := E128 + 1;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\JackyChang\Desktop\421A1\obj\Cash_Register_Object.o
   --   C:\Users\JackyChang\Desktop\421A1\obj\Pump_Unit_Objects.o
   --   C:\Users\JackyChang\Desktop\421A1\obj\sPrint.o
   --   C:\Users\JackyChang\Desktop\421A1\obj\Send_Pump_Info_To_CashRegister_Task.o
   --   C:\Users\JackyChang\Desktop\421A1\obj\Pump_Unit_Setup_Task.o
   --   C:\Users\JackyChang\Desktop\421A1\obj\Pay_Task.o
   --   C:\Users\JackyChang\Desktop\421A1\obj\cash_register.o
   --   C:\Users\JackyChang\Desktop\421A1\obj\pump_unit.o
   --   C:\Users\JackyChang\Desktop\421A1\obj\pump.o
   --   C:\Users\JackyChang\Desktop\421A1\obj\TaskRunner.o
   --   C:\Users\JackyChang\Desktop\421A1\obj\main.o
   --   -LC:\Users\JackyChang\Desktop\421A1\obj\
   --   -LC:\Users\JackyChang\Desktop\421A1\obj\
   --   -LC:/gnat/2016/lib/gcc/i686-pc-mingw32/4.9.4/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
