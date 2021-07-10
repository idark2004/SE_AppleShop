/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author ADMIN
 */
public class AreaChartDTO {
    private int revenue;
    private String date;

    public AreaChartDTO() {
    }

    public AreaChartDTO(int revenue, String date) {
        this.revenue = revenue;
        this.date = date;
    }

    public int getRevenue() {
        return revenue;
    }

    public void setRevenue(int revenue) {
        this.revenue = revenue;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    
}
