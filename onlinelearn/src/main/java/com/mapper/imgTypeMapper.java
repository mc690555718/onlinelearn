package com.mapper;

import java.util.List;

import com.bean.img;
import com.bean.imgType;




public interface imgTypeMapper {
	
	   public void save (imgType imgType);
       public void delete(int typeId);
       public List<imgType>  listtype();
       public imgType getById(int typeId);
       public void update(imgType imgType);
    

}
