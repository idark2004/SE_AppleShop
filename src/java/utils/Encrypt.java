/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.security.MessageDigest;

/**
 *
 * @author phath
 */
public class Encrypt {
    public String encryptPass(String plain) {
        try{
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(plain.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();        
            for (int i=0; i<hash.length; i++){
                String hex = Integer.toHexString(0xff & hash[i]);
                if(hex.length() == 1) hexString.append("0");
                hexString.append(hex);
            }
      return hexString.toString();  
        }
        catch(Exception e){
            System.out.println(e.toString());
            return null;
        }
    }
}
