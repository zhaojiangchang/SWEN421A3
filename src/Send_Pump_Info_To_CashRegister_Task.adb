with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Epoch;
package body Send_Pump_Info_To_CashRegister_Task is

   task body send_Pump_Info_To_CashRegister_Task is
      Period : constant Ada.Real_Time.Time_Span :=
        Ada.Real_Time.Microseconds(100);

      Next_Period : Ada.Real_Time.Time;

      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;
      topay: PUMP.FLOAT_NUMBER;
      pumpUnitId: CASH_REGISTER.PUMP_UNIT_ID;
   begin

      if unitID = 1 then
         Next_Period := Start_Epoch + Period;
         while PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE /= PUMP_UNIT.SendInfoToCR
         loop
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;
         if PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.SendInfoToCR then
            topay:= PUMP_UNIT.GET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
            pumpUnitId.ID :=PUMP_UNIT.GET_ID(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
            pumpUnitId.TO_PAY := topay;
            pumpUnitId.PUMPED := PUMP_UNIT.GET_PUMPED(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
            pumpUnitId.FUEL := PUMP_UNIT.GET_FUEL(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
            CASH_REGISTER_OBJECT.cashRegister.UNIT_1 := pumpUnitId;
            print("Sent pumpunit 1 information to cash regesiter");
            PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE := PUMP_UNIT.Pay;
         end if;

      elsif unitID = 2 then
         Next_Period := Start_Epoch + Period;
         while PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE /= PUMP_UNIT.SendInfoToCR
         loop
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;
         if PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.SendInfoToCR then
            topay:= PUMP_UNIT.GET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
            pumpUnitId.ID :=PUMP_UNIT.GET_ID(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
            pumpUnitId.TO_PAY := topay;
            pumpUnitId.PUMPED := PUMP_UNIT.GET_PUMPED(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
            pumpUnitId.FUEL := PUMP_UNIT.GET_FUEL(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
            CASH_REGISTER_OBJECT.cashRegister.UNIT_2 := pumpUnitId;
            print("Sent pumpunit 2 information to cash regesiter");
            PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE := PUMP_UNIT.Pay;
         end if;

      end if;



   end send_Pump_Info_To_CashRegister_Task;
end Send_Pump_Info_To_CashRegister_Task;
