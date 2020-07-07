package com.voidkey.md5;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class Encode {
  
  public String encode(String valor)
  {
    try {
      MessageDigest md = MessageDigest.getInstance("MD5");
      byte[] messageDigest = md.digest(valor.getBytes());
      BigInteger num = new BigInteger(1,messageDigest);
      String hash = num.toString(16);
      while(hash.length() < 32)
        hash="0"+hash;
      return hash;
    }catch(NoSuchAlgorithmException e)
    {
      return "-1";
    }
  }
  
}