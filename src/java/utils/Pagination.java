/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dtos.ProductDTO;
import java.util.List;

/**
 *
 * @author anime
 */
public class Pagination {
    private int currentPage;
    private int numOfPage;

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getNumOfPage() {
        return numOfPage;
    }

    public void setNumOfPage(int numOfPage) {
        this.numOfPage = numOfPage;
    }
    
    public List PaginatedList(int requestPage,List list,int pageSize){
                    int page;
                    int listLength = list.size();
                    List<ProductDTO> subList=null;
                    int pages = 0;
                    if (listLength % pageSize == 0) {
                        pages = listLength / pageSize;
                    } else {
                        pages = (listLength / pageSize) + 1;
                    }
                    page = requestPage;
                    if(page <=0){
                        page = 1;
                    }
                    if(page>pageSize){
                        page=pages;
                    }
                    
                    if (requestPage != 0) {
                        if (listLength >= (page * pageSize)) {
                            subList = list.subList(((page - 1) * pageSize), (page * pageSize));
                            
                        } else {
                            subList = list.subList(((page - 1) * pageSize), listLength);
                            
                        }
                    } else {
                        if (listLength < pageSize) {
                            return list;
                        } else {
                            subList = list.subList(0, pageSize);
                            
                        }
                    }
                    this.setCurrentPage(page);                   
                    this.setNumOfPage(pages);
                    return subList;
    }
}
