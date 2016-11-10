with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;

package body Send_Pump_Info_To_CashRegister_Task is

   task body send_Pump_Info_To_CashRegister_Task is

      topay: PUMP.FLOAT_NUMBER;
      pumpUnitId: CASH_REGISTER.PUMP_UNIT_ID;
   begin

      if unitID = 1 then
         topay:= PUMP_UNIT.GET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
         pumpUnitId.ID :=PUMP_UNIT.GET_ID(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
         pumpUnitId.TO_PAY := topay;
         pumpUnitId.PUMPED := PUMP_UNIT.GET_PUMPED(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
         pumpUnitId.FUEL := PUMP_UNIT.GET_FUEL(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
         CASH_REGISTER_OBJECT.cashRegister.UNIT_1 := pumpUnitId;
         print("set pumpunit 1 value to cash regesiter");
      elsif unitID = 2 then
         topay:= PUMP_UNIT.GET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
         pumpUnitId.ID :=PUMP_UNIT.GET_ID(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
         pumpUnitId.TO_PAY := topay;
         pumpUnitId.PUMPED := PUMP_UNIT.GET_PUMPED(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
         pumpUnitId.FUEL := PUMP_UNIT.GET_FUEL(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
         CASH_REGISTER_OBJECT.cashRegister.UNIT_2 := pumpUnitId;
         print("set pumpunit 2 value to cash regesiter");
      end if;



   end send_Pump_Info_To_CashRegister_Task;
end Send_Pump_Info_To_CashRegister_Task;
