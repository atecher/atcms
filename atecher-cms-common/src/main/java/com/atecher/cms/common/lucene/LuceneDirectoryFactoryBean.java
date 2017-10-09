package com.atecher.cms.common.lucene;

import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.SimpleFSDirectory;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

public class LuceneDirectoryFactoryBean{

	private String indexPath;
	public FSDirectory getFSDirectory() throws Exception {
		File indexDir=new File(indexPath);
		Path path=indexDir.toPath();
		try {
			return new SimpleFSDirectory(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public void setIndexPath(String indexPath) {
		this.indexPath = indexPath;
	}


}
