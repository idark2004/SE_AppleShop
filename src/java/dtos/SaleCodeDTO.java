/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author phath
 */
public class SaleCodeDTO {

    private String codeID;
    private String codeName;
    private String percentage;
    private String createDate;
    private String expDate;
    private boolean codeStatus;

    public SaleCodeDTO() {
    }

    public SaleCodeDTO(String codeID, String codeName, String percentage, String createDate, String expDate, boolean codeStatus) {
        this.codeID = codeID;
        this.codeName = codeName;
        this.percentage = percentage;
        this.createDate = createDate;
        this.expDate = expDate;
        this.codeStatus = codeStatus;
    }

    public SaleCodeDTO(String codeID, String codeName, String percentage, String expDate) {
        this.codeID = codeID;
        this.codeName = codeName;
        this.percentage = percentage;
        this.expDate = expDate;
    }

    public boolean getCodeStatus() {
        return codeStatus;
    }

    public void setCodeStatus(boolean codeStatus) {
        this.codeStatus = codeStatus;
    }

    public String getPercentage() {
        return percentage;
    }

    public void setPercentage(String percentage) {
        this.percentage = percentage;
    }

    public String getCodeID() {
        return codeID;
    }

    public void setCodeID(String codeID) {
        this.codeID = codeID;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getExpDate() {
        return expDate;
    }

    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }

}
