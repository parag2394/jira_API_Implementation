import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.*;

import org.apache.poi.hssf.record.cf.PatternFormatting;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.ConditionalFormattingRule;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.SheetConditionalFormatting;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
public class Test {

	
	 public static void shadeAlt(Sheet sheet) {
	    SheetConditionalFormatting sheetCF = sheet.getSheetConditionalFormatting();
	 
	    // Condition 1: Formula Is   =A2=A1   (White Font)
	    ConditionalFormattingRule rule1 = sheetCF.createConditionalFormattingRule("MOD(ROW(),2)");
	    org.apache.poi.ss.usermodel.PatternFormatting fill1 = rule1.createPatternFormatting();
	    fill1.setFillBackgroundColor(IndexedColors.LIGHT_GREEN.index);
	    fill1.setFillPattern(PatternFormatting.SOLID_FOREGROUND);
	 
	    CellRangeAddress[] regions = {
	            (CellRangeAddress) CellRangeAddress.valueOf("A1:Z100")
	    };
	 
	    sheetCF.addConditionalFormatting(regions, rule1);
	 
	    sheet.createRow(0).createCell(1).setCellValue("Shade Alternating Rows");
	    sheet.createRow(1).createCell(1).setCellValue("Condition: Formula Is  =MOD(ROW(),2)   (Light Green Fill)");
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
