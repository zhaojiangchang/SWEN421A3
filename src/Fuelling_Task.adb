with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Epoch;

package body Fuelling_Task is
   use all type PUMP.FLOAT_NUMBER;
   use all type PUMP_UNIT.PUMP_UNIT_STATES;

   task body fuelling_Task is
      Period : constant Ada.Real_Time.Time_Span :=
        Ada.Real_Time.Microseconds(100);

      Next_Period : Ada.Real_Time.Time;

      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;
   begin
      if unitID = 1 then
         Next_Period := Start_Epoch + Period;
         while PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE /= PUMP_UNIT.Fuelling
         loop
            print("---------------------");
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;
         if CAR_OBJECT.CAR_1.PUMP_UNIT_LOCATION = "UNIT_1" then
            print_fuel_type("Car 1 start pumping at PUMP_UNIT_1: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE );
            PUMP_UNIT.START_PUMPING(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ENTERED_AMOUNT, CAR_OBJECT.CAR_1.TANK_SIZE);
         elsif CAR_OBJECT.CAR_2.PUMP_UNIT_LOCATION = "UNIT_1" then
            print_fuel_type("Car 2 start pumping at PUMP_UNIT_1: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE );
            PUMP_UNIT.START_PUMPING(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ENTERED_AMOUNT, CAR_OBJECT.CAR_2.TANK_SIZE);
         end if;
         if PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP.SENSOR = True then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.PUMP_ACTIVE_STATE :=PUMP.Ready;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP.PUMP_STATE:=PUMP.Ready;
               PUMP_UNIT.RETURN_NOZZLE(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP);
         end if;
         PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE := PUMP_UNIT.SendInfoToCR;
         PUMP_UNIT_OBJECTS.PUMP_UNIT_1.PUMP_ACTIVE_STATE := PUMP.Waiting;

      elsif unitID = 2 then
         Next_Period := Start_Epoch + Period;
         while PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE /= PUMP_UNIT.Fuelling
         loop
            print("++++++++++++++++++++++");
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;
           if CAR_OBJECT.CAR_1.PUMP_UNIT_LOCATION = "UNIT_2" then
            print_fuel_type("Car 1 start pumping at PUMP_UNIT_2: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.FUEL_TYPE );
            PUMP_UNIT.START_PUMPING(PUMP_UNIT_OBJECTS.PUMP_UNIT_2,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ENTERED_AMOUNT, CAR_OBJECT.CAR_1.TANK_SIZE);
         elsif CAR_OBJECT.CAR_2.PUMP_UNIT_LOCATION = "UNIT_2" then
            print_fuel_type("Car 2 start pumping at PUMP_UNIT_2: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.FUEL_TYPE );
            PUMP_UNIT.START_PUMPING(PUMP_UNIT_OBJECTS.PUMP_UNIT_2,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ENTERED_AMOUNT, CAR_OBJECT.CAR_2.TANK_SIZE);
         end if;
         if PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP.SENSOR = True then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.PUMP_ACTIVE_STATE :=PUMP.Ready;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP.PUMP_STATE:=PUMP.Ready;
               PUMP_UNIT.RETURN_NOZZLE(PUMP_UNIT_OBJECTS.PUMP_UNIT_2,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP);
         end if;
         PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE := PUMP_UNIT.SendInfoToCR;
         PUMP_UNIT_OBJECTS.PUMP_UNIT_2.PUMP_ACTIVE_STATE := PUMP.Waiting;
      end if;

   end fuelling_Task;
end Fuelling_Task;
