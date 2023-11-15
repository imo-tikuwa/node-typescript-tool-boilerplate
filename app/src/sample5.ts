import * as fs from "fs";
import { parse } from "csv-parse/sync";
import { stringify } from "csv-stringify/sync";
import type { Sample5CsvRow } from "./types";

export const main = () => {
  const readFilePath = "./sample5input.csv";
  const writeFilePath = "./sample5output.csv";

  const filteredCsvData = parse(fs.readFileSync(readFilePath), {
    columns: true,
    onRecord(record: Sample5CsvRow) {
      // 30歳以下 or 職業がエンジニアのレコードのみ抽出
      if (record.age <= 30 || record.occupation === "エンジニア") {
        return record;
      }
      return null;
    },
  });

  const csvData = stringify(filteredCsvData, { header: true });
  fs.writeFileSync(writeFilePath, csvData);
};

main();
