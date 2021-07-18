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
public class GuaranteeDTO {
    private String guarantID;
    private String orderID;
    private String receiveDate;
    private String expectedDate;
    private String guarantDescription;
    private String ownerName;
    private String contactNumber;
    private String guarantFee;
    private String gurantStatus;

    public GuaranteeDTO() {
    }

    public GuaranteeDTO(String guarantID, String orderID, String receiveDate, String expectedDate, String guarantDescription, String ownerName, String contactNumber, String guarantFee, String gurantStatus) {
        this.guarantID = guarantID;
        this.orderID = orderID;
        this.receiveDate = receiveDate;
        this.expectedDate = expectedDate;
        this.guarantDescription = guarantDescription;
        this.ownerName = ownerName;
        this.contactNumber = contactNumber;
        this.guarantFee = guarantFee;
        this.gurantStatus = gurantStatus;
    }    

    public GuaranteeDTO(String orderID, String receiveDate, String expectedDate, String guarantDescription, String ownerName, String contactNumber, String guarantFee, String gurantStatus) {
        this.orderID = orderID;
        this.receiveDate = receiveDate;
        this.expectedDate = expectedDate;
        this.guarantDescription = guarantDescription;
        this.ownerName = ownerName;
        this.contactNumber = contactNumber;
        this.guarantFee = guarantFee;
        this.gurantStatus = gurantStatus;
    }
     

    public String getGuarantID() {
        return guarantID;
    }

    public void setGuarantID(String guarantID) {
        this.guarantID = guarantID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getReceiveDate() {
        return receiveDate;
    }

    public void setReceiveDate(String receiveDate) {
        this.receiveDate = receiveDate;
    }

    public String getExpectedDate() {
        return expectedDate;
    }

    public void setExpectedDate(String expectedDate) {
        this.expectedDate = expectedDate;
    }

    public String getGuarantDescription() {
        return guarantDescription;
    }

    public void setGuarantDescription(String guarantDescription) {
        this.guarantDescription = guarantDescription;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getGurantStatus() {
        return gurantStatus;
    }

    public void setGurantStatus(String gurantStatus) {
        this.gurantStatus = gurantStatus;
    }

    public String getGuarantFee() {
        return guarantFee;
    }

    public void setGuarantFee(String guarantFee) {
        this.guarantFee = guarantFee;
    }

    
    
    
}
