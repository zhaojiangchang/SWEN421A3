with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Epoch;

package body Authorisation_Task is
   use all type PUMP.FLOAT_NUMBER;
   use all type PUMP_UNIT.PUMP_UNIT_STATES;
   task body authorisation_Task is
      Period : constant Ada.Real_Time.Time_Span :=
        Ada.Real_Time.Microseconds(100);

      Next_Period : Ada.Real_Time.Time;

      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;
   begin

      if unitID = 1 then
         Next_Period := Start_Epoch + Period;
         while PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.Started
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.Fuelling
             or PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.Closed
             or PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.No

         loop
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;
         PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE:=PUMP_UNIT.Authorised;
         PUMP_UNIT_OBJECTS.PUMP_UNIT_1.ActivePumpUnit:=True;

         print("======================================");
         print(" PUMP_UNIT_1 Authorisated - Idle state");
         print("======================================");
      elsif  unitID = 2 then
         Next_Period := Start_Epoch + Period;
         while PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.Started
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.Fuelling
             or PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.Closed
             or PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.No

         loop
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;
         PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE:=PUMP_UNIT.Authorised;
         PUMP_UNIT_OBJECTS.PUMP_UNIT_2.ActivePumpUnit:=True;

         print("======================================");
         print(" PUMP_UNIT_2 Authorisated - Idle state");
         print("======================================");
      end if;

   end authorisation_Task;
end Authorisation_Task;
