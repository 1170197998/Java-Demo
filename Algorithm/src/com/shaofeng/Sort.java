package com.shaofeng;

//import com.ShaoFeng.Demo1;

public class Sort {

	public static void main(String[] args) {

		int[] array = {1,2,55,4,1,0,5,-5,4,1,-75,6,636,6,8,5,78};
		
		Sort sort = new Sort();
		sort.bubbleSort(array);
		
		for (int i = 0; i < array.length; i ++) {
			System.out.println(array[i]);
		}
	}
	
	//冒泡排序
	public void bubbleSort(int[] array) {
		for(int i = 0; i < array.length - 1; i++) {
			for (int j = 0; j <array.length - i - 1; j ++) {
				if (array[j] > array[j + 1]) {
					int temp = array[j];
					array[j] = array[j + 1];
					array[j + 1] = temp;
				}
			}
		}
	}
}
