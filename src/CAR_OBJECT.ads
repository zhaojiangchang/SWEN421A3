with PUMP;
with PUMP_UNIT;

package CAR_OBJECT
with SPARK_Mode is

    type Car is
      record
         TANK_SIZE: PUMP.FLOAT_NUMBER:=30.0;
         PUMP_UNIT_LOCATION: PUMP_UNIT.UNIT_ID_TYPE;
      end record;
   CAR_1: Car;
   CAR_2: Car;


   end CAR_OBJECT;
