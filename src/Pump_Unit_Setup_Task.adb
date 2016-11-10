with PUMP;
with PUMP_UNIT;
with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;

package body Pump_Unit_Setup_Task is
   UNIT_2 : PUMP_UNIT.PUMP_UNIT;
   UNIT_1 : PUMP_UNIT.PUMP_UNIT;


   task body pump_Unit_Setup_Task is
      --     type UNIT is new PUMP_UNIT;
      use all type PUMP.STATE_TYPE;
      use all type PUMP.FUEL_TYPES;

      --records
     -- UNIT_1 : PUMP_UNIT.PUMP_UNIT;
      UNIT_1_91: PUMP.PUMP;
      UNIT_1_95: PUMP.PUMP;
      UNIT_1_Diesel: PUMP.PUMP;

    --  UNIT_2 : PUMP_UNIT.PUMP_UNIT;
      UNIT_2_91: PUMP.PUMP;
      UNIT_2_95: PUMP.PUMP;
      UNIT_2_Diesel: PUMP.PUMP;

      U91: PUMP.FUEL_TYPES;
      U95: PUMP.FUEL_TYPES;
      Diesel: PUMP.FUEL_TYPES;
      --fuel
      F_U91: Integer :=0;
      F_U95: Integer :=1;
      F_Diesel: Integer :=2;

      type FLOAT_NUMBER is delta 0.01 digits 10;


   begin

      --fuel
      U91 :=PUMP.FUEL_TYPES'Val(F_U91);
      U95 :=PUMP.FUEL_TYPES'Val(F_U95);
      Diesel :=PUMP.FUEL_TYPES'Val(F_Diesel);
      -- add unit 1 pumps
      print("setup UNIT 1 pumps");
      PUMP_UNIT.SET_UNIT_ID(UNIT_1,"UNIT_1");
      PUMP_UNIT.ADD_PUMP(UNIT_1,UNIT_1_91, U91);
      PUMP_UNIT.ADD_PUMP(UNIT_1,UNIT_1_95, U95);
      PUMP_UNIT.ADD_PUMP(UNIT_1, UNIT_1_Diesel,Diesel);
      --unit 1 pumps
      UNIT_1_91:= PUMP_UNIT.GET_PUMP(UNIT_1,U91);
      UNIT_1_95:= PUMP_UNIT.GET_PUMP(UNIT_1,U95);
      UNIT_1_Diesel:= PUMP_UNIT.GET_PUMP(UNIT_1,Diesel);
      -- add unit 2 pumps
      print("setup UNIT 2 pumps");
      PUMP_UNIT.SET_UNIT_ID(UNIT_2,"UNIT_2");
      PUMP_UNIT.ADD_PUMP(UNIT_2,UNIT_2_91, U91);
      PUMP_UNIT.ADD_PUMP(UNIT_2,UNIT_2_95, U95);
      PUMP_UNIT.ADD_PUMP(UNIT_2, UNIT_2_Diesel,Diesel);
      --unit 2 pumps
      UNIT_2_91:= PUMP_UNIT.GET_PUMP(UNIT_2,U91);
      UNIT_2_95:= PUMP_UNIT.GET_PUMP(UNIT_2,U95);
      UNIT_2_Diesel:= PUMP_UNIT.GET_PUMP(UNIT_2,Diesel);
      PUMP_UNIT_OBJECTS.PUMP_UNIT_1:=UNIT_1;
      PUMP_UNIT_OBJECTS.PUMP_UNIT_2:=UNIT_2;
   end pump_Unit_Setup_Task;
end Pump_Unit_Setup_Task;
