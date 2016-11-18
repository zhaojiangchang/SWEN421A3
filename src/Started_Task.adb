with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Epoch;

package body Started_Task is
   use all type PUMP.FLOAT_NUMBER;
   use all type PUMP_UNIT.PUMP_UNIT_STATES;

   task body started_Task is
      Period : constant Ada.Real_Time.Time_Span :=
        Ada.Real_Time.Microseconds(100);

      Next_Period : Ada.Real_Time.Time;

      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;
   begin
      if unitID = 1 then
         Next_Period := Start_Epoch + Period;
         while PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.Authorised
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.Inoperative
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE =PUMP_UNIT.Closed
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.Idle
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.Calling
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.No
         loop
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;

         if PUMP_UNIT_OBJECTS.PUMP_UNIT_1.IS_AMOUNT_ENTERD = True then
            print("====================================================");
            PUMP_UNIT_OBJECTS.PUMP_UNIT_1.PUMP_ACTIVE_STATE:=PUMP.Base;
            PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE:=PUMP_UNIT.Fuelling;
            if CAR_OBJECT.CAR_1.PUMP_UNIT_LOCATION = "UNIT_1" then
               PUMP_UNIT.LEFT_NOZZLE(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE);
               print_fuel_type("Car 1 Parked at PUMP_UNIT_1 and Nozzle out: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE );
            elsif CAR_OBJECT.CAR_2.PUMP_UNIT_LOCATION = "UNIT_1" then
               PUMP_UNIT.LEFT_NOZZLE(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE);

               print_fuel_type("Car 2 Parked at PUMP_UNIT_1 and Nozzle out: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE );
            end if;
            print("=====================================================");
         end if;

      elsif unitID = 2 then
         Next_Period := Start_Epoch + Period;
         while PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.Authorised
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.Inoperative
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE =PUMP_UNIT.Closed
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.Idle
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.Calling
           or PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.No
         loop
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;
             if PUMP_UNIT_OBJECTS.PUMP_UNIT_2.IS_AMOUNT_ENTERD = True then
            print("====================================================");
            PUMP_UNIT_OBJECTS.PUMP_UNIT_2.PUMP_ACTIVE_STATE:=PUMP.Base;
            PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE:=PUMP_UNIT.Fuelling;
            if CAR_OBJECT.CAR_1.PUMP_UNIT_LOCATION = "UNIT_2" then
               PUMP_UNIT.LEFT_NOZZLE(PUMP_UNIT_OBJECTS.PUMP_UNIT_2,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.FUEL_TYPE);
               print_fuel_type("Car 1 Parked at PUMP_UNIT_2 and Nozzle out: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.FUEL_TYPE );
            elsif CAR_OBJECT.CAR_2.PUMP_UNIT_LOCATION = "UNIT_2" then
               PUMP_UNIT.LEFT_NOZZLE(PUMP_UNIT_OBJECTS.PUMP_UNIT_2,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.FUEL_TYPE);

               print_fuel_type("Car 2 Parked at PUMP_UNIT_2 and Nozzle out: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.FUEL_TYPE );
            end if;
            print("=====================================================");
         end if;
      end if;

   end started_Task;
end Started_Task;
