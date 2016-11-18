with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Epoch;


package body Operating_State_Task is
   use all type PUMP_UNIT.PUMP_UNIT_STATES;
   task body operating_State_Task is
      Period : constant Ada.Real_Time.Time_Span :=
        Ada.Real_Time.Microseconds(100);

      Next_Period : Ada.Real_Time.Time;

      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

   begin
      Next_Period := Start_Epoch + Period;
      while CASH_REGISTER_OBJECT.cashRegister.STATE = PUMP_UNIT.Inoperative
      loop
         delay until Next_Period;
         Next_Period:=Next_Period+Period;
      end loop;
      if CASH_REGISTER_OBJECT.cashRegister.STATE = PUMP_UNIT.Closed then
         CASH_REGISTER_OBJECT.cashRegister.STATE := PUMP_UNIT.Idle;
         PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE:=PUMP_UNIT.Idle;
         PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE:=PUMP_UNIT.Idle;
         print("Change cash register and pump units state to Idle");
      end if;

   end operating_State_Task;
end Operating_State_Task;
