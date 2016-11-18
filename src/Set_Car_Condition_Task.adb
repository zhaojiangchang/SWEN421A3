with PUMP;
with PUMP_UNIT;
with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;

package body Set_Car_Condition_Task is

   task body set_Car_Condition_Task is
      tank_size: PUMP.FLOAT_NUMBER;
   begin
      tank_size:= PUMP.FLOAT_NUMBER(tankSize);
      print("============================");
      if CAR_OBJECT.Cars'Pos(car) = 0 then
         CAR_OBJECT.CAR_1.TANK_SIZE :=tank_size;
         if PUMP_UNIT_OBJECTS.PUMP_UNITS'Pos(location) = 0 then
            CAR_OBJECT.CAR_1.PUMP_UNIT_LOCATION:="UNIT_1";
         elsif PUMP_UNIT_OBJECTS.PUMP_UNITS'Pos(location) =1 then
            CAR_OBJECT.CAR_1.PUMP_UNIT_LOCATION:="UNIT_2";
         end if;
         print("Car 1 parked at PUMP_UNIT 1");
      elsif CAR_OBJECT.Cars'Pos(car) = 1 then
         CAR_OBJECT.CAR_2.TANK_SIZE :=tank_size;
         if PUMP_UNIT_OBJECTS.PUMP_UNITS'Pos(location) = 0 then
            CAR_OBJECT.CAR_2.PUMP_UNIT_LOCATION:="UNIT_1";
         elsif PUMP_UNIT_OBJECTS.PUMP_UNITS'Pos(location) =1 then
            CAR_OBJECT.CAR_2.PUMP_UNIT_LOCATION:="UNIT_2";
         end if;
         print("Car 2 parked at PUMP_UNIT 1");
      end if;
      print("============================");

   end set_Car_Condition_Task;
end Set_Car_Condition_Task;
