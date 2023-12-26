package chap04.servlet;

import java.util.ArrayList;
import java.util.List;

public class MemoDataManager {
	
	private static List<Memo> memos = new ArrayList<>();
	
	public static void addMemo(Memo memo) {
		memos.add(memo);
	}
	
	public static List<Memo> getMemo(String userId){
		List<Memo> userMemos = new ArrayList<>();
		for(Memo memo : memos) {
			if(memo.getUserId().equals(userId)) {
				userMemos.add(memo);
			}
		}
		return userMemos;
	}

}
