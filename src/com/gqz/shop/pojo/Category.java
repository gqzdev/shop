package com.gqz.shop.pojo;

import java.io.Serializable;

public class Category implements Serializable{
    /**
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	*/
	private static final long serialVersionUID = 3140590850238017076L;

	private Integer cid;

    private String cname;

    private Integer state;

    @Override
	public String toString() {
		return "Category [cid=" + cid + ", cname=" + cname + ", state=" + state
				+ "]";
	}

	public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}