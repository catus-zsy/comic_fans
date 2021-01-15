package mgclass;

public class Manga_Content {
	public String mcimgid;
	public String mcpage;
	public String mctotal_pages;
	public String mcchapter;
	
	public void setimgid(String imgid) {
		this.mcimgid=imgid;
	}
	public void setpage(String page) {
		this.mcpage=page;
	}
	public void settotal_pages(String total_pages) {
		this.mctotal_pages=total_pages;
	}
	public void setchapter(String chapter) {
		this.mcchapter=chapter;
	}
	
	public String getimgid() {
		return mcimgid;
	}
	public String getpage() {
		return mcpage;
	}
	public String gettotal_pages() {
		return mctotal_pages;
	}
	public String getchapter() {
		return mcchapter;
	}
}
