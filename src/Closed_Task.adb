with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Epoch;
with PUMP_UNIT_OBJECTS;
with CASH_REGISTER_OBJECT;

package body Closed_Task is
   task body closed_Task is
      use all type PUMP.FLOAT_NUMBER;
      use all type PUMP_UNIT.PUMP_UNIT_STATES;
      Period : constant Ada.Real_Time.Time_Span :=
        Ada.Real_Time.Microseconds(ClosingTime);

      Next_Period : Ada.Real_Time.Time;

      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

   begin
      Next_Period := Start_Epoch + Period;
      loop

         delay until Next_Period;
         if PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.Idle and
           PUMP_UNIT_OBJECTS.PUMP_UNIT_1.TO_PAY = 0.00 and
           PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.Idle and
           PUMP_UNIT_OBJECTS.PUMP_UNIT_2.TO_PAY = 0.00
         then
           print("System closed for the day");
            PUMP_UNIT.initial(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
            PUMP_UNIT.initial(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
            CASH_REGISTER.initial(CASH_REGISTER_OBJECT.cashRegister);
            CASH_REGISTER_OBJECT.cashRegister.STATE:=PUMP_UNIT.Closed;
            print("Closed: not allowed to sell fuel!");
         end if;

         Next_Period:=Next_Period+Period;
      end loop;
   end closed_Task;
end Closed_Task;
