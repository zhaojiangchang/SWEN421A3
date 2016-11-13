pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with Pump_Unit_Setup_Task;
with Send_Pump_Info_To_CashRegister_Task;
with Pay_Task;
with PUMP;
with PUMP_UNIT;
with PUMP_UNIT_OBJECTS;
with Authorisation_Task; use Authorisation_Task;
with Fuel_Type_Selection_Task;
with Enter_Total_Price_To_Pump_Task;

package taskRunner is  -- tasks run when  main starts
   SetupPumpUnitTask: Pump_Unit_Setup_Task.pump_Unit_Setup_Task(5); -- set up all pumps and pump units
   SetAuthorisationTask: Authorisation_Task.authorisation_Task(5,1); --Authorisation PUMP UNIT 1
   SelectFuelTypeTask: Fuel_Type_Selection_Task.Fuel_Type_Selection_Task(5,1, PUMP.U91);
   EnterTotalPriceToPumpTask: Enter_Total_Price_To_Pump_Task.enter_Total_Price_To_Pump_Task(5,1, 100);

   SendPumpInfoToCashRegisterTask:  Send_Pump_Info_To_CashRegister_Task.send_Pump_Info_To_CashRegister_Task(5, 1); -- when finish pumping, send info to cash register
   PayTask: Pay_Task.pay_Task(5,1, 100); -- customer Pay 100 dollor for PUMP UNIT 1.
end taskRunner;
