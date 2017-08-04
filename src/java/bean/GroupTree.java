/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ubuntu
 */
public class GroupTree {
    HashMap<Integer,ArrayList<HashMap<Integer,String> > > ra = new HashMap<Integer,ArrayList<HashMap<Integer,String > > >();

    public HashMap<Integer, ArrayList<HashMap<Integer, String>>> getRa() {
        return ra;
    }

    public void setRa(HashMap<Integer, ArrayList<HashMap<Integer, String>>> ra) {
        this.ra = ra;
    }

    
    
    
}
