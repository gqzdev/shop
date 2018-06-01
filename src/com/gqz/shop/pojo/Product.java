package com.gqz.shop.pojo;

import java.util.Date;

public class Product {
    private Integer pid;

    private String pname;

    private Double newPrice;

    private Double oldPrice;

    private String image;

    private Integer isHot;

    private Date pdate;

    private Integer cid;

    private Integer state;

    private Integer total;

    private Integer volume;

    private Integer isPic;

    private String pdesc;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public Double getNewPrice() {
        return newPrice;
    }

    public void setNewPrice(Double newPrice) {
        this.newPrice = newPrice;
    }

    public Double getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(Double oldPrice) {
        this.oldPrice = oldPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getVolume() {
        return volume;
    }

    public void setVolume(Integer volume) {
        this.volume = volume;
    }

    public Integer getIsPic() {
        return isPic;
    }

    public void setIsPic(Integer isPic) {
        this.isPic = isPic;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc == null ? null : pdesc.trim();
    }

	@Override
	public String toString() {
		return "Product [cid=" + cid + ", image=" + image + ", isHot=" + isHot
				+ ", isPic=" + isPic + ", newPrice=" + newPrice + ", oldPrice="
				+ oldPrice + ", pdate=" + pdate + ", pdesc=" + pdesc + ", pid="
				+ pid + ", pname=" + pname + ", state=" + state + ", total="
				+ total + ", volume=" + volume + "]";
	}
    
    
    
}