pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with Pump_Unit_Setup_Task;
with Send_Pump_Info_To_CashRegister_Task;
with Pay_Task;
with PUMP_UNIT;
with PUMP_UNIT_OBJECTS;
package taskRunner is  -- tasks run when  main starts
   SetupPumpUnitTask: Pump_Unit_Setup_Task.pump_Unit_Setup_Task(5);

   SendPumpInfoToCashRegisterTask:  Send_Pump_Info_To_CashRegister_Task.send_Pump_Info_To_CashRegister_Task(5, 1);
   PayTask: Pay_Task.pay_Task(5,1, 100);
end taskRunner;