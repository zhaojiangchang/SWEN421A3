pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with Ada.Text_IO; use Ada.Text_IO;
with PUMP;
with PUMP_UNIT;
with PUMP_UNIT_OBJECTS;
with CAR_OBJECT;
with Pump_Unit_Setup_Task;
with Cash_Register_Setup_Task;
with Authorise_Cash_Register_Task;
with Set_Car_Condition_Task;
with Authorisation_Task;
with Fuel_Type_Selection_Task;
with Enter_Amont_To_Pump_Task;
with Started_Task;
with Fuelling_Task;
with SuspendedFuelling_Task;
with Send_Pump_Info_To_CashRegister_Task;
with Pay_Task;
with Closed_Task;


package taskRunner is  -- tasks run when  main starts
   SetupPumpUnitTask: Pump_Unit_Setup_Task.pump_Unit_Setup_Task(5); -- set up all pumps and pump units
   SetupCashRegisterTask: Cash_Register_Setup_Task.cash_Register_Setup_Task(5);
   AuthorisationCashRegisterTask: Authorise_Cash_Register_Task.authorise_Cash_Register_Task(5);
   SetCarConditionTask1: Set_Car_Condition_Task.set_Car_Condition_Task(5, CAR_OBJECT.car1,PUMP_UNIT_OBJECTS.pumpUnit1, 3);
   SetCarConditionTask2: Set_Car_Condition_Task.set_Car_Condition_Task(5, CAR_OBJECT.car2,PUMP_UNIT_OBJECTS.pumpUnit2, 3);
   SelectFuelTypeTask1: Fuel_Type_Selection_Task.Fuel_Type_Selection_Task(5,1, PUMP.U91); -- U91 fuel
   SelectFuelTypeTask2: Fuel_Type_Selection_Task.Fuel_Type_Selection_Task(5,2, PUMP.U95); -- U91 fuel
   EnterAmontToPumpTask1: Enter_Amont_To_Pump_Task.enter_Amont_To_Pump_Task(5,1, 100);--100 = amont to fill not money
   EnterAmontToPumpTask2: Enter_Amont_To_Pump_Task.enter_Amont_To_Pump_Task(5,2, 100);--100 = amont to fill not money
   StartedTask1: Started_Task.started_Task(5,1);
   StartedTask2: Started_Task.started_Task(5,2);
   AuthorisationPumpUnitTask1: Authorisation_Task.authorisation_Task(5,1); --Authorisation PUMP UNIT 1
   AuthorisationPumpUnitTask2: Authorisation_Task.authorisation_Task(5,2); --Authorisation PUMP UNIT 2
   FuellingTask1: Fuelling_Task.fuelling_Task(5,1);
   FuellingTask2: Fuelling_Task.fuelling_Task(5,2);
   SuspendedFuellingTask1: SuspendedFuelling_Task.suspendedFuelling_Task(5,1);
   SuspendedFuellingTask2: SuspendedFuelling_Task.suspendedFuelling_Task(5,2);
   SendPumpInfoToCashRegisterTask1:  Send_Pump_Info_To_CashRegister_Task.send_Pump_Info_To_CashRegister_Task(5, 1); -- when finish pumping, send info to cash register
   SendPumpInfoToCashRegisterTask2:  Send_Pump_Info_To_CashRegister_Task.send_Pump_Info_To_CashRegister_Task(5, 2); -- when finish pumping, send info to cash register
   PayTask1: Pay_Task.pay_Task(5,1, 100); -- customer Pay 100 dollor for PUMP UNIT 1.
   PayTask2: Pay_Task.pay_Task(5,2, 50); -- customer Pay 100 dollor for PUMP UNIT 1.
   ClosedTask: Closed_Task.closed_Task(5,20);
end taskRunner;
