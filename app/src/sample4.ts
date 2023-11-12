import { differenceInDays, format } from "date-fns";
import { ja } from "date-fns/locale";

export const main = () => {
  const date = new Date();
  console.log(`yyyy-mm-dd : ${format(date, "yyyy-mm-dd")}`);
  console.log(`PPPP : ${format(date, "PPPP", { locale: ja })}`);
  console.log(`現在日 - 1970年1月1日の日数 : ${differenceInDays(date, new Date(0))}`);
};

main();
