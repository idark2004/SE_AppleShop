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
public class BarChartDTO {
    private int revenue;
    private int month;

    public BarChartDTO() {
    }

    public BarChartDTO(int revenue, int month) {
        this.revenue = revenue;
        this.month = month;
    }

    public int getRevenue() {
        return revenue;
    }

    public void setRevenue(int revenue) {
        this.revenue = revenue;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }
    
    
}
